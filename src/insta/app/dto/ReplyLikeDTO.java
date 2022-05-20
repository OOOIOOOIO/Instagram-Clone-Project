package insta.app.dto;

public class ReplyLikeDTO {
	private int reply_num;
	private String reply_like_id;
	
	public ReplyLikeDTO() {}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public String getReply_like_id() {
		return reply_like_id;
	}

	public void setReply_like_id(String reply_like_id) {
		this.reply_like_id = reply_like_id;
	}
}
