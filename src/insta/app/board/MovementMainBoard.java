package insta.app.board;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;
import insta.app.dto.BoardDTO;
import insta.app.dto.BoardFileDTO;
import insta.app.dto.FollowDTO;
import insta.app.dto.MainBoardDTO;
import insta.app.dto.RecommandAllDTO;
import insta.app.dto.ReplyDTO;
import insta.app.dto.UserDTO;

public class MovementMainBoard implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward result = new ActionForward();
		if(req.getSession().getAttribute("loginUser") == null) {
			result.setPath("/user/UserLogin.us");
			result.setRedirect(false);
			return result;
		}
		String loginUserId = ((UserDTO)(req.getSession().getAttribute("loginUser"))).getUser_id();
//		String loginUserId = req.getParameter("loginUserId");
		SeongHakDAO hakDao = new SeongHakDAO();
//		로그인한 유저가 없다면
		if(loginUserId == null) {
			result.setPath("/user/UserLogin.us");
			result.setRedirect(false);
		}
//		로그인한 유저가 있다면
		else {
			UserDTO loginUser = hakDao.getloginUserInfo(loginUserId);
			req.setAttribute("loginUser", loginUser);
//		========================================================================회원님을 위한 추천 관련=========================================================================
//			자신이 팔로우하지 않은 유저들의 정보를 받아온다.
			List<UserDTO> recommandList = hakDao.getRecommandUserList(loginUserId);
//			req.setAttribute로 넘겨줄 ArrayList(추천에 띄어줄 모든 유저의 정보가 들어있음)
			ArrayList<RecommandAllDTO> resultRecommandList = null;
//			이 if문으로 들어오면 로그인한 유저가 팔로우하지 않은 다른 유저들이 존재하는 것이다
			if(recommandList.size() != 0) {
//				이 경우에는 로그인한 유저가 팔로우하지 않은 유저가 1명이상 존재하므로 ArrayList를 생성자로 만들어준다
				resultRecommandList = new ArrayList<RecommandAllDTO>();
//				recommandList에서 1명씩 가져와서 for 내부를 수행한다
				for(UserDTO recommandUser : recommandList) {
					RecommandAllDTO user = new RecommandAllDTO();
//					추천할 유저의 id를 저장한다. (기본키라 null값 없음)
					user.setUserId(recommandUser.getUser_id());																						//	userId
//					추천할 유저의 name을 저장한다. (유저의 이름은 선택사항이므로 없으면 null값이 들어간다)
					user.setUserName(recommandUser.getUser_name());																					//	userName
//					추천할 유저의 profile 이미지를 저장한다. (유저의 프로필 사진도 선택사항이므로 없으면 null 값이 들어간다)
					user.setUserImg(recommandUser.getUser_img());																					//	userImg
//					로그인한 유저가 팔로우하고 있는 유저들 중에서 추천하는 유저를 팔로우하고 있는 사람이 몇명인지 정보를 가져온다 (누구 외 몇명이 팔로우하고 있습니다 이거를 보여주기 위해서)
					List<FollowDTO> relatedFollowers = hakDao.getRelatedFollowers(recommandUser.getUser_id(), loginUserId);
//					사이즈가 0이면 로그인한 유저와 연관되지 않은 것이다 (누구 외 몇명이 팔로우하고 있습니다가 아닌 회원님을 위한 추천으로 띄어주면 된다.)
					if(relatedFollowers.size() == 0) {
						user.setRelatedFollowCnt(0);																								//	relatedFollowCnt
						user.setRelatedFollowFirstId(null);																							//	relatedFollowFirstId
					}
//					사이즈가 0이 아니면 내가 팔로우하고 있는 사람들 중에 몇 명이 이 사람을 팔로우하고 있는지 보여주기 위해 총 몇명이 팔로우하고 있는지 저장하고, 첫번째 사람의 id를 세팅한다.
					else {
						user.setRelatedFollowCnt(relatedFollowers.size());																			//	relatedFollowCnt
						user.setRelatedFollowFirstId(relatedFollowers.get(0).getUser_id());															//	relatedFollowFirstId
					}
//					현재 추천되는 유저가 업로드한 게시물을 리스트로 받아온다.
					List<BoardDTO> recommandUserBoardList = hakDao.getUserBoardList(user.getUserId());
//					사이즈를 세팅해주면 업로드한 게시물이 없으면 0으로 저장될 것이고 1개라도 있다면 양수로 저장될 것이다.
					user.setMyBoardCnt(recommandUserBoardList.size());																				//	myBoardCnt
//					게시물이 한개라도 있으면 해당 if문 내부를 수행
					if(recommandUserBoardList.size() != 0) {
						ArrayList<String> settingImages = new ArrayList<String>();
						for(BoardDTO board : recommandUserBoardList) {
							List<BoardFileDTO> boardFileList = hakDao.getOneBoardImgSysName(board.getBoard_num());
							settingImages.add(boardFileList.get(0).getFile_sysName());
						}
						user.setBoardImages(settingImages);																							//	boardImages
					}
//					게시물이 한개도 없으면 image ArrayList는 null로 초기화
					else {
						user.setBoardImages(null);																									//	boardImages
					}
					int followCnt = hakDao.getUserFollowCnt(user.getUserId());
					user.setFollowCnt(followCnt);																									//	followCnt
					int followerCnt = hakDao.getUserFollowerCnt(user.getUserId());
					user.setFollowerCnt(followerCnt);																								//	followerCnt
					resultRecommandList.add(user);
				}
				req.setAttribute("RecommandList", resultRecommandList);
			}
//		====================================================================게시물 관련===========================================================================
//			req에 담을 result
			ArrayList<MainBoardDTO> resultBoardList = null;
//			자신의 게시물과 팔로우한 유저들의 게시물을 가져온다
			List<BoardDTO> meAndFollowerBoardList = hakDao.getMeAndFollowerBoardList(loginUserId);
			LocalDate yearMonthDate = LocalDate.now();
			LocalTime hourMinSec = LocalTime.now();
//			size가 0이면 보여줄 게시물이 없다는 뜻
			if(meAndFollowerBoardList.size() != 0) {
				resultBoardList = new ArrayList<MainBoardDTO>();
//				게시물 한개씩 돌면서 정보를 item에 담는다
				for(BoardDTO board : meAndFollowerBoardList) {
					MainBoardDTO item = new MainBoardDTO();
					item.setBoardNum(board.getBoard_num());															//	boardNum setting
					item.setBoardId(board.getBoard_id());															//	boardId setting
					UserDTO writer = hakDao.getUserInfo(board.getBoard_id());
//					게시자 프로필 사진이 없으면 null 값으로 들어간다
					item.setWriterImg(writer.getUser_img());														//	writerImg setting
					item.setBoardDate(board.getBoard_date());														//	boardDate setting
					item.setBoardContents(board.getBoard_contents());												//	boardContents setting
					int boardYear = Integer.parseInt(board.getBoard_date().substring(0, 4));
					int boardMonth = Integer.parseInt(board.getBoard_date().substring(5, 7));
					int boardDay = Integer.parseInt(board.getBoard_date().substring(8, 10));
					int boardHour = Integer.parseInt(board.getBoard_date().substring(11, 13));
					int boardMin = Integer.parseInt(board.getBoard_date().substring(14, 16));
					int boardSec = Integer.parseInt(board.getBoard_date().substring(17, 19));
					int nowYear = yearMonthDate.getYear();
					int nowMonth = yearMonthDate.getMonthValue();
					int nowDay = yearMonthDate.getDayOfMonth();
					int nowHour = hourMinSec.getHour();
					int nowMin = hourMinSec.getMinute();
					int nowSec = hourMinSec.getSecond();
					String timeInterval = calculateTime(boardYear, boardMonth, boardDay, boardHour, boardMin, boardSec, nowYear, nowMonth, nowDay, nowHour, nowMin, nowSec);
					item.setTimeInterval(timeInterval);																//	timeInterval setting
					int boardLikeCount = hakDao.getBoardLikeCount(board.getBoard_num());
					item.setBoardLikeCnt(boardLikeCount);															//	boardLikeCnt setting
					List<String> imageList = hakDao.getBoardImagesAsSysname(board.getBoard_num());
					ArrayList<String> boardImages = new ArrayList<String>();
					for(String sysName : imageList) {
						boardImages.add(sysName);
					}
					item.setBoardImages(boardImages);																//	boardImages setting
					List<ReplyDTO> boardReplyList = hakDao.getBoardReplyListAsBoardNum(board.getBoard_num());
					item.setBoardReplyCnt(boardReplyList.size());													//	boardReplyCnt setting
					ArrayList<String> myReplyList = new ArrayList<String>();
					for(ReplyDTO reply : boardReplyList) {
						if(reply.getReply_id().equals(loginUserId)) {
							myReplyList.add(reply.getReply_contents());
						}
					}
					item.setMyReplyList(myReplyList);																//	myReplyList setting
					item.setCheckLikeBoard(hakDao.checkLikeBoard(loginUserId, board.getBoard_num()));				//	checkLikeBoard setting
					item.setCheckBookmarkBoard(hakDao.checkBookmarkBoard(loginUserId, board.getBoard_num()));		//	checkBookmarkBoard setting
					resultBoardList.add(item);
				}
				req.setAttribute("BoardList", resultBoardList);
//				최종 경로=========================================
				result.setRedirect(false);
				result.setPath("/instagram/main/main.jsp");
			}
			else {
				result.setRedirect(true);
				result.setPath(req.getContextPath() + "/go/RecommandAllUser.us");
			}
		}
		
		return result;
	}
	
	private String calculateTime(int boardYear, int boardMonth, int boardDay, int boardHour, int boardMin, int boardSec,
			int nowYear, int nowMonth, int nowDay, int nowHour, int nowMin, int nowSec) {
		if(boardYear == nowYear) {
			if(boardMonth == nowMonth) {
				if(boardDay == nowDay) {
					if(boardHour == nowHour) {
						if(boardMin == nowMin) {
							return (nowSec - boardSec) + "초 전";
						}
						else if(nowMin - boardMin == 1) {
							if(nowSec < boardSec) {
								return (60 + nowSec - boardSec) + "초 전";
							}
							return "1분 전";
						}
						else {
							return (nowMin - boardMin) + "분 전";
						}
					}
					else if(nowHour - boardHour == 1) {
						if(nowMin < boardMin) {
							return (60 + nowMin - boardMin) + "분 전";
						}
						return "1시간 전";
					}
					else {
						return (nowHour - boardHour) + "시간 전";
					}
				}
				else if(nowDay - boardDay == 1) {
					if(nowHour < boardHour) {
						return (24 + nowHour - boardHour) + "시간 전";
					}
					return "1일 전";
				}
				else {
					return (nowDay - boardDay) + "일 전";
				}
			}
			else if(nowMonth - boardMonth == 1) {
				if(nowDay < boardDay) {
					return (30 + nowDay - boardDay) + "일 전";
				}
				return "1달 전";
			}
			else {
				return (nowMonth - boardMonth) + "달 전";
			}
		}
		else if(nowYear - boardYear == 1) {
			if(nowMonth < boardMonth) {
				return (12 + nowMonth - boardMonth) + "달 전";
			}
			return "1년 전";
		}
		else {
			return (nowYear - boardYear) + "년 전";
		}
	}
}
