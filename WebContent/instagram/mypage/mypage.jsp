<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage(profile)</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<link href="${cp}/css/daniel/mypage/mypage.css" rel="stylesheet" type="text/css">

</head>
<body style="height:100%; background-color: rgba(var(--b3f,250,250,250),1); margin:0;">
	<nav style="background-color: white;">
		<div class="header">
			<div class="header-logo">
				<a h.ref=""><img src="${cp}/img/daniel/mypage/instagram_logo.png"></a>
			</div>
			<div class="header-search">
				<input type="search" placeholder="검색" id="search">
			</div>
			<div class="header-menu">
				<div>
					<a href=""><img src="${cp}/img/daniel/mypage/home.png"></a>
					<a href=""><img src="${cp}/img/daniel/mypage/dm.png"></a>
					<a href=""><img src="${cp}/img/daniel/mypage/upload.png"></a>
					<a href=""><img src="${cp}/img/daniel/mypage/algorithm.png"></a>
					<a href=""><img src="${cp}/img/daniel/mypage/alert.png"></a>
					<a href="${cp}/instagram/mypage/mypage.jsp"><img src="${cp}/img/daniel/mypage/mypage.png"></a>
				</div>
			</div>
		</div>
	</nav>
	<article>
		<div class="wrap" >
			<div class="profile_img">
				<div class="img_loca">
					<a href=""><img src="${cp}/img/daniel/mypage/profile.png"></a>
				</div>
			</div>
			<div class="profile_detail">
				<div class="user_info">
					<span>ths_eksldpf</span>
					<input type="button"  onclick="location.href='${cp}/instagram/mypage/edit_profile.jsp'" value="프로필 편집" style="cursor: pointer;">
				</div>
				<div class="follow">
					<a href=""><span>게시물&nbsp;<b>0</b></span></a>
					<a href=""><span>팔로워&nbsp;<b>0</b></span></a>
					<a href=""><span>팔로우&nbsp;<b>0</b></span></a>
				</div>
				<div class="user_name">손다니엘</div>
			</div>
		</div>
	</article>
	<div class="save" style="background-color: white;">
		<a href=""><img src="${cp}/img/daniel/mypage/write.png"><span>게시물</span></a>
		<a href=""><img src="${cp}/img/daniel/mypage/save.png"><span>저장됨</span></a>
		<a href=""><img src="${cp}/img/daniel/mypage/tag.png"><span>태그됨</span></a>
		<h5>시작하기</h5>
		<table class="add">
			<tr>
				<td>
					<img src="${cp}/img/daniel/mypage/facebook.png"><br><br>
					<div class="photo">Facebook 친구 찾기</div><br>
					<div class="explane">팔로우할 친구를 선택하세요. 회원님의 허가 없이는 Facebook에 게시하지 않습니다.</div>
					<input type="button" value="Facebook에 연결" class="add_facebook">
				</td>
				<td>
					<img src="${cp}/img/daniel/mypage/phone.png"><br><br>
					<div class="phone">전화번호 추가</div><br>
					<div class="explane">비밀번호를 재설정하고 친구를 찾는 등 다양한 기능에 활용할 수 있도록 전화번호를 추가하세요.</div>
					<input type="button" value="전화번호 추가" class="add_phone">
				</td>
				<td>
					<img src="${cp}/img/daniel/mypage/camera.png"><br><br>
					<div class="photo">프로필 사진 추가</div><br>
					<div class="explane">친구들이 회원님을 알아볼 수 있도록 프로필 사진을 추가하세요.</div>
					<input type="button" value="프로필 사진 추가" class="add_photo">
				</td>
			</tr>
		</table>
	</div>
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