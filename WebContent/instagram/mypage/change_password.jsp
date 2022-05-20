<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Password Change</title>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<link rel="shortcut icon" type="image/x-icon"
	href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico" />
<link rel="stylesheet" href="${cp}/css/Junku/pw_change/pw_change.css" type="text/css">
</head>
<body style=" height:100%; background-color: rgba(var(--b3f,250,250,250),1); margin:0;">
	<nav>
		<div class="header">
			<div class="insta_logo">
				<a href=""><img src="${cp}/img/Junku/header/logo.png"></a>
			</div>
			<div class="search2">
				<input type="search" class="search" placeholder="검색">
			</div>
			<div class="insta_menu">
				<a href=""><img src="${cp}/img/Junku/header/home.png"></a> 
				<a href=""><img src="${cp}/img/Junku/header/dm.png"></a>
				<a href=""><img src="${cp}/img/Junku/header/upload.png"></a>
				<a href=""><img src="${cp}/img/Junku/header/algorithm.png"></a>
				<a href=""><img src="${cp}/img/Junku/header/alert.png"></a>
				<a href="${cp}/instagram/mypage/mypage.jsp"><img src="${cp}/img/Junku/header/mypage.png"></a>
			</div>
		</div>
	</nav>
	<section>x	
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
				<img src="${cp}/img/Junku/list/meta.png"> <a href=""><h4 class="center">
						계정 센터</h4>
					<div>스토리 및 게시물 공유, 로그인 등 Instagram, Facebook 앱, Messenger 간에
						연결된 환경에 대한 설정을 관리하세요.</div></a>
			</div>
			<div class="main">
				<div class="cover">
					<div class="picturecover">
						<button class="picture" title="프로필 사진">
							<img class="cngPictuer" alt="프로필 사진 " src="${cp}/img/Junku/header/mypage.png">
						</button>
					</div>
				</div>
				<div class="accName">
					<h1 class="name">profile_name</h1>
				</div>
				<form name="change_pw" class="form" method="POST">
					<div class="oldPw">
						<aside class="label">
							<label>이전 비밀번호</label>
						</aside>
					</div>
					<div class="input_box">
						<div class="old_pw" style="width: 100%; max-width: 355px;">
							<input name="old_pw" id="old_pw" class="pw_input" type="password">
						</div>
					</div>
					<div class="newPw">새 비밀번호</div>
					<div class="input_box">
						<div class="new_pw" style="width: 100%; max-width: 355px;">
							<input name="new_pw" id="new_pw" class="pw_input"  type="password">
						</div><br>
						<div class="new_pw_confirm">새 비밀번호 확인</div>
						<div class="new_pw" style="width: 100%; max-width: 355px;">
							<input name="new_pw_confirm" id="new_pw_confirm" class="pw_input"  type="password" value="">
						</div><br>
						<div class="submit">
							<button id="change_btn" class="change_pw_button" disabled type="button" onclick="check();">비밀번호 변경</button><br>
							<button class="find_pw_button" type="button" style="color: #0095f6">비밀번호를 잊으셨나요?</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</article>
	</section>
	<footer>
		<div class="footer">
			<a href="" class="color"><span>Meta</span></a> <a href=""
				class="color"><span>소개</span></a> <a href="" class="color"><span>블로그</span></a>
			<a href="" class="color"><span>채용 정보</span></a> <a href=""
				class="color"><span>도움말</span></a> <a href="" class="color"><span>API</span></a>
			<a href="" class="color"><span>개인정보처리방침</span></a> <a href=""
				class="color"><span>약관</span></a> <a href="" class="color"><span>인기
					계정</span></a> <a href="" class="color"><span>해시태그</span></a> <a href=""
				class="color"><span>위치</span></a> <a href="" class="color"><span>Instagram
					Lite</span></a><br>
			<br> 한국어 © 2022 Instagram from Meta
		</div>
	</footer>
	<script> const cp = "${pageContext.request.contextPath}"; </script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${cp}/javascript/seongho_mypage/change_password.js"></script>
</body>
</html>