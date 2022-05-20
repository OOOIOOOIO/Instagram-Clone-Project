<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link href="${cp}/css/seongho/login/login_main.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="react_root">
		<section class="section">
			<div></div>
			<!-- 여기서부터 메인 시작 -->
			<main class="main" role="main">
				<div class="large_body_background" style="min-height: 100%;">
					<div class="small_body_background">
					<!-- 여기부터 수정 -->
						<div class="login_box">
				
							<h1 class="insta_logo">Instagram</h1>
							<div class="login_box_start">
								<form name="userInfo" class="login_form_box" id="loginForm" method="post" >
									<div class="login_form_start">
										<div class="username_box">
											<div class="username_box_start">
												<label class="username_label">
													<span id="1" class="username_span">전화번호, 사용자 이름 또는 이메일</span>
													<input  name="user_id" id="1-1" aria-label="전화번호, 사용자 이름 또는 이메일" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="75" type="text" class="username_text" value="">
												</label>
											</div>
										</div>
										<div class="password_box">
											<div class="password_box_start">
												<label class="password_label">
													<span id="2" class="password_span">비밀번호</span>
													<input name="user_pw" id="2-1"aria-label="비밀번호" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="75"  type="password" class="password_text" value="">
												</label>
												<div class="showPW">
													<div id="showPW_box" class="showPW_box">
														<button id="showPW_btn" class="showPW_btn" type="button">비밀번호 표시</button>
													</div>
												</div>
											</div>
										</div>
										<div class="login_btn_box">
											<button id="login_btn" class="login_btn" disabled type="button" onclick="check();">
												<div class="login_btn_text">로그인</div>
											</button>
										</div>
										<div class="or">
											<div class="or_left"></div>
											<div class="or_middle">또는</div>
											<div class="or_right"></div>
										</div>
										<div class="facebook_login_box">
											<button class="facebook_btn" type="button" onclick="location.href='https://www.facebook.com/login.php'">
												<span class="facebook_img"></span>
												<span class="facebook_text">Facebook으로 로그인</span>
											</button>
										</div>
									</div>
										<div id="wrongText" class="wrongText">
											<p id="text_id" class="text" aria-atomic="true" data-testid="login-error-message"  role="alert">입력한 사용자 이름을 사용하는 계정을 찾을 수 없습니다. 사용자 이름을 확인하고 다시 시도하세요.</p>
											<p id="text_pw" class="text" aria-atomic="true" data-testid="login-error-message"  role="alert">잘못된 비밀번호입니다. 다시 확인하세요.</p>
										</div>
									<a class="forgetPW" href="${cp}/instagram/forgetPassword/forgetPassword.jsp" tabindex="0">비밀번호를 잊으셨나요?</a>
								</form>
							</div>
						</div>
			
						<div class="have_account">
						
							<div class="have_account_space">
								<p class="have_account_text_space">계정이 없으신가요? 
									<a data-testid="sign-up-link" href="${cp}/instagram/join/join_main.jsp" tabindex="0" style="text-decoration:none;">
										<span class="have_account_text">가입하기</span>
									</a> 
								</p>
							</div>
						</div>
						<!-- 여기부터 그대로 -->
						<div class="photo_box">
							<p class="photo_up_text">앱을 다운로드하세요.</p>
							<div class="photos">
								<a class="appStore_photo" href="https://apps.apple.com/app/instagram/id389801252?vt=lo" tabindex="0">
									<img class="appStore" alt="App Store에서 이용 가능" src="https://www.instagram.com/static/images/appstore-install-badges/badge_ios_korean-ko.png/4a5c9d62d51b.png">
								</a>
								<a class="googleStore_photo" href="https://play.google.com/store/apps/details?id=com.instagram.android&referrer=utm_source%3Dinstagramweb%26utm_campaign%3DloginPage%26ig_mid%3D1403C4CD-24C8-4A8C-9672-DE1ED85F9226%26utm_content%3Dlo%26utm_medium%3Dbadge" tabindex="0">
									<img class="googleStore" alt="Google Play에서 이용 가능" src="https://www.instagram.com/static/images/appstore-install-badges/badge_android_korean-ko.png/f155b664a93b.png">
								</a>
							</div>
						</div>
					</div> 
				</div> 
			</main>
			<footer class="footer" role="contentinfo">
				<div class="footer_box">
					<div class="box_up">
						<div class="box_up_textboxes"> 
							<div class="Meta">
								<a href="https://about.facebook.com/meta" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="Meta_text">Meta</div>
								</a>
							</div>
							<div class="introduce">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="introduce_text">소개</div>
								</a>
							</div>
							<div class="blog">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="blog_text">블로그</div>
								</a>
							</div>
							<div class="recruit">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none" >
									<div class="recruit_text">채용정보</div>
								</a>
							</div>
							<div class="help">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="help_text">도움말</div>
								</a>
							</div>
							<div class="API">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="API_text">API</div>
								</a>
							</div>
							<div class="privacy">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="privacy_text">개인정보처리방침</div>
								</a>
							</div>
							<div class="terms">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="terms_text">약관</div>
								</a>
							</div>
							<div class="famous">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="famous_text">인기 계정</div>
								</a>
							</div>
							<div class="tag">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="tag_text">해시태그</div>
								</a>
							</div>
							<div class="location">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="location_text">위치</div>
								</a>
							</div>
							<div class="Instagram_Lite">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="Instagram_Lite_text">Instagram Lite</div>
								</a>
							</div>
						</div> 
					</div>
					<div class="box_down">
						<div class="box_down_left">
							<span class="box_down_left_samesize">
								<div class="box_down_left_textbox">
									<span>한국어</span>
									<div>
										<span style="display: inline-block; transform: rotate(180deg);">
											<svg aria-label="아래쪽 V자형 아이콘" class="v" color="#8e8e8e" fill="#8e8e8e" height="12" role="img" viewBox="0 0 24 24" width="12">
												<path d="M21 17.502a.997.997 0 01-.707-.293L12 8.913l-8.293 8.296a1 1 0 11-1.414-1.414l9-9.004a1.03 1.03 0 011.414 0l9 9.004A1 1 0 0121 17.502z"></path>
											</svg>
										</span>
									</div>
								</div>
								<select class="language_change" aria-label="표시 언어 변경" >
									<option value="af">Afrikaans</option>
									<option value="en">English</option>
									<option value="ko">한국어</option>
									<option value="jp">일본어</option>
									<!-- 옵션 훨씬 많음 -->
								</select>
							</span>
						</div>
						<div class="box_down_right">
							<div class="box_down_right_text">© 2022 Instagram from Meta</div>
						</div>
					</div>
				</div>
			</footer>		
		<!-- 여기까지가 footer -->
		</section>
	</div>
	<div id="fb_root" class="fb_reset">
		<div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
		</div>
	</div>
	<div class="down_line1">
		<div class="down_line2"></div>
	</div>
	<div class="middle_line">
		<div class="middle_dot"></div>
	</div>
	<script> const cp = "${pageContext.request.contextPath}"; </script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${cp}/javascript/seongho/login_main.js"></script>
</body>
</html>
