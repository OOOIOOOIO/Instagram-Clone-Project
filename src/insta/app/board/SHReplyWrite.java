package insta.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;

public class SHReplyWrite implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String replyId = req.getParameter("userId");
		String replyContents = req.getParameter("replyContents");
		String boardNumStr = req.getParameter("boardNum");
		int boardNum = 0;
		if(boardNumStr != null) {
			boardNum = Integer.parseInt(boardNumStr);
		}
		SeongHakDAO hakDao = new SeongHakDAO();
		PrintWriter writer = resp.getWriter();
		
		if(hakDao.writeReplyBoard(replyId, replyContents, boardNum)) {
			int boardReplyCnt = (hakDao.getBoardReplyListAsBoardNum(boardNum)).size();
			writer.write("댓글 " + boardReplyCnt + "개 모두 보기");
		}
		else {
			writer.write("X");
		}
		
		writer.close();
		return null;
	}
}
