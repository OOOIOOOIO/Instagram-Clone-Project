<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram</title>
<link rel="shortcut icon" type="image/x-icon"
	href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico" />
<c:set var="cp" value="${pageContext.request.contextPath}" />
<link href="${cp}/css/jongpyo/forgetPassword/forget_robot.css" rel="stylesheet"
	type="text/css">

</head>
<body>
	<c:set var="cp" value="${pageContext.request.contextPath}" />
	<nav>
		<div>
			<a href="">
				<div class="header">
					<img class="logoimg"
						src="${cp}/img/jongpyo/join(robot)/instagram_logo.png">
					<div class="another_account">다른 계정으로 로그인</div>
				</div>
			</a>
		</div>
	</nav>
	<main class="main" role="main">
		<div class="large_body_background">
			<div class="small_body_background">
				<div class="button_box">
					<section class="button_box_2">
						<div class="button_box_start">
							<div>
								<div class="login_text">로그인하려면 본인 확인을 진행해주세요.</div>
								<div class="info_text">회원님의 계정에서 비정상적인 활동이 감지되어 로그아웃했습니다.</div>
								<div class="info_text">비활성화가 되기 전에 계정에 다시 로그인하려면 30일 이내에
									다음 단계를 완료하세요.</div>
							</div>
							<div class="check_robot">
								<input class="checkbox" type="checkbox" name="robot" value="human">
								<div class="check_value">로봇이 아닙니다.</div>
							</div>
						</div>
					</section>
					<div class="save_cover">
						<button class="save_btn" type="button" onclick="location.href='${cp}/instagram/forgetPassword/forget_email_send_complete.jsp'">다음</button>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>