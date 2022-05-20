<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email_sms</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<link href="${cp}/css/daniel/email/email.css" rel="stylesheet" type="text/css">

</head>
<body style="background-color: rgba(var(--b3f,250,250,250),1); margin:0;">
	<nav style="background-color: white;">
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
				<img src="${cp}/img/daniel/email/meta.png">
				<a href=""><h4 class="center">계정 센터</h4></a>
				<a href=""><div>스토리 및 게시물 공유, 로그인 등 Instagram, Facebook 앱, Messenger 간에 연결된 환경에 대한 설정을 관리하세요.</div></a>
			</div>
			<div class="main">
				<div class="send">
					<h1>받아보기:</h1>
					<div class="checkbox">
						<input id="checkbox1" type="checkbox" checked>
  						<label for="checkbox1">의견 이메일</label>
  						<div>Instagram에서 의견을 보내보세요.</div>
					</div>
					<div class="checkbox">
						<input id="checkbox2" type="checkbox" checked>
  						<label for="checkbox2">알림 이메일</label>
  						<div>확인하지 않은 알림을 받아보세요.</div>
					</div>
					<div class="checkbox">
						<input id="checkbox3" type="checkbox" checked>
  						<label for="checkbox3">제품 이메일</label>
  						<div>Instagram 도구에 관한 팁을 확인해보세요.</div>
					</div>
					<div class="checkbox">
						<input id="checkbox4" type="checkbox" checked>
  						<label for="checkbox4">뉴스 이메일</label>
  						<div>Instagram의 새로운 기능에 대해 자세히 알아보세요.</div>
					</div>
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
			한국어
			© 2022 Instagram from Meta
       	</div>
   	</footer>
</body>
</html>