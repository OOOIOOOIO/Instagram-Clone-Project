package insta.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;
import insta.app.dto.UserDTO;

public class SHFollowCancelUser implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String loginUserId = ((UserDTO)(req.getSession().getAttribute("loginUser"))).getUser_id();
//		String loginUserId = "justinbieber";
		String followId = req.getParameter("userId");
		
		SeongHakDAO hakDao = new SeongHakDAO();
		PrintWriter writer = resp.getWriter();
		if(hakDao.followCancelSelectedUser(loginUserId, followId)) {
			writer.write("O");
		}
		else {
			writer.write("X");
		}
		writer.close();
		return null;
	}
}
