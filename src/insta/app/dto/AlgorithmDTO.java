package insta.app.dto;

public class AlgorithmDTO {
	private int board_num;
	private String fileSysName;
	private int like_cnt;
	
	public AlgorithmDTO() {}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getFileSysName() {
		return fileSysName;
	}

	public void setFileSysName(String fileSysName) {
		this.fileSysName = fileSysName;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	
}
