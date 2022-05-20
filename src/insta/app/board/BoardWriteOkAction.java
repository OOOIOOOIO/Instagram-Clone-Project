package insta.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.MinjuDAO;
import insta.app.dto.BoardDTO;
import insta.app.dto.BoardFileDTO;

public class BoardWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MinjuDAO mdao = new MinjuDAO();
		
		//파일이 저장될 경로
//		String saveFolder = req.getServletContext().getRealPath("/img/server_images/board_images");
		String saveFolder = "C:\\Programming\\INSTAGRAM_PROJECT\\workspace\\instagram_final\\WebContent\\img\\server_images\\board_images";
		//저장될 파일의 크기(5MB)	
		int size = 1024*1024*100;
		
		//cos
		//form에서 enctype을 multipart/form-data 로 보냈다면 필요한 객체(파일 업로드)
		MultipartRequest multi = new MultipartRequest(req, saveFolder,
				size,"UTF-8",new DefaultFileRenamePolicy());
		
		boolean fcheck1 = false;
		boolean fcheck2 = false;
		
		//<input type="file"> 중에 name이 file1 인 태그로 올린 파일이 있다면, 그 파일이 폴더에 저장되어 있는 이름
		String filename1 = multi.getFilesystemName("file");
		System.out.println(filename1);
		if(filename1 == null) {
			fcheck1 = true;
		}
		//파일을 올릴 때 사용자가 올렸던 이름(다운로드시에는 이 이름으로 다운로드 되게 해야함)
		String orgname1 = multi.getOriginalFileName("file");
		
		String filename2 = multi.getFilesystemName("file1");
		System.out.println(filename2);
		if(filename2 == null) {
			fcheck2 = true;
		}
		String orgname2 = multi.getOriginalFileName("file1");
		
		String board_id = multi.getParameter("board_id");
		String board_contents = multi.getParameter("board_contents");

		BoardDTO board = new BoardDTO();
		board.setBoard_id(board_id);
		board.setBoard_contents(board_contents);
		
		int boardnum = 0;
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(mdao.insertBoard(board)) {
			boardnum = mdao.getLastNum(board_id);
			
			if(!fcheck1) {
				BoardFileDTO file = new BoardFileDTO();
				file.setFile_sysName(filename1);
				file.setFile_orgName(orgname1);
				file.setBoard_num(boardnum);
				
				fcheck1 = mdao.insertFile(file);
			}
			if(!fcheck2) {
				BoardFileDTO file = new BoardFileDTO();
				file.setFile_sysName(filename2);
				file.setFile_orgName(orgname2);
				file.setBoard_num(boardnum);
				
				fcheck2 = mdao.insertFile(file);
			}
			
			if(fcheck1 && fcheck2) {
				forward.setPath(req.getContextPath()+"/go/MainBoard.bo?write=true&loginUserId="+board_id);
				return forward;
			}
		}
		forward.setPath(req.getContextPath()+"/go/MainBoard.bo?write=false&loginUserId="+board_id);
		return forward;
	}
	
}
