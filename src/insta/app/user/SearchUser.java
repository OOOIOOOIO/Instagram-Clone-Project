package insta.app.user;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import insta.action.Action;
import insta.action.ActionForward;
import insta.app.dao.UserDAO;
import insta.app.dto.UserDTO;

public class SearchUser implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		String search = req.getParameter("search");

		List<UserDTO> search_user_info = udao.getSearchInfo(search);
		int searchCnt = udao.searchUserCnt(search);

		JSONArray jarr = new JSONArray();
		String[] search_id = new String[searchCnt];
		String[] search_name = new String[searchCnt];
		String[] search_img = new String[searchCnt];
		
		for (int i = 0; i < searchCnt; i++) {
			search_id[i] = search_user_info.get(i).getUser_id();
			search_name[i] = search_user_info.get(i).getUser_name();
			search_img[i] = search_user_info.get(i).getUser_img();
		}
		
		JSONObject[] in = new JSONObject[searchCnt];
		for(int i = 0; i < in.length; i++) {
			JSONObject j = new JSONObject();
			j.put("id", search_id[i]);
			j.put("name", search_name[i]);
			j.put("img", search_img[i]);
			jarr.add(j);
		}
		JSONObject out = new JSONObject();
		out.put("search_user", jarr);
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		writer.print(out);
		return null;
	}
}
