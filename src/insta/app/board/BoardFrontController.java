package insta.app.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.ActionForward;


public class BoardFrontController extends HttpServlet{
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
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		System.out.println(command);
		switch(command) {
		case "/go/MainBoard.bo" :
			try {
				forward = new MovementMainBoard().execute(request, response);
			} catch (Exception e) {
				System.out.println("MovementMainBoard : " + e);
			} 
			break;
		case "/like/SHLikeClickBoard.bo" :
			try {
				forward = new SHLikeClickBoard().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHLikeClickBoard : " + e);
			}
			break;
		case "/like/SHCancelLikeClickBoard.bo" :
			try {
				forward = new SHCancelLikeClickBoard().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHCancelLikeClickBoard : " + e);
			}
			break;
		case "/bookmark/SHCancelBookmarkClickBoard.bo" :
			try {
				forward = new SHCancelBookmarkClickBoard().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHCancelBookmarkClickBoard : " + e);
			}
			break;
		case "/bookmark/SHBookmarkClickBoard.bo" :
			try {
				forward = new SHBookmarkClickBoard().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHBookmarkClickBoard : " + e);
			}
			break;
		case "/reply/SHReplyWrite.bo" :
			try {
				forward = new SHReplyWrite().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHReplyWrite : " + e);
			}
			break;
		case "/board/SHPopupBoard.bo" :
			try {
				forward = new SHPopupBoard().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHPopupBoard : " + e);
			}
			break;
		case "/popup/SHPopupReplyWrite.bo" :
			try {
				forward = new SHPopupReplyWrite().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHPopupReplyWrite : " + e);
			}
			break;
		case "/popup/SHPopupReReWrite.bo" :
			try {
				forward = new SHPopupReReWrite().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHPopupReReWrite : " + e);
			}
			break;
		case "/popup/SHPopupReReLike.bo" :
			try {
				forward = new SHPopupReReLike().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHPopupReReLike : " + e);
			}
			break;
		case "/popup/SHPopupReReLikeCancel.bo" :
			try {
				forward = new SHPopupReReLikeCancel().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHPopupReReLikeCancel : " + e);
			}
			break;
		case "/popup/SHPopupReReRemove.bo" :
			try {
				forward = new SHPopupReReRemove().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHPopupReReRemove : " + e);
			}
			break;
		case "/popup/SHPopupReplyLikeCancel.bo" :
			try {
				forward = new SHPopupReplyLikeCancel().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHPopupReplyLikeCancel : " + e);
			}
			break;
		case "/popup/SHPopupReplyLike.bo" :
			try {
				forward = new SHPopupReplyLike().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHPopupReplyLike : " + e);
			}
			break;
		case "/popup/SHPopupReplyRemove.bo" :
			try {
				forward = new SHPopupReplyRemove().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHPopupReplyRemove : " + e);
			}
			break;
		case "/board/SHRemoveBoard.bo" :
			try {
				forward = new SHRemoveBoard().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHRemoveBoard : " + e);
			}
			break;
		case "/go/SHAlgorithm.bo" :
			try {
				forward = new SHAlgorithm().execute(request, response);
			} catch (Exception e) {
				System.out.println("SHAlgorithm : " + e);
			}
			break;
		case "/go/BoardUpload.bo" :
			forward = new ActionForward();
			forward.setPath("/instagram/upload/upload.jsp");
			forward.setRedirect(false);
			break;
		case "/board/BoardWriteOk.bo":
			try {
				forward = new BoardWriteOkAction().execute(request, response);
			} catch (Exception e) {
				System.out.println("BoardWriteOk : "+e);
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

