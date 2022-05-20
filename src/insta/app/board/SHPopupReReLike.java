package insta.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;

public class SHPopupReReLike implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String reReLikeId = req.getParameter("userId");
		String reReNumStr = req.getParameter("reReNum");
		int reReNum = 0;
		if(reReNumStr != null) {
			reReNum = Integer.parseInt(reReNumStr);
		}
		SeongHakDAO hakDao = new SeongHakDAO();
		PrintWriter writer = resp.getWriter();
		if(hakDao.likeReRe(reReLikeId, reReNum)) {
			writer.write("좋아요 " + hakDao.getReReLikeCount(reReNum) + "개");
		}
		else {
			writer.write("X");
		}
		writer.close();
		
		return null;
	}
}
