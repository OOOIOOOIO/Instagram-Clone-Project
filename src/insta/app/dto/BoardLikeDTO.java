package insta.app.dto;

public class BoardLikeDTO {
	private int board_num;
	private String board_like_id;
	
	public BoardLikeDTO() {}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_like_id() {
		return board_like_id;
	}

	public void setBoard_like_id(String board_like_id) {
		this.board_like_id = board_like_id;
	}
}
