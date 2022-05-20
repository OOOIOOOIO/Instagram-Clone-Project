package insta.app.dto;

import java.util.ArrayList;

//	recommand_all_view에 전달할 dto
public class RecommandAllDTO {
	private String userId;					//	추천할 user의 id
	private String userName;				//	추천할 user의 name
	private String userImg;					//	추천할 user의 프로필 이미지
	private int relatedFollowCnt;			//	내가 팔로우하고 있는 사람중에 몇 명이 추천할 유저를 팔로우하고 있는지
	private String relatedFollowFirstId;	//	1명이상이면 첫번재 user의 id를 여기에 저장한다.
	private int myBoardCnt;					//	추천할 user의 게시물 개수
	private ArrayList<String> boardImages;	//	업로드한 게시물의 첫번째 이미지를 하나씩 담는다
	private int followCnt;					//	추천할 user가 팔로우하는 사람들의 수
	private int followerCnt;				//	추천할 user를 팔로우하는 사람들의 수
	
	public RecommandAllDTO() {}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public int getRelatedFollowCnt() {
		return relatedFollowCnt;
	}

	public void setRelatedFollowCnt(int relatedFollowCnt) {
		this.relatedFollowCnt = relatedFollowCnt;
	}

	public String getRelatedFollowFirstId() {
		return relatedFollowFirstId;
	}

	public void setRelatedFollowFirstId(String relatedFollowFirstId) {
		this.relatedFollowFirstId = relatedFollowFirstId;
	}

	public int getMyBoardCnt() {
		return myBoardCnt;
	}

	public void setMyBoardCnt(int myBoardCnt) {
		this.myBoardCnt = myBoardCnt;
	}

	public ArrayList<String> getBoardImages() {
		return boardImages;
	}

	public void setBoardImages(ArrayList<String> boardImages) {
		this.boardImages = boardImages;
	}

	public int getFollowCnt() {
		return followCnt;
	}

	public void setFollowCnt(int followCnt) {
		this.followCnt = followCnt;
	}

	public int getFollowerCnt() {
		return followerCnt;
	}

	public void setFollowerCnt(int followerCnt) {
		this.followerCnt = followerCnt;
	}
}
