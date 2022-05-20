package insta.app.board;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;
import insta.app.dto.ReReDTO;

public class SHPopupReplyRemove implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String replyId = req.getParameter("replyId");
		String replyNumStr = req.getParameter("replyNum");
		int replyNum = 0;
		if(replyNumStr != null) {
			replyNum = Integer.parseInt(replyNumStr);
		}
		SeongHakDAO hakDao = new SeongHakDAO();
		PrintWriter writer = resp.getWriter();
		
		List<ReReDTO> reReList = hakDao.getReplyReReListAsReplyNum(replyNum);
		for(ReReDTO reRe : reReList) {
			hakDao.removeReReLikeAsReReNum(reRe.getRe_re_num());
			hakDao.removeReReAsReReNum(reRe.getRe_re_num(), reRe.getRe_re_Id());
		}
		hakDao.removeReplyLikeAsReplyNum(replyNum);
		if(hakDao.removeReplyAsReplyNumAndReplyId(replyNum, replyId)) {
			writer.write("O");
		}
		else {
			writer.write("X");
		}
		writer.close();
		return null;
	}
}
