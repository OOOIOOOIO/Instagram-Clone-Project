package insta.app.user;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.BoardDAO;
import insta.app.dao.BoardFileDAO;
import insta.app.dao.UserDAO;
import insta.app.dto.BoardDTO;
import insta.app.dto.BoardFileDTO;
import insta.app.dto.UserDTO;

public class UserProfile implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		BoardDAO bdao = new BoardDAO();
		BoardFileDAO bfdao = new BoardFileDAO();
		ActionForward forward = new ActionForward();
		
		String userid = req.getParameter("userid");
		List<BoardDTO> getBoardList = bdao.getBoardList(userid);
		int boardCnt = bdao.getBoardCnt(userid);
		
		HashMap<String, Integer> board_info = new HashMap<String, Integer>();
		for(BoardDTO boardList:getBoardList) {
			String getBoardFileSysName = bfdao.getBoardFileSysName(boardList.getBoard_num());
			board_info.put(getBoardFileSysName, boardList.getBoard_num());
		}
		req.setAttribute("board_info", board_info);
		req.setAttribute("recommendUser", udao.getRecommendUser("harrystyles"));
		
		forward.setRedirect(false);
		forward.setPath("/instagram/story/story_view.jsp");
		return forward;
	}
}
