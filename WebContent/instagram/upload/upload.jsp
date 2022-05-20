<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload_part</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<link href="${cp}/css/daniel/upload/upload.css" rel="stylesheet"
	type="text/css">

</head>
<body>
	<c:if test="${loginUser == null}">
		<script>
			alert("로그인 후 이용해주세요.");
			//로그인하는 페이지로 이동
			location.replace("${cp}/user/UserLogin.us");
		</script>
	</c:if>

	<form method="post" name="boardForm" action="${cp}/board/BoardWriteOk.bo" enctype="multipart/form-data">
		<nav class="close">
			<div class="close2" onclick="goBack();">
				<img src="${cp}/img/daniel/upload/x.png">
			</div>
		</nav>
		
		<!-- 새 게시물 만들기 -->
		<div class="wrap" id="wrap">
			<div class="title">
				<h4>새 게시물 만들기</h4>
				<div class="next" id="next" onclick="goToStylePage()">다음</div>
			</div>
			
			<div class="upload_wrap">
				<!-- 아래 세 버튼 추가 -->
				<div class="btn_cut_wrap" id="btn_cut_wrap">
					<!-- 자르기 버튼 -->
					<button class="btn_cut">
						<div>
							<svg aria-label="자르기 선택" class="cut_svg" color="#ffffff" fill="#ffffff" height="16" role="img" viewBox="0 0 24 24" width="16">
								<path d="M10 20H4v-6a1 1 0 00-2 0v7a1 1 0 001 1h7a1 1 0 000-2zM20.999 2H14a1 1 0 000 2h5.999v6a1 1 0 002 0V3a1 1 0 00-1-1z"></path>
							</svg>
						</div>
					</button>
	
					<!-- 확대 버튼 -->
					<button class="btn_zoom" type="button">
						<div>
							<svg aria-label="확대/축소 선택" class="zoom_svg" color="#ffffff" fill="#ffffff" height="16" role="img" viewBox="0 0 24 24" width="16">
								<path d="M22.707 21.293l-4.825-4.825a9.519 9.519 0 10-1.414 1.414l4.825 4.825a1 1 0 001.414-1.414zM10.5 18.001a7.5 7.5 0 117.5-7.5 7.509 7.509 0 01-7.5 7.5zm3.5-8.5h-2.5v-2.5a1 1 0 10-2 0v2.5H7a1 1 0 100 2h2.5v2.5a1 1 0 002 0v-2.5H14a1 1 0 000-2z"></path>
							</svg>
						</div>
					</button>
	
					<!-- 사진 여러장 선택 -->
					<label class="btn_insert_label" style="cursor: pointer;">
						<input type="file" id="inputfile1" name="file1" accept="image/*" onchange="previewImage2(this)" style="display: none;">
						<svg aria-label="미디어 갤러리 열기" class="add_svg" color="#ffffff" fill="#ffffff" height="16" role="img" viewBox="0 0 24 24" width="16" style="cursor: pointer;">
							<path d="M19 15V5a4.004 4.004 0 00-4-4H5a4.004 4.004 0 00-4 4v10a4.004 4.004 0 004 4h10a4.004 4.004 0 004-4zM3 15V5a2.002 2.002 0 012-2h10a2.002 2.002 0 012 2v10a2.002 2.002 0 01-2 2H5a2.002 2.002 0 01-2-2zm18.862-8.773A.501.501 0 0021 6.57v8.431a6 6 0 01-6 6H6.58a.504.504 0 00-.35.863A3.944 3.944 0 009 23h6a8 8 0 008-8V9a3.95 3.95 0 00-1.138-2.773z"
								fill-rule="evenodd"></path>
						</svg>
					</label>
	
				</div>
				
				<div class="upload" id="upload">
					<div class="items">
						<div class="btn_arrow" id="btn_arrow">
							<div class="btn_left" id="btn_left" style="display: none;">
							</div>
							<div class="btn_right" id="btn_right" style="display: none;">
							</div>
						</div>
						<div id="preview">
							<img id="main-img-1" class="upload_img">
							<img id="main-img-2" class="upload_img">
							<img id="pre_img" class="pre_img" src="${cp}/img/daniel/upload/upload_part.png">
							<h2 id="h2" class="h2">사진과 동영상을 여기에 끌어다 놓으세요</h2>
							<label id="inputfile_button" class="inputfile_button" for="inputfile">
								컴퓨터에서 선택
							</label>
							<input type="file" id="inputfile" name="file" accept="image/*" onchange="previewImage(this)" style="display: none;">
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
		<!-- 스타일 설정하는 페이지 -->
		<div class="style_wrap" id="style_wrap">
			<!-- 위에 타이틀 -->
			<div class="style_title">
				<div class="back_arrow" id="back_arrow1" onclick="goToFirst();">
					<svg aria-label="돌아가기" class="_8-yf5 " color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
						<line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="2.909" x2="22.001"
							y1="12.004" y2="12.004"></line>
						<polyline fill="none" points="9.276 4.726 2.001 12.004 9.276 19.274" stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"></polyline>
					</svg>
				</div>
				<h4>편집</h4>
				<div class="next" id="next" onclick="goToWritePage()" style="display: block; margin-left: 1150px;">
					다음
				</div>
			</div>
			
			<!-- 타이틀 아래 부분 -->
			<div class="swrap" id="swrap">
				<!-- 왼쪽 이미지 파트 -->
				<div class="img_wrap">
					<div class="btn_arrow" id="btn_arrow">
						<div class="btn_left" id="btn_left_style" style="display: none; left: 10px; top: 336px;">
						</div>
						<div class="btn_right" id="btn_right_style" style="display: none; left: 676px; top: 336px;">
						</div>
					</div>
					<div class="img_wrap_wrap" id="img_wrap_wrap-1">
						<img id="style-img-1" class="second_img">
						<img id="style-img-2" class="second_img">
					</div>
				</div>
				
				<!-- 오른쪽 파트 -->
				<div>
					<!-- 오른쪽 타이틀 파트 -->
					<div class="edit_wrap">
						<div class="edit_btn">
							<div id="filter" class="edit_control" onclick="click_filter();">필터</div>
							<div id="control" class="edit_control" onclick="click_control();">조정</div>
						</div>
					</div>
					
					<!-- 오른쪽 아래부분 -->
					<div class="table_div_wrap">
						<div class="table_div">
							<div class="table_div1">
								<button class="table_btn" type="button" style="color: rgba(var(--d69,0,149,246),1); font-weight: 600;">
									<div class="btn_div">
										<img alt="필터: Normal" class="btn_img" src="${cp}/img/minju/upload/normal.jpg">
									</div>
									<div>
										원본
									</div>
								</button>
							</div>
							<div class="table_div1">
								<button class="table_btn" type="button">
									<div class="btn_div">
										<img alt="필터: Clarendon" class="btn_img" src="${cp}/img/minju/upload/Clarendon.jpg">
									</div>
									<div>
										Clarendon
									</div>
								</button>
							</div>
							<div class="table_div1" style="margin-right: 0;">
								<button class="table_btn" type="button">
									<div class="btn_div">
										<img alt="필터: Gingham" class="btn_img" src="${cp}/img/minju/upload/Gingham.jpg">
									</div>
									<div>
										Gingham
									</div>
								</button>
							</div>
							<div class="table_div2">
								<button class="table_btn" type="button">
									<div class="btn_div">
										<img alt="필터: Moon" class="btn_img" src="${cp}/img/minju/upload/Moon.jpg">
									</div>
									<div>
										Moon
									</div>
								</button>
							</div>
							<div class="table_div2">
								<button class="table_btn" type="button">
									<div class="btn_div">
										<img alt="필터: Lark" class="btn_img" src="${cp}/img/minju/upload/Lark.jpg">
									</div>
									<div>
										Lark
									</div>
								</button>
							</div>
							<div class="table_div2" style="margin-right: 0;">
								<button class="table_btn" type="button">
									<div class="btn_div">
										<img alt="필터: Reyes" class="btn_img" src="${cp}/img/minju/upload/Reyes.jpg">
									</div>
									<div>
										Reyes
									</div>
								</button>
							</div>
							<div class="table_div3">
								<button class="table_btn" type="button">
									<div class="btn_div">
										<img alt="필터: Juno" class="btn_img" src="${cp}/img/minju/upload/Juno.jpg">
									</div>
									<div>
										Juno
									</div>
								</button>
							</div>
							<div class="table_div3">
								<button class="table_btn" type="button">
									<div class="btn_div">
										<img alt="필터: Slumber" class="btn_img" src="${cp}/img/minju/upload/Slumber.jpg">
									</div>
									<div>
										Slumber
									</div>
								</button>
							</div>
							<div class="table_div3" style="margin-right: 0;">
								<button class="table_btn" type="button">
									<div class="btn_div">
										<img alt="필터: Crema" class="btn_img" src="${cp}/img/minju/upload/Crema.jpg">
									</div>
									<div>
										Crema
									</div>
								</button>
							</div>
							<div class="table_div4">
								<button class="table_btn" type="button">
									<div class="btn_div">
										<img alt="필터: Ludwig" class="btn_img" src="${cp}/img/minju/upload/Ludwig.jpg">
									</div>
									<div>
										Ludwig
									</div>
								</button>
							</div>
							<div class="table_div4">
								<button class="table_btn" type="button">
									<div class="btn_div">
										<img alt="필터: Aden" class="btn_img" src="${cp}/img/minju/upload/Aden.jpg">
									</div>
									<div>
										Aden
									</div>
								</button>
							</div>
							<div class="table_div4" style="margin-right: 0;">
								<button class="table_btn" type="button">
									<div class="btn_div">
										<img alt="필터: Perpetua" class="btn_img" src="${cp}/img/minju/upload/Perpetua.jpg">
									</div>
									<div>
										Perpetua
									</div>
								</button>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
		
		<!-- 글 업로드 하는 페이지 -->
		<div class="write_wrap" id="write_wrap">
			<!-- 위에 타이틀 -->
			<div class="style_title">
				<div class="back_arrow" id="back_arrow2" onclick="goToSecond();">
					<svg aria-label="돌아가기" class="_8-yf5 " color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
						<line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="2.909" x2="22.001"
							y1="12.004" y2="12.004"></line>
						<polyline fill="none" points="9.276 4.726 2.001 12.004 9.276 19.274" stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"></polyline>
					</svg>
				</div>
				<h4>새 게시물 만들기</h4>
				<div class="next" id="next" onclick="sendit()" style="display: block; margin-left: 1120px;">
					공유하기
				</div>
			</div>
			
			<!-- 타이틀 아래 부분 -->
			<div class="swrap" id="swrap">
				<!-- 왼쪽 이미지 파트 -->
				<div class="img_wrap">
					<div class="btn_arrow" id="btn_arrow">
						<div class="btn_left" id="btn_left_upload" style="display: none; left: 10px; top: 336px;">
						</div>
						<div class="btn_right" id="btn_right_upload" style="display: none; left: 676px; top: 336px;">
						</div>
					</div>
					<div class="img_wrap_wrap" id="img_wrap_wrap-2">
						<img id="upload-img-1" class="second_img">
						<img id="upload-img-2" class="second_img">
					</div>
				</div>
				
				<!-- 오른쪽 파트 -->
					<table>
						<tr style="border: 0;">
							<td style="border: 0;">
								<div class="user_wrap">
									<c:choose>
										<c:when test="${empty loginUser.user_img}">
											<div class="upload_userimg" style="background-image: url('${cp}/img/server_images/profile_image/unknown.png');"></div>
										</c:when>
		                				<c:otherwise>
						                	<div class="upload_userimg" style="background-image: url('${cp}/img/server_images/profile_image/${loginUser.user_img}');" />
					                	</c:otherwise>
									</c:choose>
										<div class="upload_userid">${loginUser.user_id}</div>
								</div>
							</td>
							<input type="hidden" value="${loginUser.user_id}" name="board_id">
						</tr>
						<tr>
							<td>
							<textarea name="board_contents" id="boardcontents" placeholder="문구 입력..." class="textarea" autocomplete="off"
							autocorrect="off" spellcheck="false" data-ms-editor="true"></textarea>
							</td>
						</tr>
						<tr>
							<td>위치 추가</td>
						</tr>
						<tr>
							<td>접근성</td>
						</tr>
						<tr>
							<td>고급 설정</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
	
	<script src="${cp}/javascript/minju/upload_script.js"></script>
</body>
</html>








