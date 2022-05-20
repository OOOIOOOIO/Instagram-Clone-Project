package insta.app.dto;

public class DmDTO {
	private int dm_num;			//	dm 번호
	private String dm_date;
	private String dm_from;
	private String dm_to;
	private String dm_contents;
	
	public DmDTO() {}

	public int getDm_num() {
		return dm_num;
	}

	public void setDm_num(int dm_num) {
		this.dm_num = dm_num;
	}

	public String getDm_date() {
		return dm_date;
	}

	public void setDm_date(String dm_date) {
		this.dm_date = dm_date;
	}

	public String getDm_from() {
		return dm_from;
	}

	public void setDm_from(String dm_from) {
		this.dm_from = dm_from;
	}

	public String getDm_to() {
		return dm_to;
	}

	public void setDm_to(String dm_to) {
		this.dm_to = dm_to;
	}

	public String getDm_contents() {
		return dm_contents;
	}

	public void setDm_contents(String dm_contents) {
		this.dm_contents = dm_contents;
	}
}
