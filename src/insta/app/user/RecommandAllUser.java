package insta.app.user;

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
import insta.app.dto.RecommandAllDTO;
import insta.app.dto.UserDTO;

public class RecommandAllUser implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward result = new ActionForward();
		if(req.getSession().getAttribute("loginUser") == null) {
			result.setPath("/user/UserLogin.us");
			result.setRedirect(false);
			return result;
		}
//		로그인한 객체를 가져온다.
		String loginUserId = ((UserDTO)(req.getSession().getAttribute("loginUser"))).getUser_id();
//		String loginUserId = req.getParameter("loginUserId");
		SeongHakDAO hakDao = new SeongHakDAO();
//		만약 로그인한 유저가 없으면 아래 if 문을 수행해야한다.
		if(loginUserId == null) {
			result.setPath("/user/UserLogin.us");
			result.setRedirect(false);
		}
//		만약 로그인한 유저가 있다면
		else {
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
				result.setRedirect(false);
				result.setPath("/instagram/main/recommand_all_view.jsp");
			}
//			else로 들어왔다는 것은 현재 db에 저장된 유저들을 모두 팔로우 하고 있는 상태이다
			else {
				result.setRedirect(false);
				result.setPath("/instagram/main/recommand_all_view.jsp?exist=none");
			}
		}
		return result;
	}
}
