package insta.app.user;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHoDAO;
import insta.app.dto.UserDTO;

public class UserLoginOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		
		session.removeAttribute("user_id");
		
		SeongHoDAO udao = new SeongHoDAO();
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		
		ActionForward forward = null;
		// id가 뭐로 들어왔는지
		UserDTO loginUser_id = udao.login_id(user_id, user_pw);
		UserDTO loginUser_phone = udao.login_phone(user_id, user_pw);
		UserDTO loginUser_email = udao.login_email(user_id, user_pw);
		
		
		
		// sessioin 잘 들어왔는지 보기 위해 UserChangePassword로 경로 설정했습니다.
		if(loginUser_id != null) {
			session.setAttribute("loginUser", udao.getUserId(user_id));
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/go/MainBoard.bo");
			
		}
		else if(loginUser_phone != null) {
			session.setAttribute("loginUser", udao.getUserPhone(user_id));
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/go/MainBoard.bo");
			
		}
		else if(loginUser_email != null) {
			session.setAttribute("loginUser", udao.getUserEmail(user_id));
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/go/MainBoard.bo");
			
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/user/UserLogin.us");

		}
		return forward;
	}
}






