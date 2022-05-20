package insta.app.user;

import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHoDAO;

public class CheckIdOkAction implements Action{
	// 회원가입 중복 검사
	// 파라미터로 넘오으는 id가 id, phone, eamil인지 검사 / pw 검사
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		SeongHoDAO udao = new SeongHoDAO();
		
		String user_id = req.getParameter("user_id");
		String user_emailOrPhone = req.getParameter("user_emailOrPhone");
		PrintWriter out = resp.getWriter();
		boolean flag = true;
		
		// 중복일 때
		if((udao.check_id(user_id))){ 
			out.write("id");
			flag = false; 
		}
		// 전화번호 중복, 형식 검사
		else if(Pattern.matches("^[0-9]*$", user_emailOrPhone)) {
			// 중복일 때
			if(udao.check_phone(user_emailOrPhone)) {
				out.write("phone_a");
				flag = false;
			}
			// 형식이 틀렸을 때
			else if(!Pattern.matches("^\\d{11}$", user_emailOrPhone)){
				out.write("phone_b");
				flag = false;
			}

		}
		// 이메일 중복, 형식 검사
		else {
			// 중복일 때
			if(udao.check_email(user_emailOrPhone)) {
				out.write("email_a");
				flag = false;
			}
			
			// 형식이 틀렸을 때
			else if(!Pattern.matches("^[a-z0-9A-Z._-]*@[a-z0-9A-Z]*.[a-zA-Z.]*$", user_emailOrPhone)){
				out.write("email_b");
				flag = false;
			}
		}
		
		// 중복이 아니고 완전 다 통과 됐을 때
		if(flag) {
			out.write("O");
		}
		
		out.close();
		return null;
	}
}



