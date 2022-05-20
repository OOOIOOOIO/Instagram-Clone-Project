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

public class CheckEditOkAction implements Action{
	// 비밀번호 검사하는 곳
	// 파라미터로 넘오으는 id가 id, phone, eamil인지 검사 / pw 검사
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		SeongHoDAO udao = new SeongHoDAO();

		String pepName = req.getParameter("pepName");
		String pepUsername = req.getParameter("pepUsername");
		String pepEmail = req.getParameter("pepEmail");
		String pepPhonenumber = req.getParameter("pepPhonenumber");
		String pepGender = req.getParameter("pepGender");


		UserDTO session_user = (UserDTO)session.getAttribute("loginUser");
		String session_id = session_user.getUser_id();

		boolean flag = true;
		
		// 기존 아이디
		if(udao.login_id(pepUsername, ((UserDTO)session.getAttribute("loginUser")).getUser_pw()) != null) {
			flag = true;
		}
		// 새로운 아이디
		else if(udao.check_id(pepUsername)){
			out.write("id");
			flag = false;
		}
		// 핸드폰
		else if(Pattern.matches("^[0-9]*$", pepPhonenumber)) {
			// 기존 핸드폰 번호
			if(udao.login_phone(pepPhonenumber, ((UserDTO)session.getAttribute("loginUser")).getUser_pw()) != null) {
				flag = true;
			}
			// 새로운 핸드폰 번호로 변경
			else {
				// 중복
				if(udao.check_phone(pepPhonenumber)) {
					out.write("phone_a");
					flag = false;
				}
				// 형식
				else if(!Pattern.matches("^\\d{11}$", pepPhonenumber)){
					out.write("phone_b");
					flag = false;
				}
			}
			// 형식이 틀렸을 때

		}
		// 이메일 중복, 형식 검사
		else {
			// 기존 이메일
			if(udao.login_email(pepEmail, ((UserDTO)session.getAttribute("loginUser")).getUser_pw()) != null) {
				flag = true;
			}
			// 새로운 이메일로 변경
			else {
				// 중복
				if(udao.check_email(pepEmail)) {
					out.write("email_a");
					flag = false;
				}
				// 형식
				else if(!Pattern.matches("^[a-z0-9A-Z._-]*@[a-z0-9A-Z]*.[a-zA-Z.]*$", pepEmail)){
					out.write("email_b");
					flag = false;
				}
				
			}
			
		}
		
		
		UserDTO loginUser = new UserDTO();
		loginUser.setUser_name(pepName);
		loginUser.setUser_id(pepUsername);
		loginUser.setUser_email(pepEmail);
		loginUser.setUser_phone(pepPhonenumber);
		loginUser.setUser_gender(pepGender);

		if(flag) {
			if(udao.update_user(session_id, loginUser)) {
				session_user.setUser_name(pepName);
				session_user.setUser_id(pepUsername);
				session_user.setUser_email(pepEmail);
				session_user.setUser_phone(pepPhonenumber);
				session_user.setUser_gender(pepGender);
				
				out.write("O");
				
			}
			
		}
		
		out.close();
		return null;
	}
}



