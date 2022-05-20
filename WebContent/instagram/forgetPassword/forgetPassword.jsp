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
<link href="${cp}/css/seongho/forgetPassword/forgetPassword.css" rel="stylesheet" type="text/css">


</head>
<body >
	<div class="react_root">
		<section class="section">
			<div></div>
			<main class="main" role="main">
				<div class="header">
					<div class="header_samesize">
						<div class="header_left">
							<a href="${cp}/instagram/main/main.jsp" tabindex="0">
								<div class="logo_box">
									<div class="logo_photo_box">
										<img alt="Instagram" class="logo_photo" src="https://www.instagram.com/static/images/web/mobile_nav_type_logo.png/735145cfe0a4.png" srcset="https://www.instagram.com/static/images/web/mobile_nav_type_logo.png/735145cfe0a4.png">
									</div>
								</div>
							</a>
						</div>
						<div class="header_right"> 
							<div></div>
						</div>
					</div>
				</div>
				<!-- 여기까지가 인스타로고, header -->
				<div class="large_body_background">
					<div class="small_body_background"> <!-- ㅇㅇㅇㅇㅇㅇ -->
						<div class="inputbox_1">
							<div class="inputbox_2" style="max-width: 388px;">
								<div class="inputbox_start">
									<div class="lock_photo_box"> 
										<span class="lock_photo"></span>
									</div>
									<div class="login_info">
										<h4 class="login_info_text">로그인에 문제가 있나요?</h4> 
									</div>
									<div class="help_info">
										<div class="help_info_text">
											이메일 주소, 전화번호 또는 사용자 이름을 입력하시면 계정에 다시 액세스 할 수 있는 링크르 보내드립니다.
										</div> 
									</div>
									<div class="id_box"> 
										<form method="post">
											<label class="input_id_box" for="input_id">
												<input id="1-1"class="input_id" id="input_id" name="cppEmailOrUsername" placeholder="" spellcheck="true" type="text" value="">
												<span id="1" class="on_writing">이메일, 전화번호, 사용자 이름</span>
											</label>
										</form>
									</div>
									<div class="send_link"> 
										<button id="send_btn" class="button_box" disabled type="button" onclick="location.href='${cp}/instagram/forgetPassword/forget_robot.jsp'">로그인 링크 보내기</button>
									</div>
									<div class="or">
										<div class="or_box">
											<div class="box_left"></div>
											<div class="box_middle">또는</div>
											<div class="box_right"></div>
										</div> 
									</div>
									<div class="new_account">
										<a class="new_account_box" onclick="location.href='${cp}/instagram/join/join_main.jsp'">새 계정 만들기</a> 
									</div>
									<div class="login_or_return"> 
										<div class="login_or_return_box" > <!-- style="height:440px;" -->
											<a class="login_or_return_text" href="${cp}/instagram/login/login_main.jsp">로그인으로 돌아가기</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 여기까지가 가운데. body -->
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
	<div data-visualcompletion="ignore" style="position: fixed; top: env(safe-area-inset-top); right: env(safe-area-inset-right); bottom: env(safe-area-inset-bottom); left: env(safe-area-inset-left); pointer-events: none; contain: strict; z-index: -9999;"></div>
	<script> const cp = "${pageContext.request.contextPath}"; </script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${cp}/javascript/seongho/forget_password.js"></script>
</body>
</html>



