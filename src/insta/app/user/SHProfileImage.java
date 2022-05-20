package insta.app.user;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.SeongHakDAO;
import insta.app.dto.UserDTO;

public class SHProfileImage implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String saveFolder = "C:\\Programming\\INSTAGRAM_PROJECT\\workspace\\instagram_final\\WebContent\\img\\server_images\\profile_image";
		int size = 1024 * 1024 * 100;
		MultipartRequest multi = new MultipartRequest(req, saveFolder, size,"UTF-8", new DefaultFileRenamePolicy());
		PrintWriter writer = resp.getWriter();
		String profileImage = multi.getFilesystemName("profileImageInput");
		if(req.getSession().getAttribute("loginUser") != null && profileImage != null) {
			SeongHakDAO hakDao = new SeongHakDAO();
			UserDTO loginUser = (UserDTO)req.getSession().getAttribute("loginUser");
			if(loginUser.getUser_img() != null) {
				File preImage = new File(saveFolder, loginUser.getUser_img());
				if(preImage.exists()) {
					preImage.delete();
				}
			}
			String loginUserId = loginUser.getUser_id();
			if(hakDao.updateMyProfileImage(loginUserId, profileImage)) {
				loginUser = hakDao.getloginUserInfo(loginUserId);
				req.getSession().setAttribute("loginUser", loginUser);
				writer.write(profileImage);
			}
			else {
				writer.write("X");
			}
		}
		writer.close();
		return null;
	}
}
