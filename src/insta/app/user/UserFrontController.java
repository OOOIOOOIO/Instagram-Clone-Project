package insta.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.ActionForward;

public class UserFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
	   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI(); //localhost:9090/day17/json/GetJSON.jd
		String contextPath = request.getContextPath(); //localhost:9090/day17
		String command = requestURI.substring(contextPath.length()); // /json/GetJSON.jd
		ActionForward forward = null;
		System.out.println(command);
		switch(command) {
//		이성학 구간////////////////////////
		case "/go/RecommandAllUser.us" :
			try {
				forward = new RecommandAllUser().execute(request, response);
			}
			catch (Exception e) {
				System.out.println("RecommandAllUser : " + e);
			}
			break;
		case "/user/SHFollowUser.us" :
			try {
				forward = new SHFollowUser().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHFollowUser : " + e);
			}
			break;
		case "/user/SHFollowCancelUser.us" :
			try {
				forward = new SHFollowCancelUser().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHFollowCancelUser : " + e);
			}
			break;
		case "/upload/SHProfileImage.us" :
			try {
				forward = new SHProfileImage().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHProfileImage : " + e);
			}
			break;
//		손다니엘 구간//////////////////////////////////////////////
		case "/user/userProfile.us":
			try {
				forward = new UserProfile().execute(request,response);
			} catch (Exception e) {
				System.out.println("recommendUser : " + e);
			}
			break;
			
		case "/user/searchUser.us":
			try {
				forward = new SearchUser().execute(request,response);
			} catch (Exception e) {
				System.out.println("searchUser : " + e);
			}
			break;
//		김성호 구간	//////////////////////////////////////
		case "/user/UserJoin.us":
			forward = new ActionForward();
			forward.setPath("/instagram/join/join_main.jsp");
			forward.setRedirect(false);
			break;
		case "/user/UserJoinOk.us":
			try {
				forward = new UserJoinOkAction().execute(request, response);
				
			} catch (Exception e) {
				System.out.println("UserJoinOk : "+e);
			}
			break;
		case "/user/UserJoinBirth.us":
			try {
				forward = new ActionForward();
				forward.setPath("/instagram/join/join_birth.jsp");
				forward.setRedirect(false);
			} catch (Exception e) {
				System.out.println("UserJoinOk : "+e);
			}
			break;
		case "/user/UserJoinBirthOk.us":
			try {
				forward = new UserJoinBirthOkAction().execute(request, response);
			} catch (Exception e) {
				System.out.println("UserJoinBirthOk : "+e);
			}
			break;
		case "/user/UserDelete.us":
			try {
				forward = new DeleteUserAction().execute(request, response);
			} catch (Exception e) {
				System.out.println("DeleteUserAction : "+e);
			}
			break;
		case "/user/CheckIdOk.us":
			try {
				new CheckIdOkAction().execute(request,response);
			} catch (Exception e) {
				System.out.println("CheckIdOk : "+e);
			}
			break;
		case "/user/UserLogin.us":
			forward = new ActionForward();
			forward.setPath("/instagram/login/login_main.jsp");
			forward.setRedirect(false);
			break;
		case "/user/UserLoginOk.us":
			try {
				forward = new UserLoginOkAction().execute(request,response);
			} catch (Exception e) {
				System.out.println("UserLoginOk : "+e);
			}
			break;
		case "/user/LoginCheckOk.us":
			try {
				new LoginCheckOkAction().execute(request,response);
			} catch (Exception e) {
				System.out.println("CheckIdOk : "+e);
			}
			break;
		case "/user/UserLogoutOk.us":
			try {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(request.getContextPath() +"/user/UserLogin.us");
				request.getSession().removeAttribute("loginUser");
			} catch (Exception e) {
				System.out.println("UserLogoutOk : "+e);
			}
			break;
		// 여기서부터 Mypage
		// change_password
		case "/user/UserChangePassword.us":
			try {
				forward = new ActionForward();
				forward.setPath("/instagram/mypage/change_password.jsp");
				forward.setRedirect(false);
			} catch (Exception e) {
				System.out.println("UserChangePassword: "+e);
			}
			break;
		case "/user/UserChangePasswordOk.us": //DB
			try {
				forward = new UserChangePasswordOkAction().execute(request, response);
			} catch (Exception e) {
				System.out.println("UserChangePasswordOk : "+e);
			}
			break;
		case "/user/CheckPwOk.us": // 유효성
			try {
				new CheckPwOkAction().execute(request,response);
			} catch (Exception e) {
				System.out.println("CheckPwOk : "+e);
			}
			break;
		case "/user/UserEditProfile.us":
			try {
				forward = new ActionForward();
				forward.setPath(request.getContextPath() + "/instagram/mypage/edit_profile.jsp");
				forward.setRedirect(true);
			} catch (Exception e) {
				System.out.println("UserEditProfile : "+e);
			}
			break;
		case "/user/CheckEditOk.us": // 유효성
			try {
				new CheckEditOkAction().execute(request,response);
			} catch (Exception e) {
				System.out.println("CheckEditOk : "+e);
			}
			break;
		}
		if(forward != null) {
			if(forward.isRedirect()) {
				//Redirect
				response.sendRedirect(forward.getPath());
			}
			else {
				//Forward
				RequestDispatcher disp = request.getRequestDispatcher(forward.getPath());
				disp.forward(request, response);
			}
		}
	}
}