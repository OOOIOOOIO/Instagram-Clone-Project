package insta.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;

public class SHCancelBookmarkClickBoard implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String bookmarkId = req.getParameter("userId");
		String boardNumStr = req.getParameter("boardNum");
		int boardNum = 0;
		if(boardNumStr != null) {
			boardNum =Integer.parseInt(boardNumStr);
		}
		PrintWriter writer = resp.getWriter();
		SeongHakDAO hakDao = new SeongHakDAO();
		if(hakDao.cancelBoardBookmark(boardNum, bookmarkId)) {
			writer.write("O");
		}
		else {
			writer.write("X");
		}
		writer.close();
		return null;
	}
}
