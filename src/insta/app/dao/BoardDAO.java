package insta.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import insta.app.dto.BoardDTO;
import insta.mybatis.SqlMapConfig;

public class BoardDAO {
	SqlSession sqlSession;
	
	public BoardDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}

	public List<BoardDTO> getBoardList(String userid) {
		return sqlSession.selectList("Board.getBoardList",userid);
	}

	public int getBoardCnt(String userid) {
		return sqlSession.selectOne("Board.getBoardCnt",userid);
	}
}
