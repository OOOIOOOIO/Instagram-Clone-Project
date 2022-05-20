package insta.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import insta.action.ActionForward;
import insta.app.dao.SeongHoDAO;

public class DeleteUserAction {
	public ActionForward execute(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		SeongHoDAO udao = new SeongHoDAO();
		ActionForward forward = null;
		
		HttpSession session = req.getSession();
		
		String user_id = (String)session.getAttribute("user_id");
		
		// DB에서 삭제 했으면 session도 없애주기
		if(udao.session_delete(user_id)) { 
			session.removeAttribute("user_id");
			forward = new ActionForward();
			forward.setRedirect(true);
		}
		// 여기는 이제 join_main으로 돌아가기
		forward.setPath(req.getContextPath()+"/user/UserJoin.us");
		return forward;
	}
}