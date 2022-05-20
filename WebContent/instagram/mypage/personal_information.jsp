<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>personal_information</title> <!-- 개인정보 및 보안 • Instagram -->
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<link rel="stylesheet" type="text/css" href="${cp}/css/yooncheol/personal_information/personal_information.css"/>
</head>
<body style=" background-color: rgba(var(--b3f,250,250,250),1); margin:0;">
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
		<article>
			<div class="section_cover">
				<section class="section">
					<div class="title_cover">
						<h2 class="titles">계정 공개 범위</h2>
					</div>
					<div>
						<label class="label">
							<input class="check_btn" type="checkbox" value checked>
							
							비공개 계정
						</label>
					</div>
					<p class="pTag">
					계정이 비공개 상태인 경우 회원님이 승인한 사람만 instagram에서 회원님의 사진과 동영상을 볼 수 있습니다. 기존 팔로워는 영향을 받지 않습니다.
					</p>
					
				</section>
				<section class="section">
					<div>
						<h2 class="titles">활동 상태</h2>
					</div>
					<div>
						<label class="label">
							<input class="check_btn" type="checkbox" value checked>
							
							활동 상태 표시
						</label>
					</div>
					<p class="pTag">
					Instagram 앱에서 최근 활동한 시간 정보가 회원님이 팔로우하는 계정 및 메시지를 보낸 모든 사람에게 표시됩니다. 이 설정을 해제하면 다른 계정의 활동 상태를 볼 수 없습니다.
					</p>
					
				</section>
				<section class="section">
					<div>
						<h2 class="titles">스토리 공유</h2>
					</div>
					<div>
						<label class="label">
							<input class="check_btn" type="checkbox" value checked>
							
							공유 허용
						</label>
					</div>
					<p class="pTag">
					사람들이 회원님의 스토리를 메시지로 공유할 수 있습니다
					</p>
					
				</section>
				<section class="section">
					<div>
						<h2 class="titles">댓글</h2>
					</div>
					<a href="" tabindex="0">댓글 설정 수정</a>
					
				</section>
				<section class="section">
					<div>
						<h2 class="titles">내가 나온 사진</h2>
					</div>
					<div>
						<label class="label">
							<input class="check_btn" type="checkbox" value checked>
							
							자동으로 추가
						</label>
						<label class="label">
							<input class="check_btn" type="checkbox" value checked>
							
							수동으로 추가
						</label>
					</div>
					<p class="pTag">
						<span>회원님이 나온 사진을 프로필에 추가할 방법을 선택하세요.</span>
						회원님이 나온 사진에 대해
						<a href="" target="_blank">더 알아보기</a>
					</p>
					
				</section>
				<section class="section">
					<div class="">
						<h2 class="titles">계정 데이터</h2>
					</div>
					<a href="" tabindex="0">계정 데이터 보기</a>
					
				</section>
				<section class="section">
					<div>
						<h2 class="titles">2단계 인증</h2>
					</div>
					<a href="" tabindex="0">2단계 인증 설정 수정</a>
					
				</section>
				<section class="section">
					<div>
						<h2 class="titles">데이터 다운로드</h2>
					</div>
					<a href="" tabindex="0">다운로드 요청</a>
					
				</section>
				<section class="section_last">
					<div >
						<h2 class="titles">개인정보 및 보안 도움말</h2>
						<a href="" tabindex="0">지원</a>
					</div>
					
				</section>
			</div>
		</article>			
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