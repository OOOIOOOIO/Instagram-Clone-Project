package insta.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import insta.app.dto.BoardFileDTO;
import insta.mybatis.SqlMapConfig;

public class BoardFileDAO {
	SqlSession sqlSession;
	
	public BoardFileDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}

	public String getBoardFileSysName(int board_num) {
		return sqlSession.selectOne("Board.getBoardFileSysName", board_num);
	}
}
