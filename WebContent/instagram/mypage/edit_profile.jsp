<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile_change</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<link rel="stylesheet" type="text/css" href="${cp}/css/yooncheol/profile_change/profile_change.css"/>
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
				<div class="cover">
					<div class="picturecover">
						<button class="picture" title="프로필 사진 바꾸기">
							<img class="cngPictuer" alt="프로필 사진 바꾸기" src="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico">
						</button>
						<div>
							<form enctype="multipart/form-data" method="post" role="presentation">
								<input class="profile" accept="image/jpeg,image/png" type="file">
							</form>
						</div>
					</div>
				</div>
				<div class="accName">
					<h1 class="name">yooncheol_oh</h1>
					<button class="profbutton" type="button">프로필 사진 바꾸기</button>
				</div>
				<form name="userInfo">	
					<div class="information">
						<aside class="labelcover">
							<label>이름</label>
						</aside>
					</div>				
					<div class="detail_box">
						<div class="detail" style="width:100%; max-width: 355px;">
							<input class="inf_input" id="pepName" name="pepName" placeholder="이름" type="text" value="${loginUser.user_name}">
							<div class="infDetail" style="width:100%; max-width:355px;">
								사람들이 이름, 별명 또는 비즈니스 이름 등 회원님의 알려진 이름을 사용하여 회원님의 계정을 찾을 수 있도록 도와주세요.
							</div>
						</div>
						<div class="infDetail">
							이름은 14일 안에 두 번만 변경할 수 있습니다.
						</div>
					</div>
					<div class="nameInfo">
						사용자 이름
					</div>
					<div class="detail_box">
						<div class="detail2" style="width:100%; max-width: 355px;">
							<input class="inf_input" id="pepUsername" name="pepUsername" placeholder="사용자 이름" type="text" value="${loginUser.user_id}">
							<div class="infDetail" style="width:100%; max-width:355px;">
								대부분의 경우 14일 이내에 사용자 이름을 다시 ${loginUser.user_id}(으)로 변경할 수 있습니다.
								<a href="" target="_blank" style="color: #0095f6;">더 알아보기</a>
							</div>
						</div>
					</div>
						<div class="website">
							웹사이트
						</div>
						<div class="detail2" style="width:100%; max-width: 355px;">
							<input class="inf_input" id="pepWebsite" placeholder="웹사이트" type="text" value="">	
						</div>
						<div class="intro">
							소개
						</div>
						<div>
							<input class="textarea" id="pepIntro"type="textarea">
						</div>
						<div class="detail2" style="width:100%; max-width: 355px;">
							<h2 class="personal">개인정보</h2>
						</div>
						<div class="infPerson" style="width:100%; max-width:355px;">
							비즈니스나 반려동물 등에 사용된 계정인 경우에도 회원님의 개인정보를 입력하세요. 공개 프로필에는 포함되지 않습니다.							
						</div>
						<div class="email">
							이메일
						</div>
						<div class="detail2" style="width:100%; max-width: 355px;">
							<input class="inf_input" id="pepEmail" name="pepEmail" placeholder="이메일" type="text" value="${loginUser.user_email}">	
						</div>
						<div class="phone">
							전화번호
						</div>
						<div class="detail2" style="width:100%; max-width: 355px;">
							<input class="inf_input" id="pepPhonenumber" name="pepPhonenumber" placeholder="전화번호" type="text" value="${loginUser.user_phone}">	
						</div>
						<div class="gender">
							성별
						</div>
						<div class="detail2" style="width:100%; max-width: 355px;">
							<input class="inf_input" id="pepGender" name="pepGender" placeholder="성별" type="text" value="${loginUser.user_gender}">	
						</div>
						<div class="similar_acc">
							비슷한 계정 추천
						</div>
						<div class="check">
							<input type="checkbox" checked>
						</div>
						<div class="similar" style="width:40%;">
							팔로우할 만한 비슷한 계정을 <br>추천할 때 회원님의 계정을 포<br>함합니다.
							<a href="https://help.instagram.com/530450580417848" target="_blank" style="color:#0095f6">[?]</a>	
						</div>
						<div class="submit">
							<button  id="submit_btn"class="submitbutton" type="button" style="background-color: #0095f6" onclick="check();">제출</button>
						</div>
					</form>
					<div class="disabled">
						<button class="disabledbutton" type="button" style="color: #0095f6">계정을 일시적으로 비활성화</button>
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
	<script> const cp = "${pageContext.request.contextPath}"; </script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${cp}/javascript/seongho_mypage/edit_profile.js"></script>
</body>
</html>