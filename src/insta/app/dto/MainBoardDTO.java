package insta.app.dto;

import java.util.ArrayList;

//	메인 화면으로 갈 때 가져가야 할 게시글 기본정보 dto
public class MainBoardDTO {
	private int boardNum;										//	boardnum
	private String boardId;										//	게시자 id
	private String writerImg;									//	게시자 프로필 사진
	private String boardDate;									//	게시 일자
	private String timeInterval;								//	현재 시간과 게시 일자간 시간 차이
	private String boardContents;								//	게시글 내용
	private int boardLikeCnt;									//	게시글 좋아요 수
	private ArrayList<String> boardImages;						//	게시글에 업로드된 이미지들
	private int boardReplyCnt;									//	게시글에 달린 댓글의 수
	private ArrayList<String> myReplyList;						//	로그인한 유저가 해당 게시물에 남긴 댓글들
	private boolean checkLikeBoard;								//	로그인한 유저가 해당 게시물에 좋아요를 눌렀는지 안눌렀는지
	private boolean checkBookmarkBoard;							//	로그인한 유저가 해당 게시물에 북마크를 눌렀는지 안눌렀는지
	
	public MainBoardDTO() {}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public String getWriterImg() {
		return writerImg;
	}

	public void setWriterImg(String writerImg) {
		this.writerImg = writerImg;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	
	public String getTimeInterval() {
		return timeInterval;
	}

	public void setTimeInterval(String timeInterval) {
		this.timeInterval = timeInterval;
	}

	public String getBoardContents() {
		return boardContents;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}

	public int getBoardLikeCnt() {
		return boardLikeCnt;
	}

	public void setBoardLikeCnt(int boardLikeCnt) {
		this.boardLikeCnt = boardLikeCnt;
	}

	public ArrayList<String> getBoardImages() {
		return boardImages;
	}

	public void setBoardImages(ArrayList<String> boardImages) {
		this.boardImages = boardImages;
	}

	public int getBoardReplyCnt() {
		return boardReplyCnt;
	}

	public void setBoardReplyCnt(int boardReplyCnt) {
		this.boardReplyCnt = boardReplyCnt;
	}

	public ArrayList<String> getMyReplyList() {
		return myReplyList;
	}

	public void setMyReplyList(ArrayList<String> myReplyList) {
		this.myReplyList = myReplyList;
	}

	public boolean isCheckLikeBoard() {
		return checkLikeBoard;
	}

	public void setCheckLikeBoard(boolean checkLikeBoard) {
		this.checkLikeBoard = checkLikeBoard;
	}

	public boolean isCheckBookmarkBoard() {
		return checkBookmarkBoard;
	}

	public void setCheckBookmarkBoard(boolean checkBookmarkBoard) {
		this.checkBookmarkBoard = checkBookmarkBoard;
	}
}
