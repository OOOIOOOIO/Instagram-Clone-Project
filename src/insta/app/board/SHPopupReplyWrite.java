package insta.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;
import insta.app.dto.ReplyDTO;
import insta.app.dto.UserDTO;

public class SHPopupReplyWrite implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String replyId = req.getParameter("userId");
		String boardNumStr = req.getParameter("boardNum");
		String replyContent = req.getParameter("replyContent");
		int boardNum = 0;
		if(boardNumStr != null) {
			boardNum = Integer.parseInt(boardNumStr);
		}
		
		SeongHakDAO hakDao = new SeongHakDAO();
		PrintWriter writer = resp.getWriter();
		if(hakDao.writeReplyBoard(replyId, replyContent, boardNum)) {
			String contextPath = req.getContextPath();
			UserDTO writerInfo = hakDao.getUserInfo(replyId);
			ReplyDTO newReply = hakDao.getMyNewReplyInfo(replyId, boardNum);
			
			String replyNode = "";
			replyNode += "<div id=\"popup-content-reply-wrap-" + newReply.getReply_num() + "\" class=\"popup-content-reply-wrap\">";
			replyNode += 	"<div class=\"popup-content-reply-profile-img-wrap\">";
			if(writerInfo.getUser_img() == null) {
				replyNode += 	"<div class=\"popup-content-reply-profile-img\" style=\"background-image: url('" + contextPath +"/img/server_images/profile_image/unknown.png');\"></div>";
			}
			else {
				replyNode += 	"<div class=\"popup-content-reply-profile-img\" style=\"background-image: url('" + contextPath +"/img/server_images/profile_image/" + writerInfo.getUser_img() +"');\"></div>";
			}
			replyNode += 	"</div>";
			replyNode += 	"<div class=\"popup-content-reply-content-wrap\">";
			replyNode += 		"<span style=\"font-size: 13px;\">";
			replyNode +=			"<a href=\"#\" style=\"color: black; font-size: 13px; font-weight: bold;\">" + newReply.getReply_id() + "</a> ";
			replyNode +=			newReply.getReply_contents();
			replyNode +=		"</span>";
			replyNode +=		"<div class=\"popup-content-reply-info-wrap\">";
			replyNode +=			"<div>" + "1초 전" + "</div>";
			replyNode +=			"<div id=\"reply-like-cnt-text-" + newReply.getReply_num() +"\">좋아요 " + 0 + "개</div>";
			replyNode +=			"<div onclick=\"clickReplyLeaveBtn('" + newReply.getReply_num() + "', '" + newReply.getReply_id() + "');\">답글 달기</div>";
			replyNode +=			"<div onclick=\"removeReply('" + newReply.getReply_num() + "', '" + newReply.getReply_id() + "');\">삭제</div>";
			replyNode +=		"</div>";
			replyNode += 		"<div id=\"reply-reply-show-btn-" + newReply.getReply_num() + "\" onclick=\"showReplyReply(" + newReply.getReply_num() + ");\">";
			replyNode +=			"답글 보기";
			replyNode +=		"</div>";
			replyNode +=	"</div>";
			replyNode +=	"<div id=\"reply-heart-wrap-" + newReply.getReply_num() +"\" class=\"reply-heart-wrap\">";
			replyNode +=		"<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_empty.png\');\" onclick=\"likeReply('" + newReply.getReply_num() + "', '" + newReply.getReply_id() + "', 'false');\"></div>";
			replyNode +=	"</div>";
			replyNode += "</div>";
			
			writer.write(replyNode);
		}
		
		
		writer.close();
		return null;
	}
}
