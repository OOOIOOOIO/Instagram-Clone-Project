package insta.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHoDAO;
import insta.app.dto.UserDTO;

public class LoginCheckOkAction implements Action{

	// 파라미터로 넘오으는 id가 id, phone, eamil인지 검사 / pw 검사
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		SeongHoDAO udao = new SeongHoDAO();
		
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		
		
		PrintWriter out = resp.getWriter();
		boolean flag = true;
		
		// 아이디 검사
		boolean id = udao.check_id(user_id);
		boolean phone = udao.check_email(user_id);
		boolean email = udao.check_phone(user_id);
		
		if(id) {
			flag = true;
		}
		else if(phone){
			flag = true;
		}
		else if(email){
			flag = true;
		}
		else {
			out.write("id");
			flag = false;
		}
		
		// 비밀번호 검사 
		UserDTO login_id = udao.login_id(user_id, user_pw);
		UserDTO login_phone = udao.login_phone(user_id, user_pw);
		UserDTO login_email = udao.login_email(user_id, user_pw);
		
		if(login_id != null) {
			flag = true;
		}
		else if(login_phone != null) {
			flag = true;
		}
		else if(login_email != null) {
			flag = true;
		}
		else {
			out.write("pw");
			flag = false;
		}

		// 완전 다 통과 됐을 때
		if(flag) {
			out.write("O");
		}
		
		out.close();
		return null;
	}
}



