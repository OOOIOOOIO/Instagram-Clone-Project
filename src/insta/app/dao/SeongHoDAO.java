package insta.app.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import insta.app.dto.UserDTO;

import insta.mybatis.SqlMapConfig;

public class SeongHoDAO {
	SqlSession sqlSession;

	public SeongHoDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean join_phone(UserDTO newUser) {
		int result = sqlSession.insert("User.join_phone", newUser);

		return result == 1;
	}

	public boolean join_email(UserDTO newUser) {
		int result = sqlSession.insert("User.join_email", newUser);
		return result == 1;
	}

	public boolean join_birth_phone(String user_birth, String user_phone) {
		HashMap<String, String> datas = new HashMap<String, String>();

		datas.put("user_birth", user_birth);
		datas.put("user_phone", user_phone);
		int result = sqlSession.update("User.join_birth_phone", datas);

		return result == 1;
	}

	public boolean join_birth_email(String user_birth, String user_email) {
		HashMap<String, String> datas = new HashMap<String, String>();

		datas.put("user_birth", user_birth);
		datas.put("user_email", user_email);
		int result = sqlSession.update("User.join_birth_email", datas);

		return result == 1;
	}

	// user_id session 삭제
	public boolean session_delete(String user_id) {
		int result = sqlSession.delete("User.session_delete", user_id);

		return result == 1;
	}

	public boolean check_id(String user_id) {
		int check_id = sqlSession.selectOne("User.check_id", user_id);

		return check_id == 1;
	}

	public boolean check_phone(String user_phone) {

		int check_phone = sqlSession.selectOne("User.check_phone", user_phone);

		return check_phone == 1;
	}

	public boolean check_email(String user_email) {

		int check_email = sqlSession.selectOne("User.check_email", user_email);

		return check_email == 1;
	}

	public UserDTO login_id(String user_id, String user_pw) {
		UserDTO result = null;
		HashMap<String, String> datas = new HashMap<String, String>();

		datas.put("user_id", user_id);
		datas.put("user_pw", user_pw);
		result = sqlSession.selectOne("User.login_id", datas);

		return result;
	}

	public UserDTO login_phone(String user_phone, String user_pw) {
		UserDTO result = null;
		HashMap<String, String> datas = new HashMap<String, String>();

		datas.put("user_phone", user_phone);
		datas.put("user_pw", user_pw);
		result = sqlSession.selectOne("User.login_phone", datas);

		return result;
	}

	public UserDTO login_email(String user_email, String user_pw) {
		UserDTO result = null;
		HashMap<String, String> datas = new HashMap<String, String>();

		datas.put("user_email", user_email);
		datas.put("user_pw", user_pw);
		result = sqlSession.selectOne("User.login_email", datas);

		return result;
	}

	// mypage 비밀번호 변경
	public boolean mypage_changePw(String user_pw, String user_id) {
		HashMap<String, String> datas = new HashMap<String, String>();

		datas.put("user_pw", user_pw);
		datas.put("user_id", user_id);
		int result = sqlSession.update("User.mypage_changePw", datas);

		return result == 1;
	}

	public boolean update_user(String session_id, UserDTO loginUser) {
		HashMap<String, Object> datas = new HashMap<String, Object>();

		datas.put("session_id", session_id);
		datas.put("loginUser", loginUser);
		int result = sqlSession.update("User.update_user", datas);

		return result == 1;
	}

	public UserDTO getUserId(String user_id) {
		return sqlSession.selectOne("User.getUserId", user_id);

	}

	public UserDTO getUserPhone(String user_phone) {
		return sqlSession.selectOne("User.getUserPhone", user_phone);

	}

	public UserDTO getUserEmail(String user_email) {
		return sqlSession.selectOne("User.getUserEmail", user_email);

	}

}