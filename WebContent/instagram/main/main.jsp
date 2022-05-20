<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Instagram</title>
    <link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${contextPath}/css/seonghak/main_style.css">
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
                <div class="icon-class" id="upload-icon" onclick="" style="background-image: url('${contextPath}/img/seonghak/upload_icon.png');"></div>
                <div class="icon-class" id="compass-icon" onclick="location.href='${contextPath}/go/SHAlgorithm.bo'" style="background-image: url('${contextPath}/img/seonghak/compass.png');"></div>
                <div class="icon-class" id="alert-icon" onclick="" style="background-image: url('${contextPath}/img/seonghak/like_heart_empty.png');"></div>
                <c:choose>
                	<c:when test="${empty loginUser.user_img}">
		                <div class="icon-class" id="profile-icon" onclick="" style="background-image: url('${contextPath}/img/server_images/profile_image/unknown.png');"></div>
                	</c:when>
                	<c:otherwise>
		                <div class="icon-class" id="profile-icon" onclick="" style="background-image: url('${contextPath}/img/server_images/profile_image/${loginUser.user_img }');"></div>
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
    <div id="main-wrap">
        <section id="main-wrap2">
            <div id="content-area">
            	<!-- 스토리 구역 -->
                <div id="story-area">
                	<!-- 스토리 7개까지는 좌우 버튼 없어도 됨 -->
                	<div id="left-btn"></div>
    				<div id="right-btn"></div>
    				<!-- 스토리 구역에 존재하는 프로필들 -->
                	<c:forEach var="i" begin="1" end="10" step="1">
	                	<div class="profile-wrap" onclick="location.href='#'">
	                    	<div class="profile-img-outcircle">
	                    		<!-- background-image에 갖고 온 user들의 이미지를 넣어주어야 한다. -->
	                    		<div class="profile-img-incircle" style="background-image: url('https://media.istockphoto.com/photos/asian-chinese-senior-man-with-facial-hair-using-laptop-typing-working-picture-id1331469701?b=1&k=20&m=1331469701&s=170667a&w=0&h=I2AJQklkgjD599Rhmuj4s6lX4VJIZC3AY_mMMU3tIbQ=');"></div>
	                    	</div>
	                    	<!-- 갖고 온 user들의 이름을 넣어주어야 한다. -->
	                        <div class="profile-name">${i}</div>
	                    </div>
                	</c:forEach>
                </div>
                <div style="font-size: 14px; font-weight: bold; display:flex; align-items: flex-end; width: 100px; height: 40px;">시작하기</div>
                <!-- 시작하기 구역 -->
                <div id="start-list-wrap">
                	<div id="white-blur"></div>
                	<div id="start-left-btn" style="display:none;"></div>
    				<div id="start-right-btn"></div>
                	<div class="start-wrap">
                		<div class="start-img-wrap">
                			<div id="facebook-img"></div>
                		</div>
                		<div class="start-text">
                			Facebook 친구 찾기
                		</div>
                		<div class="start-explanation">
                			팔로우할 친구를 선택하세요. 회원님의 허가 없이는 Facebook에 게시하지 않습니다.
                		</div>
                		<div class="start-btn-wrap">
                			<div class="start-btn">Facebook에 연결</div>
                		</div>
                	</div>
                	<div class="start-wrap">
                		<div class="start-img-wrap">
                			<div id="call-img"></div>
                		</div>
                		<div class="start-text">
                			전화번호 추가
                		</div>
                		<div class="start-explanation">
                			비밀번호를 재설정하고 친구를 찾는 등 다양한 기능에 활용할 수 있도록 전화번호를 추가하세요.
                		</div>
                		<div class="start-btn-wrap">
                			<div class="start-btn">전화번호 추가</div>
                		</div>
                	</div>
                	<div class="start-wrap">
                		<div class="start-img-wrap">
                			<div id="camera-img"></div>
                		</div>
                		<div class="start-text">
                			프로필 사진 추가
                		</div>
                		<div class="start-explanation">
                			친구들이 회원님을 알아볼 수 있도록 프로필 사진을 추가하세요.
                		</div>
                		<div class="start-btn-wrap">
                			<div class="start-btn" onclick="addProfileImage();">프로필 사진 추가</div>
                			<input id="profileImageInput" type="file" accept="image/jpeg, image/png" name="profileImageInput" style="display:none" />
                		</div>
                	</div>
                </div>
                <!-- 왼쪽 회원 추천 추천하기 리스트가 있으면 띄어준다 -->
                <c:if test="${not empty requestScope.RecommandList}">
	                <div class="left-user-recommand-area-wrap">
	                	<div class="left-user-recommand-top-wrap">
	                		<div class="left-user-recommand-top-left-wrap">회원님을 위한 추천</div>
	                		<div class="left-user-recommand-top-right-wrap"><a href="${contextPath}/go/RecommandAllUser.us?loginUserId=${loginUser.user_id}">모두보기</a></div>
	                	</div>
	                	<div class="left-user-recommand-bottom-wrap">
	                		<!-- 회원님을 위한 추천 좌우 버튼 (3개 이상일 때 생성 c:if 사용해야함) -->
	                		<!-- 추천 띄어줄 개수는 기본값으로 10 -->
	                		<c:set var="numberOfRecommand" value="10" />
	                		<c:choose>
	                			<c:when test="${empty requestScope.RecommandList}">
	                				<c:set var="numberOfRecommand" value="0" />
	                			</c:when>
	                			<c:otherwise>
	                				<c:if test="${numberOfRecommand > requestScope.RecommandList.size()}">
	                					<c:set var="numberOfRecommand" value="${requestScope.RecommandList.size()}" />
	                				</c:if>
	                			</c:otherwise>
	                		</c:choose>
	                		<c:if test="${numberOfRecommand > 3}">
		                		<div id="left-user-recommand-left-btn" style="display: none;" onclick="moveRecommandLeft();"></div>
		                		<div id="left-user-recommand-right-btn" onclick="moveRecommandRight();"></div>
	                		</c:if>
	                		<!-- 현재 존재하는 모든 유저를 팔로우하고 있어서 추천할 계정이 없을 경우 0으로 변경, 추천할 계정이 10개보다 작으면 그 값으로 변경 -->
	                		<c:if test="${numberOfRecommand > 0}">
		                		<c:forEach var="i" begin="0" end="${numberOfRecommand - 1}" step="1">
			                		<div class="left-user-recommand-profile-wrap" id="recommand-profile-${i}">
			                			<div class="remove-recommand-btn" onclick="removeRecommand(${i});"></div>
			                			<div class="left-user-recommand-profile-image-wrap">
			                				<c:choose>
			                					<c:when test="${empty RecommandList[i].userImg}">
			                						<div style="background-image: url('${contextPath}/img/server_images/profile_image/unknown.png');"></div>
			                					</c:when>
			                					<c:otherwise>
			                						<div style="background-image: url('${contextPath}/img/server_images/profile_image/${RecommandList[i].userImg}');"></div>
			                					</c:otherwise>
			                				</c:choose>
			                			</div>
			                			<div class="left-user-recommand-profile-name-wrap">
			                				<a href="#">${RecommandList[i].userId }</a>
			                				<c:if test="${not empty RecommandList[i].userName}">
				                				<span style="font-size: 12px; color: #9e9e9e; font-weight: normal;">${RecommandList[i].userName}</span>
			                				</c:if>
			                			</div>
			                			<div class="left-user-recommand-profile-follow-wrap">
			                				<div id="recommand-area-follow-btn-${i}" onclick="follow('${RecommandList[i].userId}', ${i}, '${RecommandList[i].userImg}');">팔로우</div>
			                			</div>
			                		</div>
		                		</c:forEach>
	                		</c:if>
	                	</div>
	                </div>
                </c:if>
                <!-- 게시물 띄우는 곳, 반복문 필요 -->
                <c:choose>
                	<c:when test="${not empty requestScope.BoardList}">
		                <c:forEach var="i" begin="0" end="${requestScope.BoardList.size() - 1}" step="1">
			                <div class="content-layout" id="content-layout-${i}">
					            <div class="user-info-wrap">
					            	<div class="user-profile-wrap">
					            		<div class="user-profile-img-wrap">
					            			<!-- 아이디를 주어서 popup에서 그대로 사용하기 위해 id를 부여함 -->
					            			<c:choose>
					            				<c:when test="${empty requestScope.BoardList[i].writerImg}">
							            			<div id="user-profile-img-${i}" class="user-profile-img" style="background-image: url('${contextPath}/img/server_images/profile_image/unknown.png');" onclick="location.href='#'"></div>
					            				</c:when>
					            				<c:otherwise>
							            			<div id="user-profile-img-${i}" class="user-profile-img" style="background-image: url('${contextPath}/img/server_images/profile_image/${requestScope.BoardList[i].writerImg}');" onclick="location.href='#'"></div>
					            				</c:otherwise>
					            			</c:choose>
					            		</div>
					            		<div class="user-profile-name">
					            			<!-- 아이디를 주어서 popup에서 그대로 사용하기 위해 id를 부여함 -->
					            			<a id="user-profile-name-${i}" href="#">${requestScope.BoardList[i].boardId}</a>
					            		</div>
					            	</div>
					            	<div class="more-btn-wrap">
					            		<c:choose>
					            			<c:when test="${BoardList[i].boardId eq loginUser.user_id}">
							            		<div class="more-btn" onclick="showMorePopup('true', '${BoardList[i].boardNum}', '${i}');"></div>
					            			</c:when>
					            			<c:otherwise>
							            		<div class="more-btn" onclick="showMorePopup('false', '${BoardList[i].boardNum}', '${i}');"></div>
					            			</c:otherwise>
					            		</c:choose>
					            	</div>
					            </div>
					            <div class="content-image-wrap">
					            	<!-- 이미지 이동 버튼(이미지 1개 이상일 경우 생성, c:if 사용) -->
					            	<c:if test="${requestScope.BoardList[i].boardImages.size() > 1}">
						            	<div class="image-left-btn" id="content-${i}-image-left-btn" style="display: none;" onclick="moveImgLeft(${i});"></div>
						            	<div class="image-right-btn"  id="content-${i}-image-right-btn" onclick="moveImgRight(${i});"></div>
					            	</c:if>
					            	<!-- 이미지도 반복문 사용 해야함 (c:forEach 사용) -->
					            	<c:forEach var="j" begin="0" end="${requestScope.BoardList[i].boardImages.size() - 1}" step="1">
					            		<c:choose>
					            			<c:when test="${j == 0}">
												<img class="content-${i}" id="content-${i}-image-${j}" src="${contextPath}/img/server_images/board_images/${requestScope.BoardList[i].boardImages[j]}" style="width: 650px; height: auto;" />
					            			</c:when>
					            			<c:otherwise>
												<img class="content-${i}" id="content-${i}-image-${j}" src="${contextPath}/img/server_images/board_images/${requestScope.BoardList[i].boardImages[j]}" style="width: 650px; height: auto; display: none;" />
					            			</c:otherwise>
					            		</c:choose>
					            	</c:forEach>
					            </div>
					            <div class="reply-area-icons-wrap">
					            	<div id="reply-area-icons-left-wrap-${i}" class="reply-area-icons-left-wrap">
					            		<c:choose>
					            			<c:when test="${requestScope.BoardList[i].checkLikeBoard}">
							            		<div id="heart-icon-${i}" class="heart-icon" style="background-image: url('${contextPath}/img/seonghak/like_heart_red.png');" onclick="clickHeartIcon('true', '${loginUser.user_id}', '${requestScope.BoardList[i].boardNum}', '${i}');"></div>
					            			</c:when>
					            			<c:otherwise>
							            		<div id="heart-icon-${i}" class="heart-icon" style="background-image: url('${contextPath}/img/seonghak/like_heart_empty.png');" onclick="clickHeartIcon('false', '${loginUser.user_id}', '${requestScope.BoardList[i].boardNum}', '${i}');"></div>
					            			</c:otherwise>
					            		</c:choose>
					            		<div class="bubble-icon" style="background-image: url('${contextPath}/img/seonghak/bubble.png');" onclick="showPopup(${i}, '${loginUser.user_id}', '${requestScope.BoardList[i].boardNum}');"></div>
					            		<div class="dm-icon" style="background-image: url('${contextPath}/img/seonghak/dm.png');"></div>
					            	</div>
					            	<div id="reply-area-icons-right-wrap-${i}" class="reply-area-icons-right-wrap">
					            		<c:choose>
					            			<c:when test="${requestScope.BoardList[i].checkBookmarkBoard}">
							            		<div id="bookmark-icon-${i}" class="bookmark-icon" style="background-image: url('${contextPath}/img/seonghak/bookmark_black.png" onclick="clickBookmarkIcon('true', '${loginUser.user_id}', '${requestScope.BoardList[i].boardNum}', '${i}');"></div>
					            			</c:when>
					            			<c:otherwise>
							            		<div id="bookmark-icon-${i}" class="bookmark-icon" style="background-image: url('${contextPath}/img/seonghak/bookmark.png" onclick="clickBookmarkIcon('false', '${loginUser.user_id}', '${requestScope.BoardList[i].boardNum}', '${i}');"></div>
					            			</c:otherwise>
					            		</c:choose>
					            	</div>
					            </div>
					            <!-- 좋아요 el문으로 넣어주어야 한다. -->
					            <div id="reply-area-like-wrap-${i}" class="reply-area-like-wrap">
					            	좋아요 ${requestScope.BoardList[i].boardLikeCnt}개
					            </div>
					            <!-- el문에 게시글 올린 유저의 닉네임 넣어주어야 한다 -->
					            <div class="reply-area-user-name-and-comment-wrap">
					            								<!-- 이름 클릭 시 해당 계정 프로필로 이동 -->
									 <span id="posting-content-${i}"><a href="#" style="font-weight: bold; text-decoration: none; color:black;">${requestScope.BoardList[i].boardId}</a> ${requestScope.BoardList[i].boardContents }</span>
					           	</div>
					            <!-- 댓글 모두 보기 -->
					            <div id="reply-area-reply-count-wrap-${i}" class="reply-area-reply-count-wrap" onclick="showPopup(${i}, '${loginUser.user_id}', '${requestScope.BoardList[i].boardNum}');">
					           		댓글 ${requestScope.BoardList[i].boardReplyCnt}개 모두 보기
					           	</div>
						        <div id="my-reply-wrap-${i}" class="my-reply-wrap">
						           	<c:if test="${requestScope.BoardList[i].myReplyList.size() > 0}">
						           		<c:forEach var="j" begin="0" end="${requestScope.BoardList[i].myReplyList.size() - 1}" step="1">
								           		<span><a href="#">${loginUser.user_id }</a>&nbsp;&nbsp;${requestScope.BoardList[i].myReplyList[j]}</span>
						           		</c:forEach>
					           		</c:if>
							    </div>
					            <div class="content-posting-time">
					            	${requestScope.BoardList[i].timeInterval}
					            </div>
					            <div class="reply-write-wrap">
					            	<!-- 댓글 달기 폼 -->
					            	<form>
					            		<textarea id="reply-textarea-${i}" name="replyContent" class="reply-textarea" placeholder="댓글 달기..." spellcheck="false"></textarea>
					            		<input id="reply-write-btn-${i}" class="reply-write-btn" type="button" value="게시" onclick="writeReply('${i}', '${loginUser.user_id}', '${requestScope.BoardList[i].boardNum}');" />
					            	</form>
					            </div>
					        </div>
		                </c:forEach>
                	</c:when>
                </c:choose>
            </div>
            <!-- 오른쪽 프로필 영역 -->
            <div id="aside-area">
            	<div class="aside-user-profile-wrap">
            		<div class="aside-user-profile-image">
            			<c:choose>
            				<c:when test="${not empty loginUser.user_img }">
		            			<div style="background-image: url('${contextPath}/img/server_images/profile_image/${loginUser.user_img }')" onclick="location.href='#'"></div>
            				</c:when>
            				<c:otherwise>
		            			<div style="background-image: url('${contextPath}/img/server_images/profile_image/unknown.png')" onclick="location.href='#'"></div>
            				</c:otherwise>
            			</c:choose>
            		</div>
            		<div class='aside-user-profile-name'><a href="#">${loginUser.user_id}</a></div>
            		<div class="aside-user-change"><a href="#">전환</a></div>
            	</div>
            	<div class="aside-area-recommand-text-wrap">
            		<div>회원님을 위한 추천</div>
            		<div><a href="${contextPath}/go/RecommandAllUser.us?loginUserId=${loginUser.user_id}">모두 보기</a></div>
            	</div>
            	<!-- aside 추천 개수는 5개가 기본값 -->
            	<c:set var="asideRecommandNumber" value="5" />
            	<c:choose>
            		<c:when test="${empty requestScope.RecommandList}">
            			<c:set var="asideRecommandNumber" value="0" />
            		</c:when>
            		<c:when test="${requestScope.RecommandList.size() < 5}">
            			<c:set var="asideRecommandNumber" value="${requestScope.RecommandList.size()}" />
            		</c:when>
            	</c:choose>
            	<c:choose>
	            	<c:when test="${asideRecommandNumber > 0}">
		            	<c:forEach var="i" begin="0" end="${asideRecommandNumber - 1}" step="1">
			            	<div class="aside-area-user-recommand-wrap">
			            		<div class="aside-area-user-recommand-image">
			            			<c:choose>
			            				<c:when test="${empty RecommandList[i].userImg}">
			            					<div style="background-image: url('${contextPath}/img/server_images/profile_image/unknown.png');" onclick="location.href='#'"></div>
			            				</c:when>
			            				<c:otherwise>
			            					<div style="background-image: url('${contextPath}/img/server_images/profile_image/${RecommandList[i].userImg}');" onclick="location.href='#'"></div>
			            				</c:otherwise>
			            			</c:choose>
			            		</div>
			            		<div class="aside-area-user-recommand-name">
			            			<a href="#">${RecommandList[i].userId }</a>
			            			<c:choose>
			            				<c:when test="${RecommandList[i].relatedFollowCnt eq 0}">
					            			<span style="color: #9e9e9e; font-size: 12px;">회원님을 위한 추천</span>
			            				</c:when>
			            				<c:when test="${RecommandList[i].relatedFollowCnt eq 1}">
					            			<span style="color: #9e9e9e; font-size: 12px;">${RecommandList[i].relatedFollowFirstId}님이 팔로우 합니다.</span>
			            				</c:when>
			            				<c:otherwise>
					            			<span style="color: #9e9e9e; font-size: 12px;">${RecommandList[i].relatedFollowFirstId}님 외 ${RecommandList[i].relatedFollowCnt - 1}명이 팔로우 합니다.</span>
			            				</c:otherwise>
			            			</c:choose>
			            		</div>
			            		<div class="aside-area-user-follow-btn">
			            			<div id="aside-follow-btn-${i}" onclick="follow('${RecommandList[i].userId}', ${i}, '${RecommandList[i].userImg}');">팔로우</div>
			            		</div>
			            	</div>
		            	</c:forEach>
	            	</c:when>
            	</c:choose>
            	<div class="aside-area-footer-wrap">
            		<div><a href="https://about.instagram.com/">소개</a>·<a href="https://help.instagram.com/">도움말</a>·<a href="https://about.instagram.com/blog">홍보 센터</a>·<a href="https://developers.facebook.com/docs/instagram">API</a>·<a href="https://about.instagram.com/about-us/careers">채용 정보</a>·<br /><a href="https://help.instagram.com/519522125107875">개인정보처리방침</a>·<a href="https://help.instagram.com/581066165581870">약관</a>·<a href="https://www.instagram.com/explore/locations/">위치</a>·<a href="https://www.instagram.com/directory/profiles/">인기 계정</a>·<a href="https://www.instagram.com/directory/hashtags/">해시태그</a>·<a href="#">언어</a></div>
            	</div>
            	<div class="copyright">ⓒ 2022 INSTAGRAM FROM META</div>
            </div>
        </section>
    </div>
    <!-- 팝업창 -->
    <div id="popup-background-wrap">
    	<div id="popup-remove-btn-wrap" style="background-image: url('${contextPath}/img/seonghak/popup_x_btn.png');"></div>
    	<div id="popup-window">
    		<!-- 팝업창 왼쪽 이미지 영역 -->
    		<div class="popup-window-left-wrap"></div>
    		<div class="popup-window-right-wrap"></div>
    	</div>
    </div>
    <!-- 더보기 버튼 -->
    <!-- 내 게시물이 아닐 때 -->
    <div id="popup-more-wrap" class="popup-more-wrap displayNone">
    	<div>
    		<div style="width: 400px; height: 50px; text-align: center; line-height: 50px; border-bottom: 1px solid #e0e0e0; box-sizing: border-box; font-size: 14px; color: red; font-weight: bold;">
    			신고
    		</div>
    		<div style="width: 400px; height: 50px; text-align: center; line-height: 50px; border-bottom: 1px solid #e0e0e0; box-sizing: border-box; font-size: 14px; color: red; font-weight: bold;">
    			팔로우 취소
    		</div>
    		<div style="width: 400px; height: 50px; text-align: center; line-height: 50px; border-bottom: 1px solid #e0e0e0; box-sizing: border-box; font-size: 14px;">
    			게시물로 이동
    		</div>
    		<div style="width: 400px; height: 50px; text-align: center; line-height: 50px; border-bottom: 1px solid #e0e0e0; box-sizing: border-box; font-size: 14px;">
    			공유 대상...
    		</div>
    		<div style="width: 400px; height: 50px; text-align: center; line-height: 50px; border-bottom: 1px solid #e0e0e0; box-sizing: border-box; font-size: 14px;">
    			링크 복사
    		</div>
    		<div style="width: 400px; height: 50px; text-align: center; line-height: 50px; border-bottom: 1px solid #e0e0e0; box-sizing: border-box; font-size: 14px;">
    			퍼가기
    		</div>
    		<div style="width: 400px; height: 50px; text-align: center; line-height: 50px; font-size: 14px;" onclick="removeMorePopup();">
    			취소
    		</div>
    	</div>
    </div>
    <!-- 내 게시물일 때 -->
    <div id="popup-more-wrap2" class="popup-more-wrap2 displayNone">
    	<div>
    		<div id="remove-board-btn" onclick="showAskRemoveBoard();">
    			삭제
    		</div>
    		<div style="width: 400px; height: 50px; text-align: center; line-height: 50px; border-bottom: 1px solid #e0e0e0; box-sizing: border-box; font-size: 14px;">
    			게시물로 이동
    		</div>
    		<div style="width: 400px; height: 50px; text-align: center; line-height: 50px; border-bottom: 1px solid #e0e0e0; box-sizing: border-box; font-size: 14px;">
    			퍼가기
    		</div>
    		<div style="width: 400px; height: 50px; text-align: center; line-height: 50px; font-size: 14px;" onclick="removeMorePopup2();">
    			취소
    		</div>
    	</div>
    </div>
    <div id="ask-remove-board-wrap" class="ask-remove-board-wrap displayNone">
    	<div>
    		<div style="width: 400px; height: 100px; box-sizing: border-box; display: flex; flex-direction: column; align-items: center; justify-content: center; border-bottom: 1px solid #e0e0e0;">
    			<div><span style="font-weight: bold; font-size: 18px;">게시물을 삭제할까요?</span></div>
    			<div style="margin-top: 5px;"><span style="font-size: 14px; color: #9e9e9e;">이 게시물을 삭제하시겠어요?</span></div>
    		</div>
    		<div id="real-remove-board-btn" onclick="removeBoard();">
    			삭제
    		</div>
    		<div style="width: 400px; height: 50px; text-align: center; line-height: 50px; font-size: 14px;" onclick="removeAskRemoveBoard();">
    			취소
    		</div>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/javascript/seonghak/main_script.js"></script>
</body>
</html>