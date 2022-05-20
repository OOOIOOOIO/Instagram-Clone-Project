package insta.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;

import insta.app.dto.AlgorithmDTO;
import insta.app.dto.BoardDTO;
import insta.app.dto.BoardFileDTO;
import insta.app.dto.FollowDTO;
import insta.app.dto.ReReDTO;
import insta.app.dto.ReplyDTO;
import insta.app.dto.UserDTO;
import insta.mybatis.SqlMapConfig;

public class SeongHakDAO {
	SqlSession sqlSession;
	
	public SeongHakDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}

//	================================================================================ 회원님을 위한 추천 모두보기 관련 메소드====================
//	로그인한 유저가 팔로우하지 않은 유저들의 정보를 가져오는 메소드
	public List<UserDTO> getRecommandUserList(String loginUserId) {
		return sqlSession.selectList("SeongHak.getRecommandUserList", loginUserId);
	}
//	로그인한 유저와 추천받은 유저간 팔로우 관계 정보를 가져오는 메소드
	public List<FollowDTO> getRelatedFollowers(String targetId, String loginUserId) {
		HashMap<String, String> conditions = new HashMap<String, String>();
		conditions.put("targetId", targetId);
		conditions.put("loginUserId", loginUserId);
		return sqlSession.selectList("SeongHak.getRelatedFollowers", conditions);
	}
//	추천할 사람이 업로드한 게시물 정보를 가져오는 메소드
	public List<BoardDTO> getUserBoardList(String userId) {
		return sqlSession.selectList("SeongHak.getUserBoardList", userId);
	}
//	해당 게시물에 속한 이미지 리스트를 가지고 오는 메소드
	public List<BoardFileDTO> getOneBoardImgSysName(int board_num) {
		return sqlSession.selectList("SeongHak.getOneBoardImgSysName", board_num);
	}
//	추천된 사람의 팔로우 수를 가지고 오는 메소드
	public int getUserFollowCnt(String userId) {
		return sqlSession.selectOne("SeongHak.getUserFollowCnt", userId);
	}
//	추천된 사람의 팔로워 수를 가지고 오는 메소드
	public int getUserFollowerCnt(String userId) {
		return sqlSession.selectOne("SeongHak.getUserFollowerCnt", userId);
	}
//	팔로우 관계를 insert 하는 메소드
	public boolean followSelectedUser(String loginUserId, String followId) {
		HashMap<String, String> values = new HashMap<String, String>();
		values.put("loginUserId", loginUserId);
		values.put("followId", followId);
		return sqlSession.insert("SeongHak.followSelectedUser", values) == 1;
	}
//	팔로우 관계를 delete 하는 메소드
	public boolean followCancelSelectedUser(String loginUserId, String followId) {
		HashMap<String, String> conditions = new HashMap<String, String>();
		conditions.put("loginUserId", loginUserId);
		conditions.put("followId", followId);
		return sqlSession.delete("SeongHak.followCancelSelectedUser", conditions) == 1;
	}
//	==================================================================================== main화면 게시글 관련 메소드
//	로그인한 유저의 정보를 가져오는 메소드
	public UserDTO getloginUserInfo(String loginUserId) {
		return sqlSession.selectOne("SeongHak.getloginUserInfo", loginUserId);
	}
//	먼저 로그인한 유저의 아이디를 기준으로 자신의 게시물과 자신이 팔로우한 사람들의 게시물을 전부 가져온다
	public List<BoardDTO> getMeAndFollowerBoardList(String loginUserId) {
		return sqlSession.selectList("SeongHak.getMeAndFollowerBoardList", loginUserId);
	}
//	사용자 정보 가져오는 메소드
	public UserDTO getUserInfo(String userId) {
		return sqlSession.selectOne("SeongHak.getUserInfo", userId);
	}
//	게시물의 좋아요 수를 가지고 오는 메소드
	public int getBoardLikeCount(int board_num) {
		return sqlSession.selectOne("SeongHak.getBoardLikeCount", board_num);
	}
//	게시물에 포함된 이미지들의 sysname을 가지고 오는 메소드
	public List<String> getBoardImagesAsSysname(int board_num) {
		return sqlSession.selectList("SeongHak.getBoardImagesAsSysname", board_num);
	}
//	게시물에 달린 댓글들을 가져오는 메소드
	public List<ReplyDTO> getBoardReplyListAsBoardNum(int board_num) {
		return sqlSession.selectList("SeongHak.getBoardReplyListAsBoardNum", board_num);
	}
//	게시물에 좋아요를 눌렀으면 true를 반환 누르지 않았으면 false를 반환
	public boolean checkLikeBoard(String loginUserId, int board_num) {
		HashMap<String, Object> conditions = new  HashMap<String, Object>();
		conditions.put("loginUserId", loginUserId);
		conditions.put("board_num", board_num);
		int result = sqlSession.selectOne("SeongHak.checkLikeBoard", conditions);
		return result == 1;
	}
//	게시물에 북마크를 눌렀으면 true를 반환 누르지 않았으면 false를 반환
	public boolean checkBookmarkBoard(String loginUserId, int board_num) {
		HashMap<String, Object> conditions = new  HashMap<String, Object>();
		conditions.put("loginUserId", loginUserId);
		conditions.put("board_num", board_num);
		int result = sqlSession.selectOne("SeongHak.checkBookmarkBoard", conditions);
		return result == 1;
	}
//	메인화면에서 게시글 좋아요를 취소하는 메소드 (정보를 db에서 delete 한다)
	public boolean cancelBoardLike(int boardNum, String userId) {
		HashMap<String, Object> conditions = new  HashMap<String, Object>();
		conditions.put("boardNum", boardNum);
		conditions.put("userId", userId);
		return sqlSession.delete("SeongHak.cancelBoardLike", conditions) == 1;
	}
//	메인화면에서 게시글 좋아요를 누르는 메소드 (정보를 db에 insert 한다)
	public boolean clickBoardLike(int boardNum, String userId) {
		HashMap<String, Object> conditions = new  HashMap<String, Object>();
		conditions.put("boardNum", boardNum);
		conditions.put("userId", userId);
		return sqlSession.insert("SeongHak.clickBoardLike", conditions) == 1;
	}
//	메인화면에서 게시글 북마크를 취소하는 메소드 (정보를 db에서 delete 한다)
	public boolean cancelBoardBookmark(int boardNum, String bookmarkId) {
		HashMap<String, Object> conditions = new  HashMap<String, Object>();
		conditions.put("boardNum", boardNum);
		conditions.put("bookmarkId", bookmarkId);
		return sqlSession.delete("SeongHak.cancelBoardBookmark", conditions) == 1;
	}
//	메인화면에서 게시글 북마크를 추가하는 메소드 (정보를 db에 insert 한다)
	public boolean clickBoardBookmark(int boardNum, String bookmarkId) {
		HashMap<String, Object> conditions = new  HashMap<String, Object>();
		conditions.put("boardNum", boardNum);
		conditions.put("bookmarkId", bookmarkId);
		return sqlSession.insert("SeongHak.clickBoardBookmark", conditions) == 1;
	}
//	메인화면에서 게시글에 댓글을 추가하는 메소드 (정보를 db에 insert 한다)
	public boolean writeReplyBoard(String replyId, String replyContents, int boardNum) {
		HashMap<String, Object> values = new  HashMap<String, Object>();
		values.put("replyId", replyId);
		values.put("replyContents", replyContents);
		values.put("boardNum", boardNum);
		return sqlSession.insert("SeongHak.writeReplyBoard", values) == 1;
	}
//	========================================================================================================= 팝업창 관련 메소드
//	선택한 board의 정보를 가지고 오는 메소드
	public BoardDTO getSelectedBoardInfoAsBoardNum(int boardNum) {
		return sqlSession.selectOne("SeongHak.getSelectedBoardInfoAsBoardNum", boardNum);
	}
//	댓글의 좋아요 수를 가지고 오는 메소드
	public int getReplyLikeCount(int reply_num) {
		int replyLikeCount = 0;
		replyLikeCount = sqlSession.selectOne("SeongHak.getReplyLikeCount", reply_num);
		return replyLikeCount;
	}
//	댓글에 좋아요를 눌렀는지 확인하는 메소드, 눌렀으면 true 안눌렀으면 false를 반환
	public boolean checkLikeReply(String loginUserId, int reply_num) {
		HashMap<String, Object> conditions = new  HashMap<String, Object>();
		conditions.put("loginUserId", loginUserId);
		conditions.put("replyNum", reply_num);
		int result = sqlSession.selectOne("SeongHak.checkLikeReply", conditions);
		return result == 1;
	}
//	댓글의 대댓글을 리스트로 가져오는 메소드
	public List<ReReDTO> getReplyReReListAsReplyNum(int reply_num) {
		return sqlSession.selectList("SeongHak.getReplyReReListAsReplyNum", reply_num);
	}
//	대댓글의 좋아요 수를 가지고 오는 메소드
	public int getReReLikeCount(int re_re_num) {
		int reReLikeCount = 0;
		reReLikeCount = sqlSession.selectOne("SeongHak.getReReLikeCount", re_re_num);
		return reReLikeCount;
	}
//	대댓글에 좋아요를 눌렀는지 확인하는 메소드, 눌렀으면 true 안눌렀으면 false를 반환
	public boolean checkLikeReRe(String loginUserId, int re_re_num) {
		HashMap<String, Object> conditions = new  HashMap<String, Object>();
		conditions.put("loginUserId", loginUserId);
		conditions.put("reReNum", re_re_num);
		int result = sqlSession.selectOne("SeongHak.checkLikeReRe", conditions);
		return result == 1;
	}
//	댓글을 작성했을 때 방금 작성한 댓글의 정보를 가지고 오는 메소드
	public ReplyDTO getMyNewReplyInfo(String replyId, int boardNum) {
		HashMap<String, Object> conditions = new  HashMap<String, Object>();
		conditions.put("replyId", replyId);
		conditions.put("boardNum", boardNum);
		return sqlSession.selectOne("SeongHak.getMyNewReplyInfo", conditions);
	}

	public boolean writeReRe(int replyNum, String reReContent, String reReId, int boardNum) {
		HashMap<String, Object> values = new HashMap<String, Object>();
		values.put("replyNum", replyNum);
		values.put("reReContent", reReContent);
		values.put("reReId", reReId);
		values.put("boardNum", boardNum);
		return sqlSession.insert("SeongHak.writeReRe", values) == 1;
	}
//	대댓글 좋아요를 추가하는 메소드
	public boolean likeReRe(String reReLikeId, int reReNum) {
		HashMap<String, Object> values = new HashMap<String, Object>();
		values.put("reReLikeId", reReLikeId);
		values.put("reReNum", reReNum);
		return sqlSession.insert("SeongHak.likeReRe", values) == 1;
	}
//	대댓글 좋아요를 취소하는 메소드
	public boolean cancelLikeReRe(String reReLikeId, int reReNum) {
		HashMap<String, Object> conditions = new HashMap<String, Object>();
		conditions.put("reReLikeId", reReLikeId);
		conditions.put("reReNum", reReNum);
		return sqlSession.delete("SeongHak.cancelLikeReRe", conditions) == 1;
	}
//	대댓글의 번호를 통해 해당 대댓글의 좋아요 정보를 모두 삭제
	public void removeReReLikeAsReReNum(int reReNum) {
		sqlSession.delete("SeongHak.removeReReLikeAsReReNum", reReNum);
	}
//	대댓글의 번호를 통해 해당 대댓글을 삭제
	public boolean removeReReAsReReNum(int reReNum, String reReId) {
		HashMap<String, Object> conditions = new HashMap<String, Object>();
		conditions.put("reReNum", reReNum);
		conditions.put("reReId", reReId);
		return sqlSession.delete("SeongHak.removeReReAsReReNum", conditions) == 1;
	}
//	댓글 좋아요를 추가하는 메소드 (db에 정보를 추가한다)
	public boolean likeReply(int replyNum, String replyLikeId) {
		HashMap<String, Object> values = new HashMap<String, Object>();
		values.put("replyLikeId", replyLikeId);
		values.put("replyNum", replyNum);
		return sqlSession.insert("SeongHak.likeReply", values) == 1;
	}
//	댓글 좋아요를 취소하는 메소드 (db에서 정보를 삭제한다)
	public boolean cancelLikeReply(int replyNum, String replyLikeId) {
		HashMap<String, Object> conditions = new HashMap<String, Object>();
		conditions.put("replyLikeId", replyLikeId);
		conditions.put("replyNum", replyNum);
		return sqlSession.delete("SeongHak.cancelLikeReply", conditions) == 1;
	}
//	댓글에 달린 모든 좋아요 정보를 삭제하는 메소드
	public void removeReplyLikeAsReplyNum(int replyNum) {
		sqlSession.delete("SeongHak.removeReplyLikeAsReplyNum", replyNum);
	}
//	댓글 번호를 통해 댓글을 삭제
	public boolean removeReplyAsReplyNumAndReplyId(int replyNum, String replyId) {
		HashMap<String, Object> conditions = new HashMap<String, Object>();
		conditions.put("replyNum", replyNum);
		conditions.put("replyId", replyId);
		return sqlSession.delete("SeongHak.removeReplyAsReplyNumAndReplyId", conditions) == 1;
	}
//	대댓글을 작성했을 때 방금 작성한 대댓글의 정보를 가지고 오는 메소드
	public ReReDTO getMyNewReReInfo(String reReId, int boardNum) {
		HashMap<String, Object> conditions = new HashMap<String, Object>();
		conditions.put("reReId", reReId);
		conditions.put("boardNum", boardNum);
		return sqlSession.selectOne("SeongHak.getMyNewReReInfo", conditions);
	}
//	게시글에 달린 모든 댓글 삭제
	public void removeReplyAsBoardNum(int boardNum) {
		sqlSession.delete("SeongHak.removeReplyAsBoardNum", boardNum);
	}
//	게시글에 달린 모든 대댓글 삭제
	public void removeReReAsBoardNum(int boardNum) {
		sqlSession.delete("SeongHak.removeReReAsBoardNum", boardNum);
	}
//	게시글에 달린 모든 좋아요 삭제
	public void removeBoardLikeAsBoardNum(int boardNum) {
		sqlSession.delete("SeongHak.removeBoardLikeAsBoardNum", boardNum);
	}
//	게시글에 달린 모든 북마크 삭제
	public void removeBoardBookmarkAsBoardNum(int boardNum) {
		sqlSession.delete("SeongHak.removeBoardBookmarkAsBoardNum", boardNum);
	}
//	게시글 삭제
	public boolean removeBoardAsBoardNum(int boardNum) {
		return sqlSession.delete("SeongHak.removeBoardAsBoardNum", boardNum) == 1;
	}
//	게시글 사진 모두 삭제
	public void removeBoardFileAsBoardNum(int boardNum) {
		sqlSession.delete("SeongHak.removeBoardFileAsBoardNum", boardNum);
	}
//	알고리즘에서 db에 존재하는 모든 board list를 좋아요 개수 내림차순으로 가져오는 메소드
	public List<AlgorithmDTO> getAllBoardListOrderByLikeCnt() {
		return sqlSession.selectList("SeongHak.getAllBoardListOrderByLikeCnt");
	}
//	메인 시작하기에서 프로필 사진 추가 시 수행
	public boolean updateMyProfileImage(String loginUserId, String profileImage) {
		HashMap<String, String> values = new HashMap<String, String>();
		values.put("loginUserId", loginUserId);
		values.put("profileImage", profileImage);
		return sqlSession.update("SeongHak.updateMyProfileImage", values) == 1;
	}

	public List<String> getBoardFilesSysnames(int boardNum) {
		return sqlSession.selectList("SeongHak.getBoardFilesSysnames", boardNum);
	}
	
}
