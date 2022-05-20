<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>professional_account</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<link href="${cp}/css/daniel/professional/professional.css" rel="stylesheet"
	type="text/css">
</head>
<body style="height:100%; background-color: rgba(var(--b3f,250,250,250),1); margin:0;">
	<nav style="background-color: white;">
		<div class="header">
			<div class="header-logo">
				<a href=""><img src="${cp}/img/daniel/professional/instagram_logo.png"></a>
			</div>
			<div class="header-search">
				<input type="search" placeholder="검색" id="search">
			</div>
			<div class="header-menu">
				<div>
					<a href=""><img src="${cp}/img/daniel/professional/home.png"></a>
					<a href=""><img src="${cp}/img/daniel/professional/dm.png"></a>
					<a href=""><img src="${cp}/img/daniel/professional/upload.png"></a>
					<a href=""><img src="${cp}/img/daniel/professional/algorithm.png"></a>
					<a href=""><img src="${cp}/img/daniel/professional/alert.png"></a>
					<a href="${cp}/instagram/mypage/mypage.jsp"><img src="${cp}/img/daniel/professional/mypage.png"></a>
				</div>
			</div>
		</div>
	</nav>
	<main >
		<div class="main1" style="background-color: white;">
			<div class="main2">
				<div class="main3" >
					<div class="title">
						<h1>회원님을 가장 잘 나타내는 설명은 무엇인가요?</h1>
					</div>
					<div class="creater1">
						<div class="check1">
							<input type="radio" name="radio">
						</div>
						<div class="creater2">
							<div class="creater_img">
								<img src="${cp}/img/daniel/professional/creater.png">
							</div>
							<div class="creater_title">
								<h2>크리에이터</h2>
							</div>
							<div class="creater_info">
								<div class="creater_info">공인, 콘텐츠 제작자, 아티스트 및 인플루언서에게 적합합니다.</div>
							</div>
						</div>
					</div>
					<div class="business1">
						<div class="check2">
							<input type="radio" name="radio">
						</div>
						<div class="business2">
							<div class="business_img">
								<img src="${cp}/img/daniel/professional/business.png">
							</div>
							<div class="business_title">
								<h2>비즈니스</h2>
							</div>
							<div class="business_info">
								<div>판매점, 지역 비즈니스, 브랜드, 단체 및 서비스 제공업체에 적합합니다.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="button">
				<input type="button" value="다음">
			</div>
		</div>
	</main>
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