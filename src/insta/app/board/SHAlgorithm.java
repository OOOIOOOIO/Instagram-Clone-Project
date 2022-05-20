package insta.app.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;
import insta.app.dto.AlgorithmDTO;
import insta.app.dto.BoardDTO;
import insta.app.dto.UserDTO;

public class SHAlgorithm implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward result = new ActionForward();
		if(req.getSession().getAttribute("loginUser") == null) {
			result.setPath("/user/UserLogin.us");
			result.setRedirect(false);
			return result;
		}
		String loginUserId = ((UserDTO)(req.getSession().getAttribute("loginUser"))).getUser_id();
//		String loginUserId = req.getParameter("loginUserId");
		SeongHakDAO hakDao = new SeongHakDAO();
//		로그인한 유저가 없다면
		if(loginUserId == null) {
			result.setPath("/user/UserLogin.us");
			result.setRedirect(false);
		}
		else {
			ArrayList<AlgorithmDTO> algorithmBoardList = new ArrayList<AlgorithmDTO>();
			List<AlgorithmDTO> allBoard = hakDao.getAllBoardListOrderByLikeCnt();
			for(AlgorithmDTO board : allBoard) {
				AlgorithmDTO algorithmBoard = new AlgorithmDTO();
				algorithmBoard.setBoard_num(board.getBoard_num());
				algorithmBoard.setFileSysName(hakDao.getOneBoardImgSysName(board.getBoard_num()).get(0).getFile_sysName());
				algorithmBoardList.add(algorithmBoard);
			}
			req.setAttribute("AlgorithmBoardList", algorithmBoardList);
			result.setRedirect(false);
			result.setPath("/instagram/algorithm/algorithm.jsp");
		}
		return result;
	}
}
