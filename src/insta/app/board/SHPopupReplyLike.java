package insta.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;

public class SHPopupReplyLike implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String replyNumStr = req.getParameter("replyNum");
		String replyLikeId = req.getParameter("replyLikeId");
		int replyNum = 0;
		if(replyNumStr != null) {
			replyNum = Integer.parseInt(replyNumStr);
		}
		SeongHakDAO hakDao = new SeongHakDAO();
		PrintWriter writer = resp.getWriter();
		
		if(hakDao.likeReply(replyNum, replyLikeId)) {
			int replyLikeCnt = hakDao.getReplyLikeCount(replyNum);
			writer.write("좋아요 " + replyLikeCnt + "개");
		}
		else {
			writer.write("X");
		}
		
		writer.close();
		
		return null;
	}
}
