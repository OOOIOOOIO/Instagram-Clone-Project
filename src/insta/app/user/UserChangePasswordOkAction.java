package insta.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import insta.action.ActionForward;
import insta.app.dao.SeongHoDAO;
import insta.app.dto.UserDTO;

public class UserChangePasswordOkAction {
	public ActionForward execute(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		HttpSession session = req.getSession();
		SeongHoDAO udao = new SeongHoDAO();
		ActionForward forward = null;
		
		
		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
		String session_id = loginUser.getUser_id();
		String user_pw = req.getParameter("new_pw");
		String user_id = "";
		
		if(session_id.equals(loginUser.getUser_id())) {
			user_id = loginUser.getUser_id();
		}
		else if(session_id.equals(loginUser.getUser_phone())) {
			user_id = loginUser.getUser_phone();
		}
		else {
			user_id = loginUser.getUser_email();
		}
		
		// 계속 비밀번호를 변경할 수 있게 session도 계속 바꿔줬습니다.
		if(udao.mypage_changePw(user_pw, user_id)) { 
			session.removeAttribute("loginUser");
			forward = new ActionForward();

			UserDTO loginUser_id = udao.login_id(user_id, user_pw);
			UserDTO loginUser_phone = udao.login_phone(user_id, user_pw);
			UserDTO loginUser_email = udao.login_email(user_id, user_pw);
			
			if(loginUser_id != null) {
				session.setAttribute("loginUser", loginUser);
				forward.setRedirect(true);
			}
			else if(loginUser_phone != null) {
				session.setAttribute("loginUser", loginUser);
				forward.setRedirect(true);
			}
			else if(loginUser_email != null) {
				session.setAttribute("loginUser", loginUser);
				forward.setRedirect(true);
			}
		}
		forward.setPath(req.getContextPath()+"/user/UserChangePassword.us");
		return forward;
	}

}