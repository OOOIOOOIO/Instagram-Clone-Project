package insta.app.dao;

import org.apache.ibatis.session.SqlSession;

import insta.app.dto.BoardDTO;
import insta.app.dto.BoardFileDTO;
import insta.mybatis.SqlMapConfig;

public class MinjuDAO {
	SqlSession sqlSession;
	
	public MinjuDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public boolean insertBoard(BoardDTO board) {
		return 1 == sqlSession.insert("Board.insertBoard",board);
	}
	public int getLastNum(String boardid) {
		return sqlSession.selectOne("Board.getLastNum",boardid);
	}
	public boolean insertFile(BoardFileDTO file) {
		return 1 == sqlSession.insert("Board.insertFile",file);
	}
}
