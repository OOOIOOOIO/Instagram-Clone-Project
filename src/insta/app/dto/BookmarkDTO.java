package insta.app.dto;

public class BookmarkDTO {
	private String bookmark_id;
	private int board_num;
	
	public BookmarkDTO() {}

	public String getBookmark_id() {
		return bookmark_id;
	}

	public void setBookmark_id(String bookmark_id) {
		this.bookmark_id = bookmark_id;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
}
