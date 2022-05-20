<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>story_view_part</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<link rel="stylesheet" type="text/css" href="${cp}/css/daniel/story/story_view.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
</head>
<body>
	<div class="popup-background" id="popup-background">
		<div class="block" id="block">
			<button class="block-btn1">이 사용자 차단하기</button>
			<button class="block-btn2">제한</button>
			<button class="block-btn3">사용자 신고</button>
			<button class="cancel">취소</button>
		</div>
	</div>
	<div class="popup-background-see-all" id="popup-background-see-all">
		<div class="see-all-wrap">
			<div class="similar-account-title">
				<h4>비슷한 계정</h4>
				<div>
					<img src="${cp}/img/daniel/story_view/close.png" id="similar-account-close">
				</div>
			</div>
			<div class="similar-account-info">
				<c:forEach var="recommend" items="${recommendUser}">
					<div class="similar-account-user-wrap">
						<div class="similar-account-user">
						<c:choose>
							<c:when test="${not empty recommend.user_img}">
								<div class="account-img">
									<div class="input-img">
										<img src="${cp}/server_images/profile_image/${recommend.user_img}">
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="account-img">
									<div class="input-img">
										<img src="${cp}/server_images/profile_image/basic_img.png">
									</div>
								</div>
							</c:otherwise>
						</c:choose>	
							<div class="account-info">
								<div class="account-info-id">${recommend.user_id}</div>
								<div class="account-info-name">${recommend.user_name}</div>
								<div class="account-info-about">${recommend.user_name}</div>
							</div>
							<button class="account-follow">팔로우</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<nav class="nav">
		<div class="header">
			<div class="header-logo">
				<a href="${cp}/instagram/main/main.jsp"><img src="${cp}/img/daniel/story_view/instagram_logo.png"></a>
			</div>
			<div class="header-search">
				<input type="text" placeholder="검색" id="search" onkeyup="check_search();">
				<i id="search-icon" class="fa fa-search"></i>
                <i id="delete-icon" class="fa fa-times-circle"></i>
                <div class="search-popup">
					<div class="recent-menu">
						<div class="recent-search">최근 검색 항목</div>
						<div class="recent-remove">모두 지우기</div>
					</div>
					<div class="recent-search-user-wrap" id="recent-search-user-wrap">
					
					</div>
				</div>
			</div>
			<div class="header-menu">
				<div>
					<a href="${cp}/instagram/main/main.jsp"><img src="${cp}/img/daniel/story_view/home_none.png"></a>
					<a href="${cp}/instagram/dm/direct_main.jsp"><img src="${cp}/img/daniel/story_view/dm.png"></a>
					<a href="${cp}/instagram/upload/upload.jsp"><img src="${cp}/img/daniel/story_view/upload.png"></a>
					<a href="${cp}/instagram/algorithm/algorithm.jsp"><img src="${cp}/img/daniel/story_view/algorithm.png"></a>
					<a href=""><img src="${cp}/img/daniel/story_view/alert.png"></a>
					<img src="${cp}/img/daniel/story_view/mypage.png" id="mypage-img">
				</div>
				<div class="mypage-popup">
					<div class="mypage-profile-wrap">
						<div class="mypage-profile" id="mypage-profile">
							<img src="${cp}/img/daniel/story_view/mypage_profile.png">
							<div>프로필</div>
						</div>
					</div>
					<div class="mypage-save-wrap">
						<div class="mypage-save" id="mypage-save">
							<img src="${cp}/img/daniel/story_view/mypage_bookmark.png">
							<div>저장됨</div>
						</div>
					</div>
					<div class="mypage-setting-wrap">
						<div class="mypage-setting" id="mypage-setting">
							<img src="${cp}/img/daniel/story_view/mypage_setting.png">
							<div>설정</div>
						</div>
					</div>
					<div class="mypage-change-account-wrap">
						<div class="mypage-change-account" id="mypage-change-account">
							<img src="${cp}/img/daniel/story_view/mypage_change_account.png">
							<div>계정 전환</div>
						</div>
					</div>
					<div class="logout-wrap">
						<div class="logout" id="logout">로그아웃</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<main class="main">
		<div class="main-part">
			<div class="profile">
				<div class="profile-info">
					<div class="profile-img">
						<div class="profile-img2">
							<div class="profile-img3">
								<img src="${cp}/img/daniel/story_view/test_picture.png">
							</div>
						</div>
					</div>
					<div class="profile-section">
						<div class="user-id">
							<h2>son__daniel<img src="${cp}/img/daniel/story_view/name_check.png" class="influencer"></h2>
							<div class="message">
								<input type="button" value="팔로우" class="button1">
								<button class="button2" id="button2"><span></span></button>
								<button class="button3"><img src="${cp}/img/daniel/story_view/more.png"></button>
							</div>
						</div>
						<ul class="follow">
							<li>게시물<span>10</span></li>
							<li>팔로워<span>15</span></li>
							<li>팔로우<span>20</span></li>
						</ul>
						<div class="user-name">다니엘</div>
						<div class="about">다니엘입니다.</div>
						<div class="taged-insta">@hi._.</div>
						<div class="blog">m.blog.naver.com</div>
					</div>
				</div>
				<div class="story-sub" id="story-sub">
					<div class="story-sub-left" id="story-sub-left"></div>
					<c:forEach var="i" begin="1" end="10" step="1">
						<div class="story-info">
							<div class="story-img">
								<div class="img-circle1">
									<div class="img-circle2"><img src="${cp}/img/daniel/story_view/test_picture.png"></div>
								</div>
							</div>
							<div class="story-text">${i}</div>
						</div>
					</c:forEach>
					<div class="story-sub-right" id="story-sub-right"></div>
				</div>
				<div class="popup-recommend" id="popup-recommend">
					<div class="see-all">
						<span class="account">추천 계정</span>
						<span class="more-people" id="see-all-popup-open">모두 보기</span>
					</div>
					<div class="recommend-people" id="recommend-people">
						<div class="recommend-left-btn" id="recommend-left-btn"></div>
						<c:forEach var="i" begin="0" end="9" step="1">
							<div class="recommend-people-wrap" id="recommend-people-wrap-${recommendUser[i].user_id}">
								<div class="recommend-delete-wrap-big">
									<div class="recommend-delete-wrap-small">
										<i class="fa fa-times" aria-hidden="true" id="recommend-delete" onclick="recommend_delete('${recommendUser[i].user_id}');"></i>
									</div>
								</div>
								<div class="recommend-people-info">
								<c:choose>
									<c:when test="${not empty recommendUser[i].user_img}">
										<div class="recommend-people-img">
											<img src="${cp}/server_images/profile_image/${recommendUser[i].user_img}">
										</div>
									</c:when>
									<c:otherwise>
										<div class="recommend-people-img">
											<img src="${cp}/server_images/profile_image/basic_img.png">
										</div>
									</c:otherwise>
								</c:choose>
									<div class="recommend-people-id">${recommendUser[i].user_id}</div>
									<div class="recommend-people-name">${recommendUser[i].user_name}</div>
									<div class="recommend-people-follow">
										<button class="recommend-people-follow-btn">팔로우</button>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="recommend-right-btn" id="recommend-right-btn"></div>
					</div>
				</div>
				<div class="change-story">
					<div class="change-story-wrap">
						<span class="write" id="write"><img src="${cp}/img/daniel/story_view/write_on.png" id="write-img">게시물</span>
						<span class="reels"><img src="${cp}/img/daniel/story_view/reels.png">릴스</span>
						<span class="video"><img src="${cp}/img/daniel/story_view/video.png">동영상</span>
						<span class="tag" id="tag"><img src="${cp}/img/daniel/story_view/tag.png" id="tag-img">태그됨</span>
					</div>
				</div>
				<div class="story">
					<c:forEach var="board_img" items="${board_info}">
						<img src="${cp}/server_images/board_images/${board_img.key}" class="main-img">
					</c:forEach>
				</div>
				<div class="tag-popup">
					<div class="tag-popup-wrap">
						<div class="no-tag-img">
							<img src="${cp}/img/daniel/story_view/no_tag.png">
						</div>
						<div class="no-tag-text">
							<h1>사진 없음</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<div class="footer">
			<span>Meta</span>
			<span>소개</span>
			<span>블로그</span>
			<span>채용 정보</span>
			<span>도움말</span>
			<span>API</span>
			<span>개인정보처리방침</span>
			<span>약관</span>
			<span>인기 계정</span>
			<span>해시태그</span>
			<span>위치</span>
			<span>Instagram Lite</span>
			<span>추천계정</span><br><br>
			한국어
			© 2022 Instagram from Meta
       	</div>
   	</footer>
</body>
<script>let cp = "${pageContext.request.contextPath}";</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${cp}/javascript/daniel/story_view.js"></script>
</html>