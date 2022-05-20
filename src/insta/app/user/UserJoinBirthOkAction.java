package insta.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import insta.action.ActionForward;
import insta.app.dao.SeongHoDAO;
import insta.app.dto.UserDTO;

public class UserJoinBirthOkAction {
   public ActionForward execute(HttpServletRequest req,HttpServletResponse resp) throws Exception{
      SeongHoDAO udao = new SeongHoDAO();
      String month = req.getParameter("month");
      String day = req.getParameter("day");
      String year = req.getParameter("year");

      String user_birth = (year+"."+month+"."+day);
      
      HttpSession session = req.getSession();
      
      
      UserDTO user = (UserDTO)session.getAttribute("user_id");
      String user_id = "";
      String user_phone = user.getUser_phone();
      String user_email = user.getUser_email();

      if(user_email != null) {
         user_id = user_email;
      }
      else {
         user_id = user_phone;
      }
      
      ActionForward forward = null;
      
      if(udao.join_birth_phone(user_birth, user_id)) { // 이 부분이 DB에 저장
         forward = new ActionForward();
         //어떤 방식으로 이동할 것인지(redirect / forward)
         forward.setRedirect(true);
         //어떤 페이지로 이동할 것인지(forward : 앞의 root가 남아있음 / redirect : 재요청이기 때문에 cp 연결) 
      }
      if(udao.join_birth_email(user_birth, user_id)) { // 이 부분이 DB에 저장
         forward = new ActionForward();
         //어떤 방식으로 이동할 것인지(redirect / forward)
         forward.setRedirect(true);
         //어떤 페이지로 이동할 것인지(forward : 앞의 root가 남아있음 / redirect : 재요청이기 때문에 cp 연결) 
      }
      if(user_id.contains("@")) {
         forward.setPath(req.getContextPath()+"/instagram/join/join_email_confirmation.jsp");
      }
      else {
         forward.setPath(req.getContextPath()+"/instagram/join/join_phone_confirmation.jsp");
      }
      return forward;
   }

}