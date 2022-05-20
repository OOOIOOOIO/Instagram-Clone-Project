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
<link href="${cp}/css/seongho/forgetPassword/forget_phone_send_complete.css" rel="stylesheet" type="text/css">

</head>
<body>
	<!-- 번호로 전송할 시 -->
	<div class="large_background" role="presentation">
		<div class="small_background" role="dialog">
			<div class="box_start">
				<div class="box_start2">
					<div class="SMS_box">
						<h3 class="SMS_text_up">SMS 전송함</h3>
						<div class="SMS_text_down">계정에 다시 로그인할 수 있는 링크가 포함된 SMS를 +82 10-2005-7950번으로 보내드렸습니다. 이런식</div>
					</div>
					<div class="confirm_box">
						<button class="confirm_btn" tabindex="0" type="button" onclick="location.href='${cp}/instagram/forget/forgetPassword.jsp'">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>