package insta.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import insta.app.dto.UserDTO;
import insta.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSession sqlSession;
	
	public UserDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}

	public List<UserDTO> getRecommendUser(String userid) {
		return sqlSession.selectList("User.getRecommendUser", userid);
	}

	public List<UserDTO> getSearchInfo(String search) {
		return sqlSession.selectList("User.getSearchInfo", search);
	}

	public int searchUserCnt(String search) {
		return sqlSession.selectOne("User.searchUserCnt", search);
	}
}
