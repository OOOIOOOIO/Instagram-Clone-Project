package insta.app.board;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;
import insta.app.dto.BoardDTO;
import insta.app.dto.ReReDTO;
import insta.app.dto.ReplyDTO;
import insta.app.dto.UserDTO;

public class SHPopupBoard implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String loginUserId = req.getParameter("userId");
		String boardNumStr = req.getParameter("boardNum");
		int boardNum = 0;
		if(boardNumStr != null) {
			boardNum = Integer.parseInt(boardNumStr);
		}
		SeongHakDAO hakDao = new SeongHakDAO();
//		팝업창에 띄울 게시글의 정보
		BoardDTO selectedBoard = hakDao.getSelectedBoardInfoAsBoardNum(boardNum);
//		팝업창에 띄울 게시자의 정보
		UserDTO writerInfo = hakDao.getUserInfo(selectedBoard.getBoard_id());
//		response로 응답할 JSON result
		JSONObject result = new JSONObject();
		
//		1. board_num setting
		result.put("board_num", "" + selectedBoard.getBoard_num());
//		2. board_writer_id setting
		result.put("board_writer_id", selectedBoard.getBoard_id());
//		게시자의 이미지가 없으면 null이라는 문자열로 저장
//		3. board_writer_img setting
		if(writerInfo.getUser_img() == null) {
			result.put("board_writer_img", "null");
		}
		else {
			result.put("board_writer_img", writerInfo.getUser_img());
		}
//		현재 날짜 정보
		LocalDate yearMonthDate = LocalDate.now();
		LocalTime hourMinSec = LocalTime.now();
		int boardYear = Integer.parseInt(selectedBoard.getBoard_date().substring(0, 4));
		int boardMonth = Integer.parseInt(selectedBoard.getBoard_date().substring(5, 7));
		int boardDay = Integer.parseInt(selectedBoard.getBoard_date().substring(8, 10));
		int boardHour = Integer.parseInt(selectedBoard.getBoard_date().substring(11, 13));
		int boardMin = Integer.parseInt(selectedBoard.getBoard_date().substring(14, 16));
		int boardSec = Integer.parseInt(selectedBoard.getBoard_date().substring(17, 19));
		int nowYear = yearMonthDate.getYear();
		int nowMonth = yearMonthDate.getMonthValue();
		int nowDay = yearMonthDate.getDayOfMonth();
		int nowHour = hourMinSec.getHour();
		int nowMin = hourMinSec.getMinute();
		int nowSec = hourMinSec.getSecond();
		String board_time_interval = calculateTime(boardYear, boardMonth, boardDay, boardHour, boardMin, boardSec, nowYear, nowMonth, nowDay, nowHour, nowMin, nowSec);
//		4. board_time_interval setting
		result.put("board_time_interval", board_time_interval);
//		5. board_contents setting
		if(selectedBoard.getBoard_contents() == null) {
			result.put("board_contents", "null");
		}
		else {
			result.put("board_contents", selectedBoard.getBoard_contents());
		}
//		6. board_images setting
		List<String> boardImages = hakDao.getBoardImagesAsSysname(boardNum);
		result.put("board_images", boardImages);
//		7. board_like_cnt setting
		int boardLikeCnt = hakDao.getBoardLikeCount(boardNum);
		result.put("board_like_cnt", "" + boardLikeCnt);
//		8. board_like_check setting
		boolean boardLikeCheck = hakDao.checkLikeBoard(loginUserId, boardNum);
		result.put("board_like_check", boardLikeCheck + "");
//		9. board_bookmark_check setting
		boolean boardBookmarkCheck = hakDao.checkBookmarkBoard(loginUserId, boardNum);
		result.put("board_bookmark_check", boardBookmarkCheck + "");
//		10. board_owner_check setting
		if(selectedBoard.getBoard_id().equals(loginUserId)) {
			result.put("board_owner_check", "true");
		}
		else {
			result.put("board_owner_check", "false");
		}
		
		List<ReplyDTO> replyList = hakDao.getBoardReplyListAsBoardNum(boardNum);
		JSONArray replyJsonArray = null;
		if(replyList.size() != 0) {
			replyJsonArray = new JSONArray();
			for(ReplyDTO reply : replyList) {
				JSONObject replyJsonObject = new JSONObject();
//				1. reply_num setting
				replyJsonObject.put("reply_num", reply.getReply_num() + "");
//				2. reply_writer_id setting
				replyJsonObject.put("reply_writer_id", reply.getReply_id());
//				3. reply_writer_img setting
				UserDTO replyWriterInfo = hakDao.getUserInfo(reply.getReply_id());
				if(replyWriterInfo.getUser_img() == null) {
					replyJsonObject.put("reply_writer_img", "null");
				}
				else {
					replyJsonObject.put("reply_writer_img", replyWriterInfo.getUser_img());
				}
//				4. reply_time_interval setting
				int replyYear = Integer.parseInt(reply.getReply_date().substring(0, 4));
				int replyMonth = Integer.parseInt(reply.getReply_date().substring(5, 7));
				int replyDay = Integer.parseInt(reply.getReply_date().substring(8, 10));
				int replyHour = Integer.parseInt(reply.getReply_date().substring(11, 13));
				int replyMin = Integer.parseInt(reply.getReply_date().substring(14, 16));
				int replySec = Integer.parseInt(reply.getReply_date().substring(17, 19));
				String reply_time_interval = calculateTime(replyYear, replyMonth, replyDay, replyHour, replyMin, replySec, nowYear, nowMonth, nowDay, nowHour, nowMin, nowSec);
				replyJsonObject.put("reply_time_interval", reply_time_interval);
//				5. reply_like_cnt setting
				int replyLikeCnt = hakDao.getReplyLikeCount(reply.getReply_num());
				replyJsonObject.put("reply_like_cnt", replyLikeCnt + "");
//				6. reply_contents setting
				replyJsonObject.put("reply_contents", reply.getReply_contents());
//				7. ref_board_num setting
				replyJsonObject.put("ref_board_num", "" + reply.getBoard_num());
//				8. reply_like_check setting
				boolean replyLikeCheck = hakDao.checkLikeReply(loginUserId, reply.getReply_num());
				replyJsonObject.put("reply_like_check", replyLikeCheck + "");
//				9. reply_owner_check setting
				if(reply.getReply_id().equals(loginUserId)) {
					replyJsonObject.put("reply_owner_check", "true");
				}
				else {
					replyJsonObject.put("reply_owner_check", "false");
				}
				List<ReReDTO> reReList = hakDao.getReplyReReListAsReplyNum(reply.getReply_num());
				JSONArray reReJsonArray = null;
				if(reReList.size() != 0) {
					reReJsonArray = new JSONArray();
					for(ReReDTO reRe : reReList) {
						JSONObject reReJsonObject = new JSONObject();
						
//						1. re_re_num setting
						reReJsonObject.put("re_re_num", reRe.getRe_re_num() + "");
//						2. re_re_writer_id
						reReJsonObject.put("re_re_writer_id", reRe.getRe_re_Id());
//						3. re_re_writer_img
						UserDTO reReWriterInfo = hakDao.getUserInfo(reRe.getRe_re_Id());
						if(reReWriterInfo.getUser_img() == null) {
							reReJsonObject.put("re_re_writer_img", "null");
						}
						else {
							reReJsonObject.put("re_re_writer_img", reReWriterInfo.getUser_img());
						}
//						4. re_re_time_interval setting
						int reReYear = Integer.parseInt(reRe.getRe_re_date().substring(0, 4));
						int reReMonth = Integer.parseInt(reRe.getRe_re_date().substring(5, 7));
						int reReDay = Integer.parseInt(reRe.getRe_re_date().substring(8, 10));
						int reReHour = Integer.parseInt(reRe.getRe_re_date().substring(11, 13));
						int reReMin = Integer.parseInt(reRe.getRe_re_date().substring(14, 16));
						int reReSec = Integer.parseInt(reRe.getRe_re_date().substring(17, 19));
						String re_re_time_interval = calculateTime(reReYear, reReMonth, reReDay, reReHour, reReMin, reReSec, nowYear, nowMonth, nowDay, nowHour, nowMin, nowSec);
						reReJsonObject.put("re_re_time_interval", re_re_time_interval);
//						5. re_re_like_cnt setting
						int reReLikeCnt = hakDao.getReReLikeCount(reRe.getRe_re_num());
						reReJsonObject.put("re_re_like_cnt", reReLikeCnt + "");
//						6. re_re_contents setting
						reReJsonObject.put("re_re_contents", reRe.getRe_re_contents());
//						7. ref_reply_num setting
						reReJsonObject.put("ref_reply_num", reRe.getReply_num() + "");
//						8. ref_board_num setting
						reReJsonObject.put("ref_board_num", reRe.getBoard_num() + "");
//						9. re_re_like_check setting
						boolean reReLikeCheck = hakDao.checkLikeReRe(loginUserId, reRe.getRe_re_num());
						reReJsonObject.put("re_re_like_check", reReLikeCheck + "");
//						10. re_re_owner_check setting
						if(reRe.getRe_re_Id().equals(loginUserId)) {
							reReJsonObject.put("re_re_owner_check", "true");
						}
						else {
							reReJsonObject.put("re_re_owner_check", "false");
						}
						reReJsonArray.add(reReJsonObject);
					}
					
					replyJsonObject.put("re_re_list", reReJsonArray);
				}
				else {
					replyJsonObject.put("re_re_list", "null");
				}
				
				replyJsonArray.add(replyJsonObject);
			}
//			11. reply_list setting
			result.put("reply_list", replyJsonArray);
		}
		else {
			result.put("reply_list", "null");
		}
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
		return null;
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
