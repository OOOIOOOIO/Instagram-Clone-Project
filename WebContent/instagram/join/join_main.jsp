<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<link href="${cp}/css/seongho/join/join_main.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="react_root">
		<section class="section">
			<div></div>
			<!-- 여기서부터 메인 시작 -->
			<main class="main" role="main">
				<div class="large_body_background" style="min-height: 100%;">
					<div class="small_body_background">
						<div class="join_box">
							<h1 class="insta_logo">Instagram</h1>
							<div class="join_box_start" style="max-width: 350px;">
								<form name="userInfo" class="userInfo" method="post" >
									<h2 class="logo_down_text">친구들의 사진과 동영상을 보려면 가입하세요.</h2>
									<div class="facebook_link">
										<button class="facebook_btn" type="button" onclick="location.href='https://www.facebook.com/login.php'">
											<span class="word_spacing"></span>
											Facebook으로 로그인
										</button>
									</div>
									<div class="or">
										<div class="or_left"></div>
										<div class="or_middle">또는</div>
										<div class="or_right"></div>
									</div>
									<div class="emailOrPhone"> 
										<div class="emailOrPhone_box">
											<label class="emailOrPhone_inputbox">
												<span class="emailOrPhone_text" id="1">휴대폰 번호 또는 이메일 주소</span> <!-- 수정 :input에 입력하면 text가 올라가야됨  -->
												<input name="emailOrPhone" id="1-1" class="emailOrPhone_input" aria-label="휴대폰 번호 또는 이메일 주소" aria-required="true" autocapitalize="off" autocomplete="tel" autocorrect="off"  type="text"  value="" >
											</label>
											<div class="js_hidden">
												<span id="js_img_1" class="js_img_1"></span>
											</div>
										</div>
									</div> 
									<div class="fullName">
										<div class="fullName_box">
											<label class="fullName_inputbox">
												<span class="fullName_text" id="2">성명</span>
												<input name="user_name" id="2-1" class="fullName_input" aria-label="성명" aria-required="false" autocapitalize="sentences" autocorrect="off"  type="text"  value="">
											</label>
											<div class="js_hidden">
												<span id="js_img_2" class="js_img_2"></span>
											</div>
										</div>
									</div>
									<div class="username">
										<div class="username_box">
											<label class="username_inputbox">
												<span class="username_text" id="3">사용자 이름</span>
												<input name="user_id" id="3-1"  class="username_input" aria-label="사용자 이름" aria-required="true" autocapitalize="off" autocorrect="off" maxlength="30"  type="text"  value="">
											</label>
											<div class="js_hidden">
												<span id="js_img_3" class="js_img_3"></span>
												<div class="re_btn_box">
													<button class="re_btn" type="button" onclick="random_username(); text_up();">
														<span class="re_span">추천 새로 고침</span>
													</button>
												</div>
											</div>
										</div>									
									</div>
									<div class="password">
										<div class="password_box">
											<label class="password_inputbox">
												<span class="password_text" id="4">비밀번호</span>
												<input name="user_pw" class="password_input" id="4-1"aria-label="비밀번호" aria-required="true" autocapitalize="off" autocomplete="new-password" autocorrect="off"type="password" value="">
											</label>
											<div class="js_hidden"> <!-- showPW랑 같음 -->
												<span id="js_img_4" class="js_img_4"></span>
												<div id="showPW_box" class="showPW_box">
													<button id="showPW_btn" class="showPW_btn" type="button">비밀번호 표시</button>
												</div>
											</div>
										</div>									
									</div>
									<div>
										<div class="join_btn_box">
											 <!-- 정보들이 다 입력되어야 클릭 가능 -->
											<button id="join_btn" class="join_btn" disabled type="button" onclick="check();">가입</button>
										</div>
									</div> 
									<div id="wrongText" class="wrongText">
										<p id="text_phone_again" class="text_phone_again" aria-atomic="true" role="alert">이미 가입된 핸드폰 번호입니다. 새로운 휴대폰 번호를 입력하세요.</p>
										<p id="text_phone" class="text_phone" aria-atomic="true" role="alert">휴대폰 번호가 정확하지 않습니다. 국가 번호를 포함하여 전체 전화번호를 입력해주세요.</p>
										<p id="text_email_again" class="text_email_again" aria-atomic="true" role="alert">이미 가입된 이메일입니다. 새로운 이메일 주소를 입력하세요.</p>
										<p id="text_email" class="text_email" aria-atomic="true" role="alert">Enter a valid email address.</p>
										<p id="text_password" class="text_password" aria-atomic="true"  role="alert">이 비밀번호는 추측하기가 너무 쉽습니다. 새로운 비밀번호를 만드세요.</p>
										<p id="text_userid" class="text_username" aria-atomic="true"  role="alert">사용할 수 없는 사용자 이름입니다. 다른 이름을 사용하세요.</p>
									</div>
								</form>
							</div>
						</div>
						<div class="have_account">
							<p class="have_account_space">계정이 있으신가요? 
								<a class="have_account_text" data-testid="log-in-link" href="${cp}/instagram/login/login_main.jsp" tabindex="0">로그인</a> 
							</p>
						</div>
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
	<div class="down_line1">
		<div class="down_line2"></div>
	</div>
	<div class="middle_line">
		<div class="middle_dot"></div>
	</div>
	<div id="fb_root" class="fb_reset">
		<div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
		</div>
	</div>
	<script> const cp = "${pageContext.request.contextPath}"; </script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${cp}/javascript/seongho/join_main.js"></script>
</body>
</html>
