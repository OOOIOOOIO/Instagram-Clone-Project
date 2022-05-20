<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="recommandCount" value="0" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Instagram</title>
    <link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${contextPath}/css/seonghak/recommand_all_style.css" />
</head>
<body>
	<nav>
        <div id="nav_container">
            <div id="logo">
            	<!-- 로고 클릭시 홈화면으로 돌아와야함 -->
                <div id="logo-container" onclick="location.href='${contextPath}/go/MainBoard.bo'" style="background-image: url('https://www.instagram.com/static/images/web/mobile_nav_type_logo-2x.png/1b47f9d0e595.png');"></div>
            </div>
            <!-- 검색창 -->
            <div id="search">
            	<!-- 검색 input form 아직 안넣음 -->
            	<form action="33" method="post">
	                <input id="search-input" type="text" name="searchWhat" placeholder="    검색" spellcheck="false" autocomplete="off">
	                <i id="search-icon" class="fa fa-search"></i>
	                <i id="cancel-icon" class="fa fa-times-circle"></i>
            	</form>
            </div>
            <div id="icons">
            	<!-- 홈, dm, 게시물 추가, 알고리즘, 알림, 프로필 순서대로 아이콘 -->
            	<!-- 각 아이콘은 onclick 통해 해당하는 페이지로 이동하거나 보여줘야함 -->
                <div class="icon-class" id="home-icon" onclick="location.href='${contextPath}/go/MainBoard.bo'" style="background-image: url('${contextPath}/img/seonghak/home.png');"></div>
                <div class="icon-class" id="dm-icon" onclick="location.href='#'" style="background-image: url('${contextPath}/img/seonghak/dm.png');"></div>
                <div class="icon-class" id="upload-icon" onclick="location.href='${contextPath}/go/BoardUpload.bo'" style="background-image: url('${contextPath}/img/seonghak/upload_icon.png');"></div>
                <div class="icon-class" id="compass-icon" onclick="location.href='${contextPath}/go/SHAlgorithm.bo'" style="background-image: url('${contextPath}/img/seonghak/compass.png');"></div>
                <div class="icon-class" id="alert-icon" onclick="" style="background-image: url('${contextPath}/img/seonghak/like_heart_empty.png');"></div>
                <c:choose>
                	<c:when test="${not empty loginUser.user_img}">
                		 <div class="icon-class" id="profile-icon" onclick="" style="background-image: url('${contextPath}/img/server_images/profile_image/${loginUser.user_img}');"></div>
                	</c:when>
                	<c:otherwise>
                		 <div class="icon-class" id="profile-icon" onclick="" style="background-image: url('${contextPath}/img/server_images/profile_image/unknown.png');"></div>
                	</c:otherwise>
                </c:choose>
               
	            <div class="profile-bubble displayNone">
	            	<div style="display:flex; align-items: center; width: 230px; height: 40px;">
	            		<div style="display: flex; align-items: center; justify-content: center; width: 30px; height: 30px; float: left; margin: 0 10px;">
	            			<div style="width: 20px; height: 20px; background-size: cover; background-image: url('${contextPath}/img/seonghak/account-img.png');"></div>
	            		</div>
	            		<div style="width: 170px; height: 30px; float: left; font-size: 14px; line-height: 30px;">프로필</div>
	            	</div>
	            	<div style="display:flex; align-items: center; width: 230px; height: 40px;">
	            		<div style="display: flex; align-items: center; justify-content: center; width: 30px; height: 30px; float: left; margin: 0 10px;">
	            			<div style="width: 20px; height: 20px; background-size: cover; background-image: url('${contextPath}/img/seonghak/bookmark.png');"></div>
	            		</div>
	            		<div style="width: 170px; height: 30px; float: left; font-size: 14px; line-height: 30px;">저장됨</div>
	            	</div>
	            	<div style="display:flex; align-items: center; width: 230px; height: 40px;">
	            		<div style="display: flex; align-items: center; justify-content: center; width: 30px; height: 30px; float: left; margin: 0 10px;">
	            			<div style="width: 20px; height: 20px; background-size: cover; background-image: url('${contextPath}/img/seonghak/settings.png');"></div>
	            		</div>
	            		<div style="width: 170px; height: 30px; float: left; font-size: 14px; line-height: 30px;">설정</div>
	            	</div>
	            	<div style="display:flex; align-items: center; width: 230px; height: 40px;">
	            		<div style="display: flex; align-items: center; justify-content: center; width: 30px; height: 30px; float: left; margin: 0 10px;">
	            			<div style="width: 20px; height: 20px; background-size: cover; background-image: url('${contextPath}/img/seonghak/refresh.png');"></div>
	            		</div>
	            		<div style="width: 170px; height: 30px; float: left; font-size: 14px; line-height: 30px;">계정 전환</div>
	            	</div>
	            	<div style="display:flex; align-items: center; width: 230px; height: 40px; border-top: 1px solid #e0e0e0; box-sizing: border-box;" onclick="location.href='${contextPath}/user/UserLogoutOk.us'">
	            		<div style="margin-left: 15px; width: 170px; height: 30px; float: left; font-size: 14px; line-height: 30px;">로그아웃</div>
	            	</div>
	            </div>  
            </div>
        </div>
    </nav>
    <div class="main-wrap">
    	<c:choose>
    		<c:when test="${empty param.exist}">
		    	<div>
		    		&nbsp;&nbsp;추천
		    	</div>
		    	<div class="profile-list-wrap">
		    		<c:forEach var="recommandUser" items="${RecommandList}">
		    			<c:set var="recommandCount" value="${recommandCount + 1}" />
			    		<div>
			    			<!-- 사진 -->
			    			<div class="profile-img-wrap">
			    				<c:choose>
			    					<c:when test="${empty recommandUser.userImg}">
			    						<div style="background-image: url('${contextPath}/img/server_images/profile_image/unknown.png');" onclick="location.href='111111'"></div>
			    					</c:when>
			    					<c:otherwise>
			    						<div style="background-image: url('${contextPath}/img/server_images/profile_image/${recommandUser.userImg}');" onclick="location.href='111111'"></div>
			    					</c:otherwise>
			    				</c:choose>
			    				<div class="tooltip">
			    					<div>
			    						<c:choose>
			    							<c:when test="${empty recommandUser.userImg}">
			    								<div style="width: 50px; height: 50px; border-radius: 50%; background-size: cover; background-image: url('${contextPath}/img/server_images/profile_image/unknown.png');" onclick="location.href='5'"></div>
			    							</c:when>
			    							<c:otherwise>
			    								<div style="width: 50px; height: 50px; border-radius: 50%; background-size: cover; background-image: url('${contextPath}/img/server_images/profile_image/${recommandUser.userImg}');" onclick="location.href='5'"></div>
			    							</c:otherwise>
			    						</c:choose>
			    						<div style="display: flex; flex-direction: column; justify-content: center; width: 290px; height: 80px; margin-left: 10px;">
			    							<a style="color: black; font-size: 14px; font-weight: bold;" href="3">${recommandUser.userId}</a>
			    							<span style="color: #9e9e9e;">${recommandUser.userName}</span>
			    						</div>
			    					</div>
			    					<div>
			    						<div>
			    							<span style="color: #9e9e9e;">게시물</span>
			    							<span style="font-weight: bold;">${recommandUser.myBoardCnt}</span>
			    						</div>
			    						<div>
			    							<span style="color: #9e9e9e;">팔로워</span>
			    							<span style="font-weight: bold;">${recommandUser.followerCnt}</span>
			    						</div>
			    						<div>
			    							<span style="color: #9e9e9e;">팔로우</span>
			    							<span style="font-weight: bold;">${recommandUser.followCnt}</span>
			    						</div>
			    					</div>
			    					<div>
			    						<c:choose>
			    							<c:when test="${recommandUser.myBoardCnt != 0}">
			    								<c:forEach var="image" items="${recommandUser.boardImages}">
						    						<div style="background-image: url('${contextPath}/img/server_images/board_images/${image}');"></div>    						
					    						</c:forEach>
			    							</c:when>
			    							<c:otherwise>
			    								<div style="display: flex; align-items: center; justify-content: center; width: 390px; height: 125px; font-size: 1.5em; font-weight: bold;">게시물 없음</div>
			    							</c:otherwise>
			    						</c:choose>
			   						</div>
			   						<div>
		    							<div class="tooltip-follow-btn-wrap-${recommandCount}" onclick="follow('${recommandUser.userId}', ${recommandCount}, '${recommandUser.userImg}')">팔로우</div>
		    						</div>
		    					</div>
			    			</div>
			    			<!-- 아이디, 닉네임, 몇 명 팔로우 -->
			    			<div class="user-info-wrap">
			    				<div class="recommand-user-id">
			    					<span>
			    						<a href="1">${recommandUser.userId}</a>
			    						<div class="tooltip">
			    							<div>
			    								<c:choose>
			    									<c:when test="${empty recommandUser.userImg}">
			    										<div style="width: 50px; height: 50px; border-radius: 50%; background-size: cover; background-image: url('${contextPath}/img/server_images/profile_image/unknown.png');" onclick="location.href='5'"></div>
			    									</c:when>
			    									<c:otherwise>
			    										<div style="width: 50px; height: 50px; border-radius: 50%; background-size: cover; background-image: url('${contextPath}/img/server_images/profile_image/${recommandUser.userImg}');" onclick="location.href='5'"></div>
			    									</c:otherwise>
			    								</c:choose>
			    								<div style="display: flex; flex-direction: column; justify-content: center; width: 290px; height: 80px; margin-left: 10px;">
			    									<a style="color: black; font-size: 14px; font-weight: bold;" href="3">${recommandUser.userId}</a>
			    									<span style="color: #9e9e9e;">${recommandUser.userName}</span>
			    								</div>
			    							</div>
			    							<div>
			    								<div>
			    									<span style="color: #9e9e9e;">게시물</span>
			    									<span style="font-weight: bold;">${recommandUser.myBoardCnt}</span>
			    								</div>
			    								<div>
			    									<span style="color: #9e9e9e;">팔로워</span>
			    									<span style="font-weight: bold;">${recommandUser.followerCnt}</span>
			    								</div>
			    								<div>
			    									<span style="color: #9e9e9e;">팔로우</span>
			    									<span style="font-weight: bold;">${recommandUser.followCnt}</span>
			    								</div>
			    							</div>
			    							<div>
			    								<c:choose>
			    									<c:when test="${recommandUser.myBoardCnt != 0}">
			    										<c:forEach var="boardImage" items="${recommandUser.boardImages}">
				    										<div style="background-image: url('${contextPath}/img/server_images/board_images/${boardImage}');"></div>
			    										</c:forEach>
			    									</c:when>
			    									<c:otherwise>
			    										<div style="display: flex; align-items: center; justify-content: center; width: 390px; height: 125px; font-size: 1.5em; font-weight: bold;">게시물 없음</div>
			    									</c:otherwise>
			    								</c:choose>
			    							</div>
			    							<div>
			    								<div class="tooltip-follow-btn-wrap-${recommandCount}" onclick="follow('${recommandUser.userId}', ${recommandCount}, '${recommandUser.userImg}')">팔로우</div>
			    							</div>
			    						</div>
			    					</span>
			    				</div>
			    				<c:choose>
			    					<c:when test="${not empty recommandUser.userName}">
			    						<div><span>${recommandUser.userName}</span></div>
			    					</c:when>
			    				</c:choose>
			    				<c:choose>
			    					<c:when test="${recommandUser.relatedFollowCnt eq 0}">
					    				<div><span>회원님을 위한 추천</span></div>
			    					</c:when>
			    					<c:when test="${recommandUser.relatedFollowCnt eq 1}">
					    				<div><span>${recommandUser.relatedFollowFirstId}님이 팔로우합니다</span></div>
			    					</c:when>
			    					<c:otherwise>
			    						<div><span>${recommandUser.relatedFollowFirstId}님 외 ${recommandUser.relatedFollowCnt - 1}명이 팔로우합니다</span></div>
			    					</c:otherwise>
			    				</c:choose>
			    			</div>
			    			<!-- 팔로우 버튼 -->
			    			<div class="follow-btn-wrap">
			    				<div class="follow-btn" id="follow-btn-${recommandCount}" onclick="follow('${recommandUser.userId}', ${recommandCount}, '${recommandUser.userImg}')">
			    					<span>팔로우</span>
			    				</div>
			    			</div>
			    		</div>
		    		</c:forEach>
		    	</div>
    		</c:when>
    		<c:otherwise>
    			<div style="width: 600px; height: 500px; margin-top: 150px; background-size: cover; background-position: center; background-image: url('${contextPath}/img/seonghak/none-recommand.jpg');">
    			
    			</div>
    			<div style="display: flex; align-items: center; justify-content: center; width: 600px; height: 100px; margin: 0 auto; background: linear-gradient(to right top, #861657, #ffa69e); color: transparent; -webkit-background-clip: text; font-size: 2em; font-weight: bold;">모든 사용자를 팔로우 했습니다!</div>
    		</c:otherwise>
    	</c:choose>
    	<div class="footer-wrap" style="display: flex; flex-direction: column; align-items: center; justify-content: flex-end; width: 600px; height: 130px; margin: 0 auto;">
    		<div style="width: 400px; height: 50px; margin-bottom: 5px;">
	    		<div style="text-align: center;">
	    			<a href="https://about.instagram.com/">소개</a>&nbsp;
	    			<a href="https://help.instagram.com/">도움말</a>&nbsp;
	    			<a href="https://about.instagram.com/blog">홍보 센터</a>&nbsp;
	    			<a href="https://developers.facebook.com/docs/instagram">API</a>&nbsp;
	    			<a href="https://about.instagram.com/about-us/careers">채용 정보</a>
	    		</div>
	    		<div style="text-align: center;">
	    			<a href="https://help.instagram.com/519522125107875/?maybe_redirect_pol=0">개인정보처리방침</a>&nbsp;
	    			<a href="https://help.instagram.com/581066165581870">약관</a>&nbsp;
	    			<a href="https://www.instagram.com/explore/locations/">위치</a>&nbsp;
	    			<a href="https://www.instagram.com/directory/profiles/">인기 계정</a>&nbsp;
	    			<a href="https://www.instagram.com/directory/hashtags/">해시태그</a>&nbsp;
	    			<a href="#">언어</a>
	    		</div>
    		</div>
    		<div style="width: 300px; height: 20px; color: #9e9e9e; font-size: 12px; font-weight: 600; text-align: center;">ⓒ 2022 INSTAGRAM FROM META</div>
    	</div>
    </div>
    <div class="follow-cancel-wrap displayNone">
    	<div>
    		<div class="follow-info-wrap">
    			<div>
    				<div class="follow-info-img"></div>
    			</div>
    			<div></div>
    		</div>
    		<div id="real-follow-cancel" onclick="cancelFollow();">팔로우 취소</div>
    		<div onclick="exitCancel();">취소</div>
    	</div>
    </div>
    <script>const contextPath = "${pageContext.request.contextPath}";</script>
    <script src="${contextPath}/javascript/seonghak/recommand_all_script.js"></script>
</body>
</html>