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
<link href="${cp}/css/seongho/forgetPassword/forget_email_send_complete.css" rel="stylesheet" type="text/css">

</head>
<body>
	<c:set var="cp" value="${pageContext.request.contextPath}" />
	<nav>
		<div>
			<div class="header">
				<a href="${cp}/instagram/main/main.jsp">
					<img class="logoimg" src="${cp}/img/jongpyo/join(robot)/instagram_logo.png">
				</a>
				<a href="${cp}/instagram/login/login_main.jsp">
					<div class="another_account">다른 계정으로 로그인</div>
				</a>
					
			</div>
		</div>
	</nav>
	<main class="main" role="main">
		<div class="large_body_background">
			<div class="small_body_background">
				<div class="complete_box">
					<div class="complete_box_start">
						<div class="box_up">
							<h4 class="up_text">이메일 전송됨</h4>
						</div>
						<div class="box_middle">
							<div class="middle_text_box">
								계정에 다시 로그인할 수 있는 링크가 포함된 이메일을 
								<div class="middle_text">앞***뒤@~~~.~~형식</div>
								 주소로 보내드렸습니다.
							</div>
						</div>
						<div class="box_down">
							<button class="down_btn" tpye="button" onclick="location.href='${cp}/instagram/forgetPassword/forgetPassword.jsp'">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>