<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>algorithm_part</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<link href="${cp}/css/daniel/algorithm/algorithm.css" rel="stylesheet" type="text/css">

</head>
<body>
	<nav>
		<div class="header">
			<div class="header-logo">
				<a href="${cp}/go/MainBoard.bo"><img src="${cp}/img/daniel/algorithm/instagram_logo.png"></a>
			</div>
			<div class="header-search">
				<input type="search" placeholder="검색" id="search">
			</div>
			<div class="header-menu">
				<div>
					<a href="${cp}/go/MainBoard.bo"><img src="${cp}/img/daniel/algorithm/home_none.png"></a>
					<a href="#"><img src="${cp}/img/daniel/algorithm/dm.png"></a>
					<a href="#"><img src="${cp}/img/daniel/algorithm/upload.png"></a>
					<a href="${cp}/go/SHAlgorithm.bo"><img src="${cp}/img/daniel/algorithm/algorithm.png"></a>
					<a href="#"><img src="${cp}/img/daniel/algorithm/alert.png"></a>
					<a href="#"><img src="${cp}/img/daniel/algorithm/mypage.png"></a>
				</div>
			</div>
		</div>
	</nav>
	<article class="wrap">
		<div class="picture_list">
			<c:forEach var="i" begin="0" end="${AlgorithmBoardList.size() - 1}" step="1">
					<c:choose>
						<c:when test="${i == 1 || i % 17 == 16}">
							<div class="big"><img src="${cp}/img/server_images/board_images/${AlgorithmBoardList[i].fileSysName}" onclick="showPopup(${i}, '${loginUser.user_id}', '${AlgorithmBoardList[i].board_num}')"></div>
						</c:when>
						<c:otherwise>
							<div class="small"><img src="${cp}/img/server_images/board_images/${AlgorithmBoardList[i].fileSysName}" onclick="showPopup(${i}, '${loginUser.user_id}', '${AlgorithmBoardList[i].board_num}')"></div>
						</c:otherwise>
					</c:choose>
  			</c:forEach>
  		</div>
  	</article>
  	 <!-- 팝업창 -->
    <div id="popup-background-wrap">
    	<div id="popup-remove-btn-wrap" style="background-image: url('${cp}/img/seonghak/popup_x_btn.png');"></div>
    	<div id="popup-window">
    		<!-- 팝업창 왼쪽 이미지 영역 -->
    		<div class="popup-window-left-wrap"></div>
    		<div class="popup-window-right-wrap"></div>
    	</div>
    </div>
    <script> const contextPath = "${pageContext.request.contextPath}";</script>
  	<script src="${cp}/javascript/seonghak/algorithm.js" type="text/javascript"></script>
</body>
</html>