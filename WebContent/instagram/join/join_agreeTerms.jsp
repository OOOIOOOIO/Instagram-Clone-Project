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
<link href="${cp}/css/seongho/join/join_agreeTerms.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="react_root">
		<section class="section">
			<div></div>
			<!-- 여기서부터 메인 시작 -->
			<main class="main" role="main">
				<div class="large_body_background" style="min-height: 100%;">
					<div class="small_body_background">
						<div class="terms_box">
							<h1 class="insta_blank">Instagram</h1>
							<!-- 여기 밑으로 -->
							<div class="terms_box_start" style="max-width: 350px;">
								<div class="all_agree_box">
									<div class="all_agree_text">이용 약관에 동의</div>
								</div>
								<div class="agree_textbox">
									<div class="agree_text">Instagram은 회원님의 개인 정보를 안전하게 보호합니다. 새 계정을 만들려면 모든 약관에 동의하세요.</div>
								</div>
								<div class="agree_terms_box" style="width: 100%;">
									<div class="first_terms">
										<div class="first_textbox">
											<div class="first_textbox_samesize" id="">
												<div class="first_textbox_space">
													<div class="first_text">이용약관 3개에 모두 동의</div>
												</div>
											</div>
										</div>
										<div class="first_checkbox" id="">
											<!-- checkbox들 -> button : 나중에 수정 -->
											<input id="1" name="box" class="first_checkbox_input" type="checkbox" onclick="selectAll(this)">
										</div>
									</div>		
									<hr class="firstbox_down_line">
									<div class="second_terms">
										<div class="second_terms_text">
											<div class="second_text_up_box" id="">
												<div class="second_text_up_space">
													<div class="second_up_text">이용 약관(필수)</div>
												</div>
											</div>
											<div class="second_text_down_box" id="">
												<div class="second_down_space">
													<div class="second_down_textbox">
														<a href="" rel="nofollow noopener noreferrer" target="_blank">
															<div class="second_down_text">더 알아보기</div>
														</a>
													</div>
												</div>
											</div>
										</div>
										<div class="second_checkbox">
											<input id="2" name="box" class="second_checkbox_input" type="checkbox">
										</div>
									</div>
									<div class="third_terms">
										<div class="third_terms_text">
											<div class="third_text_up_box" id="">
												<div class="third_text_up_space">
													<div class="third_up_text">데이터 정책(필수)</div>
												</div>
											</div>
											<div class="third_text_down_box" id="">
												<div class="third_down_space">
													<div class="third_down_textbox">
														<a href=""  rel="nofollow noopener noreferrer" target="_blank">
															<div class="third_down_text">더 알아보기</div>
														</a>
													</div>
												</div>
											</div>
										</div>
										<div class="third_checkbox">
											<input id="3" name="box" class="third_checkbox_input" type="checkbox">
										</div>
									</div>
									<div class="fourth_terms">
										<div class="fourth_terms_text">
											<div class="fourth_text_up_box" id="">
												<div class="fourth_text_up_space">
													<div class="fourth_up_text">위치 기반 기능(필수)</div>
												</div>
											</div>
											<div class="fourth_text_down_box" id="">
												<div class="fourth_down_space">
													<div class="fourth_down_textbox">
														<a href="" rel="nofollow noopener noreferrer" target="_blank">
															<div class="fourth_down_text">더 알아보기</div>
														</a>
													</div>
												</div>
											</div>
										</div>
										<div class="fourth_checkbox">
											<input id="4" name="box" class="fourth_checkbox_input" type="checkbox">
										</div>
									</div>
								</div>
								<div class="next_box" style="width: 100%;"> 
									<button id="next_btn" class="next_btn" type="button" disabled onclick="location.href='${cp}/user/UserLogin.us'">다음</button>
								</div>
								<div class="return_box">
									<button class="return_btn" type="button" onclick="location.href='${cp}/user/UserDelete.us'">돌아가기</button>
								</div>
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
	<script src="${cp}/javascript/seongho/join_agreeTerms.js"></script>
</body>
</html>
