package insta.app.user;

import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHoDAO;
import insta.app.dto.UserDTO;

public class CheckPwOkAction implements Action{
	// 비밀번호 검사하는 곳
	// 파라미터로 넘오으는 id가 id, phone, eamil인지 검사 / pw 검사
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		
		String old_pw = req.getParameter("old_pw");
		String new_pw = req.getParameter("new_pw");
		String new_pw_confirm = req.getParameter("new_pw_confirm");
		
		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");
		String user_pw = loginUser.getUser_pw();
		

		
		boolean flag = true;
		
		// 틀렸을 때 
		if(!old_pw.equals(user_pw)){ 
			out.write("old_pw");
			flag = false; 
		}
		else if(!new_pw.equals(new_pw_confirm)){
			out.write("new_pw");
			flag = false; 
		}
		else {;}
		
		if(flag) {
			loginUser.setUser_pw(new_pw_confirm);
			out.write("O");
			
		}
		
		out.close();
		return null;
	}
}



