package insta.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;
import insta.app.dto.ReReDTO;
import insta.app.dto.UserDTO;

public class SHPopupReReWrite implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String reReId = req.getParameter("userId");				//	이게 loginUserId임
		String boardNumStr = req.getParameter("boardNum");
		int boardNum = 0;
		if(boardNumStr != null) {
			boardNum = Integer.parseInt(boardNumStr);
		}
		String reReContent = req.getParameter("reReContent");
		String replyNumStr = req.getParameter("replyNum");
		int replyNum = 0;
		if(replyNumStr != null) {
			replyNum = Integer.parseInt(replyNumStr);
		}
		
		SeongHakDAO hakDao = new SeongHakDAO();
		PrintWriter writer = resp.getWriter();
		
		if(hakDao.writeReRe(replyNum, reReContent, reReId, boardNum)) {
			String contextPath = req.getContextPath();
			UserDTO reReWriterInfo = hakDao.getUserInfo(reReId);
			
			String reply_reply = "";
			
			ReReDTO newReRe = hakDao.getMyNewReReInfo(reReId, boardNum);
			
			reply_reply += "<div id=\"reply-reply-wrap-" + newReRe.getRe_re_num() +"\" class=\"reply-reply-wrap reply-seq-" + replyNum + "\">";
			reply_reply += 		"<div class=\"popup-content-reply-profile-img-wrap\">";
			if(reReWriterInfo.getUser_img() == null) {
				reply_reply += 		"<div class=\"popup-content-reply-profile-img\" style=\"background-image: url('" + contextPath +"/img/server_images/profile_image/unknown.png');\"></div>";
			}
			else {
				reply_reply += 		"<div class=\"popup-content-reply-profile-img\" style=\"background-image: url('" + contextPath +"/img/server_images/profile_image/" + reReWriterInfo.getUser_img() +"');\"></div>";
			}
			reply_reply += 		"</div>";
			reply_reply +=		"<div class=\"reply-reply-content-wrap\">";
			reply_reply +=			"<span style=\"font-size: 13px;\">";
			reply_reply +=				"<a href=\"#\" style=\"color: black; font-size: 13px; font-weight: bold;\">" + reReId + "</a> ";
			reply_reply +=				reReContent;
			reply_reply +=			"</span>";
			reply_reply +=			"<div class=\"popup-content-reply-info-wrap\">";
			reply_reply +=				"<div>" + "1초 전" +"</div>";
			reply_reply +=				"<div id=\"re-re-like-cnt-text-" + newReRe.getRe_re_num() + "\">좋아요 " + 0 + "개</div>";
			reply_reply +=				"<div onclick=\"clickReplyLeaveBtn('" + replyNum + "', '" + reReId + "');\">답글 달기</div>";
			reply_reply += 				"<div onclick=\"removeReRe('" + newReRe.getRe_re_num() + "', '" + reReId +"', '" + replyNum +"');\">삭제</div>";
			reply_reply +=			"</div>";
			reply_reply +=		"</div>";
			reply_reply +=		"<div id=\"re-re-heart-wrap-" + newReRe.getRe_re_num() + "\" class=\"reply-heart-wrap\">";
			reply_reply +=			"<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_empty.png');\" onclick=\"likeReRe('" + newReRe.getRe_re_num() + "', '" + reReId + "', 'false');\"></div>";
			reply_reply +=		"</div>";
			reply_reply += "</div>";
			
			
			writer.write(reply_reply);
		}
		
		writer.close();
		
		return null;
	}
}
