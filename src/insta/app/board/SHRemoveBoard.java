package insta.app.board;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.BoardFileDAO;
import insta.app.dao.SeongHakDAO;
import insta.app.dto.BoardFileDTO;
import insta.app.dto.ReReDTO;
import insta.app.dto.ReplyDTO;
import insta.app.dto.UserDTO;

public class SHRemoveBoard implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String boardNumStr = req.getParameter("boardNum");
		int boardNum = 0;
		if(boardNumStr != null) {
			boardNum = Integer.parseInt(boardNumStr);
		}
		
		SeongHakDAO hakDao = new SeongHakDAO();
		PrintWriter writer = resp.getWriter();
		
		List<ReplyDTO> replyList = hakDao.getBoardReplyListAsBoardNum(boardNum);
		if(replyList.size() != 0) {
			for(ReplyDTO reply : replyList) {
				List<ReReDTO> reReList = hakDao.getReplyReReListAsReplyNum(reply.getReply_num());
				if(reReList.size() != 0) {
					for(ReReDTO reRe : reReList) {
						hakDao.removeReReLikeAsReReNum(reRe.getRe_re_num());
					}
				}
				hakDao.removeReplyLikeAsReplyNum(reply.getReply_num());
			}
		}
		
		hakDao.removeReReAsBoardNum(boardNum);
		hakDao.removeReplyAsBoardNum(boardNum);
		hakDao.removeBoardLikeAsBoardNum(boardNum);
		hakDao.removeBoardBookmarkAsBoardNum(boardNum);
		List<String> myBoardFilesSysnames = hakDao.getBoardFilesSysnames(boardNum);
		String saveFolder  = "C:\\Programming\\INSTAGRAM_PROJECT\\workspace\\instagram_final\\WebContent\\img\\server_images\\board_images";
		for(String boardSySName : myBoardFilesSysnames) {
			File removeTarget = new File(saveFolder, boardSySName);
			if(removeTarget.exists()) {
				removeTarget.delete();
			}
		}
		hakDao.removeBoardFileAsBoardNum(boardNum);
		if(hakDao.removeBoardAsBoardNum(boardNum)) {
			writer.write("O");
		}
		else {
			writer.write("X");
		}
		writer.close();
		
		return null;
	}
}
