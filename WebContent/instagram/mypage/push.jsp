<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Push</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<link rel="stylesheet" type="text/css" href="${cp}/css/yooncheol/push/push.css"/>
</head>
<body style="height:100%; background-color: rgba(var(--b3f,250,250,250),1); margin:0;">
	<nav>
		<div class="header">
			<div class="insta_logo">
				<a href=""><img src="${cp}/img/yooncheol/header/logo.png"></a>
			</div>
			<div class="search2">
				<input type="search" class="search" placeholder="검색">
			</div>
			<div class="insta_menu">
				<a href=""><img src="${cp}/img/yooncheol/header/home.png"></a>
				<a href=""><img src="${cp}/img/yooncheol/header/dm.png"></a>
				<a href=""><img src="${cp}/img/yooncheol/header/upload.png"></a>
				<a href=""><img src="${cp}/img/yooncheol/header/algorithm.png"></a>
				<a href=""><img src="${cp}/img/yooncheol/header/alert.png"></a>
				<a href="${cp}/instagram/mypage/mypage.jsp"><img src="${cp}/img/yooncheol/header/mypage.png"></a>
			</div>
		</div>
	</nav>
	<article>
		<div class="wrap" style="background-color: white;">
			<div class="list">
				<ul>
					<a href="${cp}/user/UserEditProfile.us"><li>프로필 편집</li></a>
					<a href="${cp}/user/UserChangePassword.us"><li>비밀번호 변경</li></a>
					<a href="${cp}/instagram/mypage/app_website.jsp"><li>앱 및 웹사이트</li></a>
					<a href="${cp}/instagram/mypage/email_and_sms.jsp"><li>이메일 및 SMS</li></a>
					<a href="${cp}/instagram/mypage/push.jsp"><li>푸시 알림</li></a>
					<a href="${cp}/instagram/mypage/contact.jsp"><li>연락처 관리</li></a>
					<a href="${cp}/instagram/mypage/personal_information.jsp"><li>개인정보 및 보안</li></a>
					<a href=""><li>로그인 활동</li></a>
					<a href="${cp}/instagram/mypage/insta_email_security.jsp"><li>Instagram에서 보낸 이메<br>일</li></a>
					<a href="${cp}/instagram/mypage/Help.jsp"><li>도움말</li></a>
					<a href="${cp}/instagram/mypage/professional_account.jsp"><li class="change">프로페셔널 계정으로 전환</li></a>
				</ul>
			</div>
			<div class="set">
				<img src="${cp}/img/yooncheol/list/meta.png">
				<a href=""><h4 class="center">계정 센터</h4>
				<div>스토리 및 게시물 공유, 로그인 등 Instagram, Facebook 앱, Messenger 간에 연결된 환경에 대한 설정을 관리하세요.</div></a>
			</div>
			<div class="main">
			<section>
				<div class="likecover">
					<h2 class="like">좋아요</h2>
				</div>
				<div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" id="like" name="likes" type="radio" value="1">
								해제
							</div>
						</label>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" id="like" name="likes" type="radio" value="2">
								내가 팔로우 하는 사람
							</div>
						</label>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" id="like" name="likes" type="radio" value="3" checked>
								모든 사람
							</div>
						</label>
						<div class="detail_box">
							<div class="detail2">
								johnappleseed님이 회원님의 사진을 좋아합니다.
							</div>
						</div>
					</fieldset>
			</section>
			<section>
					
				<div class="likecover">
					<h2 class="like">댓글</h2>
				</div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" id="comment" name="comments" type="radio" value="1">
								해제
							</div>
						</label>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" id="comment" name="comments" type="radio" value="2">
								내가 팔로우 하는 사람
							</div>
						</label>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" id="comment" name="comments" type="radio" value="3" checked>
								모든 사람
							</div>
						</label>
						<div class="detail_box">
							<div class="detail2">
								johnappleseed님이 댓글을 남겼습니다: "멋지네요!"
							</div>
						</div>
					</fieldset>
			</section>
			<section>
					
				<div class="likecover">
					<h2 class="like">댓글 좋아요</h2>
				</div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" id="coLike" name="co_likes" type="radio" value="1">
								해제
							</div>
						</label>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" id="coLike" name="co_likes" type="radio" value="2" checked>
								내가 팔로우 하는 사람
							</div>
						</label>						
						<div class="detail_box">
							<div class="detail2">
								johnappleseed님이 회원님의 댓글을 좋아합니다: "멋지네요!"
							</div>
						</div>
					</fieldset>
			</section>
			<section>
					
				<div class="likecover">
					<h2 class="like">회원님이 나온 사진의 좋아요 및 댓글</h2>
				</div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="tag_likes" type="radio" value="1">
								해제
							</div>
						</label>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="tag_likes" type="radio" value="2" checked>
								내가 팔로우 하는 사람
							</div>
						</label>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="tag_likes" type="radio" value="3">
								모든 사람
							</div>
						</label>
						<div class="detail_box">
							<div class="detail2">
								johnappleseed님이 회원님이 태그된 게시물에 댓글을 남겼습니다.
							</div>
						</div>
					</fieldset>
			</section>
			<section>
					
				<div class="likecover">
					<h2 class="like">수락한 팔로우 요청</h2>
				</div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="follow" type="radio" value="1">
								해제
							</div>
						</label>						
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="follow" type="radio" value="2" checked>
								모든 사람
							</div>
						</label>
						<div class="detail_box">
							<div class="detail2">
								john Appleseed(@johnappleseed)님이 팔로우 요청을 수락했습니다.
							</div>
						</div>
					</fieldset>
			</section>
			<section>
					
				<div class="likecover">
					<h2 class="like">Instagram Direct 요청</h2>
				</div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="DM_request" type="radio" value="1">
								해제
							</div>
						</label>						
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="DM_request" type="radio" value="2" checked>
								모든 사람
							</div>
						</label>
						<div class="detail_box">
							<div class="detail2">
								johnappleseed님이 메세지를 보내고 싶어합니다.
							</div>
						</div>
					</fieldset>
			</section>
			<section>
					
				<div class="likecover">
					<h2 class="like">Instagram Direct</h2>
				</div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="DM" type="radio" value="1">
								해제
							</div>
						</label>						
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="DM" type="radio" value="2" checked>
								모든 사람
							</div>
						</label>
						<div class="detail_box">
							<div class="detail2">
								@johnappleseed님이 메세지를 보냈습니다.
							</div>
						</div>
					</fieldset>
			</section>
			<section>
					
				<div class="likecover">
					<h2 class="like">알림</h2>
				</div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="notice" type="radio" value="1">
								해제
							</div>
						</label>						
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="notice" type="radio" value="3" checked>
								모든 사람
							</div>
						</label>
						<div class="detail_box">
							<div class="detail2">
								"알림을 읽지 않으셨습니다" 등을 안내하는 알림입니다.
							</div>
						</div>
					</fieldset>
			</section>
			<section>
					
				<div class="likecover">
					<h2 class="like">첫 게시물과 스토리</h2>
				</div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="story" type="radio" value="1">
								해제
							</div>
						</label>						
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="story" type="radio" value="2">
								내가 팔로우하는 사람
							</div>
						</label>						
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="story" type="radio" value="3" checked>
								모든 사람
							</div>
						</label>
						<div class="detail_box">
							<div class="detail2">
								johnappleseed님의 첫 Instagran 스토리 게시 등을 안내하는 알림입니다.
							</div>
						</div>
					</fieldset>
			</section>
			<section>
					
				<div class="likecover">
					<h2 class="like">동영상 조회수</h2>
				</div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="views" type="radio" value="1">
								해제
							</div>
						</label>						
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="views" type="radio" value="2" checked>
								모든 사람
							</div>
						</label>
						<div class="detail_box">
							<div class="detail2">
								회원님의 동영상 조회수가 10만회를 넘었습니다.
							</div>
						</div>
					</fieldset>
			</section>
			<section>
					
				<div class="likecover">
					<h2 class="like">지원 요청</h2>
				</div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="support" type="radio" value="1">
								해제
							</div>
						</label>						
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="support" type="radio" value="2" checked>
								설정
							</div>
						</label>
						<div class="detail_box">
							<div class="detail2">
								7월 10일에 요청하신 지원에 대한 내용이 업데이트되었습니다.
							</div>
						</div>
					</fieldset>
			</section>
			<section>
					
				<div class="likecover">
					<h2 class="like">라이브 방송</h2>
				</div>
					<fieldset>
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="live" type="radio" value="1">
								해제
							</div>
						</label>						
						<label class="label">
							<div class="conditioncover">
								<input class="condition" name="live" type="radio" value="2" checked>
								설정
							</div>
						</label>
						<div class="detail_box">
							<div class="detail2">
								johnappleseed님이 라이브 방송을 시작했습니다. 지금 바로 시청해보세요!
							</div>
						</div>
					</fieldset>
			</section>
				</div>
			</div>
		</div>
	</article>
	<footer>
	<div class="footer">
		<a href="" class="color"><span>Meta</span></a>
		<a href="" class="color"><span>소개</span></a>
		<a href="" class="color"><span>블로그</span></a>
		<a href="" class="color"><span>채용 정보</span></a>
		<a href="" class="color"><span>도움말</span></a>
		<a href="" class="color"><span>API</span></a>
		<a href="" class="color"><span>개인정보처리방침</span></a>
		<a href="" class="color"><span>약관</span></a>
		<a href="" class="color"><span>인기 계정</span></a>
		<a href="" class="color"><span>해시태그</span></a>
		<a href="" class="color"><span>위치</span></a>
		<a href="" class="color"><span>Instagram Lite</span></a><br><br>
		 	한국어 © 2022 Instagram from Meta
    </div>
	</footer>	
</body>
</html>