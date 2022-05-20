package insta.app.dto;

public class BoardFileDTO {
	private String file_sysName;
	private String file_orgName;
	private int board_num;
	
	public BoardFileDTO() {}

	public String getFile_sysName() {
		return file_sysName;
	}

	public void setFile_sysName(String file_sysName) {
		this.file_sysName = file_sysName;
	}

	public String getFile_orgName() {
		return file_orgName;
	}

	public void setFile_orgName(String file_orgName) {
		this.file_orgName = file_orgName;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
}
