package insta.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;

public class SHPopupReReRemove implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String reReId = req.getParameter("reReId");
		String reReNumStr = req.getParameter("reReNum");
		int reReNum = 0;
		if(reReNumStr != null) {
			reReNum = Integer.parseInt(reReNumStr);
		}
		SeongHakDAO hakDao = new SeongHakDAO();
		PrintWriter writer = resp.getWriter();
		
		hakDao.removeReReLikeAsReReNum(reReNum);
		if(hakDao.removeReReAsReReNum(reReNum, reReId)) {
			writer.write("O");
		}
		else {
			writer.write("X");
		}
		
		writer.close();
		return null;
	}
}
