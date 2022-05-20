package insta.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import insta.action.ActionForward;
import insta.app.dao.SeongHoDAO;
import insta.app.dto.UserDTO;

public class UserJoinOkAction {
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDTO newUser = new UserDTO();
		SeongHoDAO udao = new SeongHoDAO();
		ActionForward forward = null;
		String data = req.getParameter("emailOrPhone");

		HttpSession session = req.getSession();

		// 이메일
		if (data.contains("@")) {
			newUser.setUser_id(req.getParameter("user_id"));
			newUser.setUser_pw(req.getParameter("user_pw"));
			newUser.setUser_name(req.getParameter("user_name"));
			newUser.setUser_email(data);

			if (udao.join_email(newUser)) { // 이 부분이 DB에 저장
				session.setAttribute("user_id", newUser); // join birth에서 사용
				forward = new ActionForward();
				// 어떤 방식으로 이동할 것인지(redirect / forward)
				forward.setRedirect(true);
				// 어떤 페이지로 이동할 것인지(forward : 앞의 root가 남아있음 / redirect : 재요청이기 때문에 cp 연결)
			}
			forward.setPath(req.getContextPath() + "/user/UserJoinBirth.us");
			return forward;
		}
		// 핸드폰
		else {
			newUser.setUser_id(req.getParameter("user_id"));
			newUser.setUser_pw(req.getParameter("user_pw"));
			newUser.setUser_name(req.getParameter("user_name"));
			newUser.setUser_phone(data);

			if (udao.join_phone(newUser)) { // 이 부분이 DB에 저장
				session.setAttribute("user_id", newUser);
				forward = new ActionForward();
				forward.setRedirect(true);
			}
			forward.setPath(req.getContextPath() + "/user/UserJoinBirth.us");
			return forward;
		}
	}
}
