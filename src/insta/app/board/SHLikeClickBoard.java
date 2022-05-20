package insta.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;

public class SHLikeClickBoard implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userId = req.getParameter("userId");
		String boardNumStr = req.getParameter("boardNum");
		int boardNum = 0;
		if(boardNumStr != null) {
			boardNum = Integer.parseInt(boardNumStr);
		}
		SeongHakDAO hakDao = new SeongHakDAO();
		PrintWriter writer = resp.getWriter();
		
		if(hakDao.clickBoardLike(boardNum, userId)) {
			int likeCount = hakDao.getBoardLikeCount(boardNum);
			writer.write("" + likeCount);
		}
		else {
			writer.write("X");
		}
		
		writer.close();
		return null;
	}
}
