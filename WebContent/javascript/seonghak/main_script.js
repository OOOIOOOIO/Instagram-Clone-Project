//	검색창 자바스크립트 코드
const cancel_icon = document.getElementById("cancel-icon");
const search_input = document.getElementById("search-input");
const search_icon = document.getElementById("search-icon");
cancel_icon.addEventListener("mousedown", function() {
	search_input.value = "";
});
search_input.addEventListener("focus", function() {
	search_icon.style.display = "none";
	search_input.placeholder = "검색";
	search_input.style.color = "black";
    if(search_input.value !== "") {
    	search_input.value = search_input.value.replace("    ", "");
    }
    cancel_icon.style.display = "block";
});
search_input.addEventListener("blur", function() {
	search_icon.style.display = "block";
    search_input.placeholder = "    검색";
    if(search_input.value !== "") {
    	search_input.value = "    " + search_input.value;
    }
    search_input.style.color = "#bdbdbd";
    cancel_icon.style.display = "none";
});
//	오른쪽 상단 프로필 이미지 클릭시 드롭다운 메뉴 보이거나 숨기기
const profileIcon = document.querySelector("#profile-icon");
const profileBubble = document.querySelectorAll(".profile-bubble")[0];
profileIcon.addEventListener("click", function() {
	profileBubble.classList.toggle("displayNone");
});
//	스토리 왼쪽 버튼(storyLeftBtn), 스토리 오른쪽 버튼(storyRightBtn)
let storyLeftBtn = document.getElementById("left-btn");
let storyRightBtn = document.getElementById("right-btn");
storyLeftBtn.addEventListener("click", function() {
	let x = document.getElementById("story-area");
	storyRightBtn.style.display = "block";
	x.scrollLeft = x.scrollLeft - 600;
	if(x.scrollLeft <= 700) {
		storyLeftBtn.style.display = "none";
	}
});
storyRightBtn.addEventListener("click", function() {
	let x = document.getElementById("story-area");
	storyLeftBtn.style.display = "block";
	x.scrollLeft = x.scrollLeft + 600;
	let profile_cnt = document.getElementsByClassName("profile-wrap").length;
	if(x.scrollLeft >= (profile_cnt * 85) - 1300) {
		storyRightBtn.style.display = "none";
	}
});
//	시작하기 왼쪽 버튼(startLeftBtn), 오른쪽 버튼(startRightBtn)
let startLeftBtn = document.getElementById("start-left-btn");
let startRightBtn = document.getElementById("start-right-btn");
let whiteBlurBox = document.getElementById("white-blur");
startLeftBtn.addEventListener("click", function() {
	whiteBlurBox.style.left = "630px";
	whiteBlurBox.style.background = "linear-gradient(to right, rgba(255, 255, 255, 0) 10%, rgba(255, 255, 255, 0.25) 25%, rgba(255, 255, 255, 0.5) 50%, rgba(255, 255, 255, 0.75) 75%, rgba(255, 255, 255, 1) 100%)";
	let x = document.getElementById("start-list-wrap");
	startRightBtn.style.display = "block";
	x.scrollLeft = x.scrollLeft - 200;
	if(x.scrollLeft <= 200) {
		startLeftBtn.style.display = "none";
	}
});
startRightBtn.addEventListener("click", function() {
	whiteBlurBox.style.left = "0";
	whiteBlurBox.style.background = "linear-gradient(to right, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 0.75) 50%, rgba(255, 255, 255, 0.5) 75%, rgba(255, 255, 255, 0.25) 90%, rgba(255, 255, 255, 0) 100%)";
	let x = document.getElementById("start-list-wrap");
	startLeftBtn.style.display = "block";
	x.scrollLeft = x.scrollLeft + 200;
	if(x.scrollLeft >= 0) {
		startRightBtn.style.display = "none";
	}
});
//	시작하기에서 프로필 사진 추가
const profileInput = document.getElementById("profileImageInput");
function addProfileImage() {
	profileInput.click();
}
profileInput.addEventListener("change", function() {
	let form = new FormData();
	form.append("profileImageInput", profileInput.files[0]);

	jQuery.ajax({
		url : contextPath + "/upload/SHProfileImage.us",
		type : "POST",
		enctype: 'multipart/form-data',
		processData : false,
		contentType : false,
		data : form,
		success : function(response) {
			location.reload();
		},
		error : function (jqXHR) 
		{ 
			alert(jqXHR.responseText); 
		}
    });
});
//	사진 왼쪽 이동 버튼
function moveImgLeft(contentNum) {
	let count = 1;
	let imgList = document.getElementsByClassName("content-" + contentNum);
	for(let img of imgList) {
		if(img.style.display !== "none") {
			count = parseInt(img.id.replace("content-" + contentNum + "-image-", ""));
		}
	}
	if(count !== 0) {
		document.getElementById("content-" + contentNum + "-image-right-btn").style.display = "block";
		document.getElementById("content-" + contentNum + "-image-" + count).style.display ="none";
		count--;
		document.getElementById("content-" + contentNum + "-image-" + count).style.display ="inline";
		if(count === 0) {
			document.getElementById("content-" + contentNum + "-image-left-btn").style.display = "none";
		}
	}
}
//사진 오른쪽 이동 버튼
function moveImgRight(contentNum) {
	let count = 1;
	let imgList = document.getElementsByClassName("content-" + contentNum);
	for(let img of imgList) {
		if(img.style.display !== "none") {
			count = parseInt(img.id.replace("content-" + contentNum + "-image-", ""));
		}
	}
	if(count < document.getElementsByClassName("content-" + contentNum).length) {
		document.getElementById("content-" + contentNum + "-image-left-btn").style.display = "block";
		document.getElementById("content-" + contentNum + "-image-" + count).style.display ="none";
		count++;
		document.getElementById("content-" + contentNum + "-image-" + count).style.display ="inline";
		if(count == document.getElementsByClassName("content-" + contentNum).length - 1) {
			document.getElementById("content-" + contentNum + "-image-right-btn").style.display = "none";
		}
	}
}
//	회원님을 위한 추천 왼쪽 이동 버튼
function moveRecommandLeft() {
	let wrap = document.getElementsByClassName("left-user-recommand-bottom-wrap");
	document.getElementById("left-user-recommand-right-btn").style.display = "block";
	wrap[0].scrollLeft = wrap[0].scrollLeft - 550;
	if(wrap[0]. scrollLeft <= 550) {
		document.getElementById("left-user-recommand-left-btn").style.display = "none";
	}
}
//	회원님을 위한 추천 오른쪽 이동 버튼
function moveRecommandRight() {
	let wrap = document.getElementsByClassName("left-user-recommand-bottom-wrap");
	document.getElementById("left-user-recommand-left-btn").style.display = "block";
	wrap[0].scrollLeft = wrap[0].scrollLeft + 550;
	if(wrap[0]. scrollLeft >= 195 * (document.getElementsByClassName("left-user-recommand-profile-wrap").length) - 1200) {
		document.getElementById("left-user-recommand-right-btn").style.display = "none";
	}
}
//	추천 삭제
function removeRecommand(num) {
	document.getElementById("recommand-profile-" + num).remove();
	const profileWraps = document.getElementsByClassName("left-user-recommand-profile-wrap");
	if(profileWraps.length <= 3) {
		document.getElementById("left-user-recommand-right-btn").style.display = "none";
		document.getElementById("left-user-recommand-left-btn").style.display = "none";
	}
}
//	게시글에서 말풍선 버튼 클릭 시 해당 게시물을 팝업창으로 띄움
//	매개 변수에 해당 게시물 번호(실제 게시물 테이블의 primary key 값)도 필요할 것으로 보인다
//	ajax 사용해서 json 형식으로 해당 게시물에 관련한 모든 정보를 받아와서 DOM으로 뿌려주어야 할 것 같다
//	답글의 타입 (기본적으로 해당 게시물에 댓글 형태로 들어간다 하지만 존재하는 댓글이나 대댓글의 답글 달기 버튼을 클릭하는 순간 속해있는 댓글의 대댓글 형태로 들어간다, 게시를 완료하면 다시 기본값으로 바꿔주어 댓글 형태로 들어갈 수 있도록 한다)
let popupCommentType = "";
//	답글의 타입이 re_re가 되면 어떤 댓글에 대한 대댓글인지 
let popupReplyNum = "";
function clickReplyLeaveBtn(paramReplyNum, paramToWhom) {
	const popupTextarea = document.getElementById("popup-textarea");
	popupCommentType = "re_re";
	popupReplyNum = paramReplyNum;
	popupTextarea.value = "@" + paramToWhom + " ";
	popupTextarea.focus();
}
function writeReplyInPopUp(loginUserId, boardNum) {
	const popupTextarea = document.getElementById("popup-textarea");
//	일반 댓글
	let content = popupTextarea.value.trim();
	if(content === "") {
		alert("댓글 내용을 입력하세요!");
		popupTextarea.value = "";
		popupTextarea.focus();
		return false;
	}
	if(content.length > 200) {
		alert("댓글은 200자 이하로 작성하세요!");
		popupTextarea.value = "";
		popupTextarea.focus();
		return false;
	}
	const pattern = /\s/g;
	if(content.replace(pattern, "") === "") {
		alert("공백만 입력할 수 없습니다!");
		popupTextarea.value = "";
		popupTextarea.focus();
		return false;
	}
	content = content.replace(/\r\n/gi, '<br>');
	content = content.replace(/\\n/gi, '<br>');
	content = content.replace(/\n/gi, '<br>');
	if(popupCommentType === "reply") {
		const targetPosition = document.getElementById("popup-content-writer-posting-wrap");
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/popup/SHPopupReplyWrite.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let newReply = xhr.responseText.trim();
					targetPosition.insertAdjacentHTML("afterend", newReply);
					popupTextarea.value = "";
					popupCommentType = "reply";
					popupReplyNum = "";
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum + "&replyContent=" + content);
	}
//	대댓글
	else if(popupCommentType === "re_re") {
		let targetPosition = document.querySelector(".reply-seq-" + popupReplyNum + ":nth-last-child(1)");
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/popup/SHPopupReReWrite.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let newReRe = xhr.responseText.trim();
					if(targetPosition !== null) {
						targetPosition.insertAdjacentHTML("afterend", newReRe);
						if(targetPosition.style.display === "flex") {
							document.querySelector(".reply-seq-" + popupReplyNum + ":nth-last-child(1)").style.display = "flex";
						}
					}
					else {
						targetPosition = document.querySelector("#reply-reply-show-btn-" + popupReplyNum);
						targetPosition.insertAdjacentHTML("afterend", newReRe);
						targetPosition.innerText = "답글 숨기기";
						document.querySelector(".reply-seq-" + popupReplyNum).style.display = "flex";
					}
					popupTextarea.value = "";
					popupCommentType = "reply";
					popupReplyNum = "";
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum + "&reReContent=" + content + "&replyNum=" + popupReplyNum);
	}
//	에러 없겠지만 넣어둠
	else {
		console.log("error");
	}
}
//	대댓글 좋아요 함수
function likeReRe(re_re_num, loginUserId, isRed) {
//	빨간하트면 누른 상태이므로 좋아요 취소를 수행한다
	if(isRed === "true") {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/popup/SHPopupReReLikeCancel.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					const responseText = xhr.responseText.trim();
					if(responseText !== "X") {
						const removeTarget = document.querySelector("#re-re-heart-wrap-" + re_re_num + " > div");
						removeTarget.remove();
						const reReHeartWrap = document.querySelector("#re-re-heart-wrap-" + re_re_num);
						let emptyHeart = "<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_empty.png');\" onclick=\"likeReRe('" + re_re_num + "', '" + loginUserId + "', 'false');\"></div>";
						reReHeartWrap.insertAdjacentHTML("beforeend", emptyHeart);
						document.querySelector("#re-re-like-cnt-text-" + re_re_num).innerText = responseText;
					}
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&reReNum=" + re_re_num);
	}
//	빈하트면 좋아요를 수행한다
	else {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/popup/SHPopupReReLike.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					const responseText = xhr.responseText.trim();
					if(responseText !== "X") {
						const removeTarget = document.querySelector("#re-re-heart-wrap-" + re_re_num + " > div");
						removeTarget.remove();
						const reReHeartWrap = document.querySelector("#re-re-heart-wrap-" + re_re_num);
						let redHeart = "<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_red.png');\" onclick=\"likeReRe('" + re_re_num + "', '" + loginUserId + "', 'true');\"></div>";
						reReHeartWrap.insertAdjacentHTML("beforeend", redHeart);
						document.querySelector("#re-re-like-cnt-text-" + re_re_num).innerText = responseText;
					}
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&reReNum=" + re_re_num);
	}
}
//	대댓글 삭제
function removeReRe(reReNum, reReId, ref_reply_num) {
	const xhr = new XMLHttpRequest();
	xhr.open("POST", contextPath + "/popup/SHPopupReReRemove.bo", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				const responseText = xhr.responseText.trim();
				if(responseText === "O") {
					const removeTarget = document.querySelector("#reply-reply-wrap-" + reReNum);
					removeTarget.remove();
					let reply_seq = document.querySelectorAll(".reply-seq-" + ref_reply_num);
					if(reply_seq.length === 0) {
						document.getElementById("reply-reply-show-btn-" + ref_reply_num).innerText = "답글 보기";
					}
				}
			}
		}
	}
	xhr.send("reReId=" + reReId + "&reReNum=" + reReNum);
}
//	댓글 좋아요
function likeReply(replyNum, loginUserId, isRed) {
//	빨간 하트이면 좋아요 취소를 하는 것이다
	if(isRed === "true") {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/popup/SHPopupReplyLikeCancel.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					const responseText = xhr.responseText.trim();
					if(responseText !== "X") {
						const removeTarget = document.querySelector("#reply-heart-wrap-" + replyNum + " > div");
						removeTarget.remove();
						const replyHeartWrap = document.querySelector("#reply-heart-wrap-" + replyNum);
						let emptyHeart = "<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_empty.png\');\" onclick=\"likeReply('" + replyNum + "', '" + loginUserId + "', 'false');\"></div>";
						replyHeartWrap.insertAdjacentHTML("beforeend", emptyHeart);
						document.querySelector("#reply-like-cnt-text-" + replyNum).innerText = responseText;
					}
				}
			}
		}
		xhr.send("replyLikeId=" + loginUserId + "&replyNum=" + replyNum);
	}
//	빈하트면 좋아요를 수행한다
	else {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/popup/SHPopupReplyLike.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					const responseText = xhr.responseText.trim();
					if(responseText !== "X") {
						const removeTarget = document.querySelector("#reply-heart-wrap-" + replyNum + " > div");
						removeTarget.remove();
						const replyHeartWrap = document.querySelector("#reply-heart-wrap-" + replyNum);
						let redHeart = "<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_red.png\');\" onclick=\"likeReply('" + replyNum + "', '" + loginUserId + "', 'true');\"></div>";
						replyHeartWrap.insertAdjacentHTML("beforeend", redHeart);
						document.querySelector("#reply-like-cnt-text-" + replyNum).innerText = responseText;
					}
				}
			}
		}
		xhr.send("replyLikeId=" + loginUserId + "&replyNum=" + replyNum);
	}
}
//	댓글 삭제
function removeReply(replyNum, loginUserId) {
	const xhr = new XMLHttpRequest();
	xhr.open("POST", contextPath + "/popup/SHPopupReplyRemove.bo", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				const responseText = xhr.responseText.trim();
				if(responseText === "O") {
					const removeTarget = document.querySelector("#popup-content-reply-wrap-" + replyNum);
					removeTarget.remove();
				}
			}
		}
	}
	xhr.send("replyId=" + loginUserId + "&replyNum=" + replyNum);
}
//	팝업창에서 게시물 좋아요 / 좋아요 취소
function popupBoardLike(boardNum, loginUserId, isRed) {
//	하트가 눌려저 있는 상황 (좋아요 취소)
	const targetWrap = document.querySelector("#popup-board-heart-wrap");
	if(isRed === "true") {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/like/SHCancelLikeClickBoard.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let txt = xhr.responseText.trim();
					if(txt !== "X") {
						const targetHeartIcon = document.querySelector("#popup-board-heart-wrap > div");
						targetHeartIcon.remove();
						let emptyHeart = "<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_empty.png')\" onclick=\"popupBoardLike('" + boardNum + "', '" + loginUserId + "', 'false');\"></div>";
						targetWrap.insertAdjacentHTML("afterbegin", emptyHeart);
						const targetText = document.getElementById("popup-board-like-cnt-text");
						targetText.innerText = "좋아요 " + txt + "개";
					}
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum);
	}
//	하트를 누르지 않은 상황 (좋아요)
	else {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/like/SHLikeClickBoard.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let txt = xhr.responseText.trim();
					if(txt !== "X") {
						const targetHeartIcon = document.querySelector("#popup-board-heart-wrap > div");
						targetHeartIcon.remove();
						let redHeart = "<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_red.png')\" onclick=\"popupBoardLike('" + boardNum + "', '" + loginUserId + "', 'true');\"></div>";
						targetWrap.insertAdjacentHTML("afterbegin", redHeart);
						const targetText = document.getElementById("popup-board-like-cnt-text");
						targetText.innerText = "좋아요 " + txt + "개";
					}
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum);
	}
}
//	팝업창에서 게시물 북마크 / 북마크 취소
function popupBoardBookmark(boardNum, loginUserId, isBlack) {
//	북마크가 눌려 있는 상태이므로 북마크를 취소한다
	const targetWrap = document.getElementById("popup-bookmark-wrap");
	if(isBlack === "true") {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/bookmark/SHCancelBookmarkClickBoard.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let txt = xhr.responseText.trim();
					if(txt === "O") {
						const targetBookmarkIcon = document.querySelector("#popup-bookmark-wrap > div");
						targetBookmarkIcon.remove();
						let emptyBookmark = "<div style=\"background-image: url('" + contextPath + "/img/seonghak/bookmark.png');\" onclick=\"popupBoardBookmark('" + boardNum + "', '" + loginUserId + "', 'false');\"></div>";
						targetWrap.insertAdjacentHTML("afterbegin", emptyBookmark);
					}
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum);
	}
//	북마크가 눌려 있지 않은 상태이므로 북마크를 추가한다
	else {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/bookmark/SHBookmarkClickBoard.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let txt = xhr.responseText.trim();
					if(txt === "O") {
						const targetBookmarkIcon = document.querySelector("#popup-bookmark-wrap > div");
						targetBookmarkIcon.remove();
						let redBookmark = "<div style=\"background-image: url('" + contextPath + "/img/seonghak/bookmark_black.png');\" onclick=\"popupBoardBookmark('" + boardNum + "', '" + loginUserId + "', 'true');\"></div>";
						targetWrap.insertAdjacentHTML("afterbegin", redBookmark);
					}
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum);
	}
}
// 팝업창 띄우기
function showPopup(selectedContentNum, loginUserId, boardNum) {
	document.body.classList.add("stop-scroll");
	const xhr = new XMLHttpRequest();
	xhr.open("POST", contextPath + "/board/SHPopupBoard.bo", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
//				기본값
				popupCommentType = "reply";
				
				const boardJSON = JSON.parse(xhr.responseText);
				console.log(boardJSON)
				let popupLeftWrap = document.getElementsByClassName("popup-window-left-wrap")[0];
				
				let count = 0;
				for(let i = 0; i < boardJSON.board_images.length; i++) {
					count++;
					if(count == 1) {
						popupLeftWrap.insertAdjacentHTML("beforeend", "<img class=\"popup-left-images\" id=\"popup-left-image-" + count + "\" style=\"border: 0;\" src=\"" + contextPath + "/img/server_images/board_images/" + boardJSON.board_images[i] +"\" />");
					}
					else {
						popupLeftWrap.insertAdjacentHTML("beforeend", "<img class=\"popup-left-images\" id=\"popup-left-image-" + count + "\" style=\"display: none; border: 0;\" src=\"" + contextPath + "/img/server_images/board_images/" + boardJSON.board_images[i] + "\" />");
					}
				}
				if(count > 1) {
					popupLeftWrap.insertAdjacentHTML("beforeend", "<div id=\"popup-image-move-left-btn\" style=\"display: none;\" onclick=\"movePopupImgLeft();\"></div>");
					popupLeftWrap.insertAdjacentHTML("beforeend", "<div id=\"popup-image-move-right-btn\" onclick=\"movePopupImgRight();\"></div>");
				}
				let popupRightWrap = document.getElementsByClassName("popup-window-right-wrap")[0];
//				작성자 프로필 띄우기
				let writerProfileNode = "";
				writerProfileNode += "<div class=\"popup-content-writer-profile-wrap\">";
				writerProfileNode += 	"<div class=\"popup-content-writer-profile-image-wrap\">";
				if(boardJSON.board_writer_img === "null") {
					writerProfileNode +=	"<div class=\"popup-content-writer-profile-image\" style=\"background-image: url('" + contextPath + "/img/server_images/profile_image/unknown.png');\" onclick=\"location.href='#'\"></div>";
				}
				else {
					writerProfileNode += 	"<div class=\"popup-content-writer-profile-image\" style=\"background-image: url('" + contextPath + "/img/server_images/profile_image/" + boardJSON.board_writer_img + "');\" onclick=\"location.href='#'\"></div>";
				}
				writerProfileNode += 	"</div>";
				writerProfileNode += 	"<div class=\"popup-content-writer-profile-name-wrap\">";
				writerProfileNode += 		"<a href=\"#\">" + boardJSON.board_writer_id + "</a>";
				writerProfileNode += 	"</div>";
				writerProfileNode +=	"<div class=\"popup-content-writer-more-btn-wrap\">";
				if(boardJSON.board_owner_check === "true") {
					writerProfileNode +=	"<div onclick=\"showMorePopup('true', '" + boardJSON.board_num + "', '" + selectedContentNum + "');\"></div>";
				}
				else {
					writerProfileNode +=	"<div onclick=\"showMorePopup('false', '" + boardJSON.board_num + "', '" + selectedContentNum + "');\"></div>";
				}
				writerProfileNode +=	"</div>";
				writerProfileNode += "</div>";
				popupRightWrap.insertAdjacentHTML("beforeend", writerProfileNode);
//				작성자가 게시물에 게시한 글과 댓글들 전체를 감싸는 wrapper 추가
				popupRightWrap.insertAdjacentHTML("beforeend", 
						"<div class=\"popup-window-right-reply-wrap\"" +
						
						"</div>"	
				);
				let popupRightReplyWrap = document.getElementsByClassName("popup-window-right-reply-wrap")[0];
//				작성자 작성 내용 띄우기
				let writerContentNode = "";
				writerContentNode += "<div id=\"popup-content-writer-posting-wrap\" class=\"popup-content-writer-posting-wrap\">";
				writerContentNode += 	"<div class=\"popup-posting-profile-img-wrap\">";
				if(boardJSON.board_writer_img === "null") {
					writerContentNode += 	"<div class=\"popup-posting-profile-img\" style=\"background-image: url('" + contextPath +"/img/server_images/profile_image/unknown.png');\" onclick=\"location.href='#'\"></div>";
				}
				else {
					writerContentNode += 	"<div class=\"popup-posting-profile-img\" style=\"background-image: url('" + contextPath +"/img/server_images/profile_image/" + boardJSON.board_writer_img +"');\" onclick=\"location.href='#'\"></div>";
				}
				writerContentNode += 	"</div>";
				writerContentNode += 	"<div class=\"popup-posting-content-wrap\">";
				writerContentNode += 		"<span style=\"font-size: 13px;\">";
				writerContentNode += 			"<a href=\"#\" style=\"font-size: 13px; font-weight: bold; text-decoration: none; color:black;\">" + boardJSON.board_writer_id + "</a> ";
				writerContentNode += 			boardJSON.board_contents;
				writerContentNode += 		"</span>";
				writerContentNode += 		"<div style=\"padding-top: 15px; width: 300px; height: 20px; font-size: 12px; color: #9e9e9e; font-weight: 500;\">" + boardJSON.board_time_interval;
				writerContentNode += 		"</div>";
				writerContentNode += 	"</div>";
				writerContentNode += "</div>";
				popupRightReplyWrap.insertAdjacentHTML("beforeend", writerContentNode);
//				댓글 띄우기
//				댓글이 있으면 해당 게시물의 댓글 수만큼 반복해서 댓글을 생성해준다.
				if(boardJSON.reply_list !== "null") {
					for(let i = 0; i < boardJSON.reply_list.length; i++) {
//						대댓글 먼저 노드 구성
						let reply_reply = "";
//						해당 댓글의 대댓글이 있으면 아래 반복문을 통해 해당 댓글의 대댓글 수만큼 반복해서 대댓글을 생성해준다.
						if(boardJSON.reply_list[i].re_re_list !== "null") {
							for(let j = 0; j < boardJSON.reply_list[i].re_re_list.length; j++) {
								reply_reply += "<div id=\"reply-reply-wrap-" + boardJSON.reply_list[i].re_re_list[j].re_re_num +"\" class=\"reply-reply-wrap reply-seq-" + boardJSON.reply_list[i].reply_num + "\">";
								reply_reply += 		"<div class=\"popup-content-reply-profile-img-wrap\">";
								if(boardJSON.reply_list[i].re_re_list[j].re_re_writer_img === "null") {
									reply_reply += 		"<div class=\"popup-content-reply-profile-img\" style=\"background-image: url('" + contextPath +"/img/server_images/profile_image/unknown.png');\"></div>";
								}
								else {
									reply_reply += 		"<div class=\"popup-content-reply-profile-img\" style=\"background-image: url('" + contextPath +"/img/server_images/profile_image/" + boardJSON.reply_list[i].re_re_list[j].re_re_writer_img +"');\"></div>";
								}
								reply_reply += 		"</div>";
								reply_reply +=		"<div class=\"reply-reply-content-wrap\">";
								reply_reply +=			"<span style=\"font-size: 13px;\">";
								reply_reply +=				"<a href=\"#\" style=\"color: black; font-size: 13px; font-weight: bold;\">" + boardJSON.reply_list[i].re_re_list[j].re_re_writer_id + "</a> ";
								reply_reply +=				boardJSON.reply_list[i].re_re_list[j].re_re_contents;
								reply_reply +=			"</span>";
								reply_reply +=			"<div class=\"popup-content-reply-info-wrap\">";
								reply_reply +=				"<div>" + boardJSON.reply_list[i].re_re_list[j].re_re_time_interval +"</div>";
								reply_reply +=				"<div id=\"re-re-like-cnt-text-" + boardJSON.reply_list[i].re_re_list[j].re_re_num + "\">좋아요 " + boardJSON.reply_list[i].re_re_list[j].re_re_like_cnt + "개</div>";
								reply_reply +=				"<div onclick=\"clickReplyLeaveBtn('" + boardJSON.reply_list[i].re_re_list[j].ref_reply_num+ "', '" + boardJSON.reply_list[i].re_re_list[j].re_re_writer_id + "');\">답글 달기</div>";
								if(boardJSON.reply_list[i].re_re_list[j].re_re_owner_check === "true") {
									reply_reply += 			"<div onclick=\"removeReRe('" + boardJSON.reply_list[i].re_re_list[j].re_re_num + "', '" + loginUserId +"', '" + boardJSON.reply_list[i].reply_num +"');\">삭제</div>";
								}
								reply_reply +=			"</div>";
								reply_reply +=		"</div>";
								reply_reply +=		"<div id=\"re-re-heart-wrap-" + boardJSON.reply_list[i].re_re_list[j].re_re_num + "\" class=\"reply-heart-wrap\">";
								if(boardJSON.reply_list[i].re_re_list[j].re_re_like_check === "true") {
									reply_reply +=		"<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_red.png');\" onclick=\"likeReRe('" + boardJSON.reply_list[i].re_re_list[j].re_re_num + "', '" + loginUserId + "', 'true');\"></div>";
								}
								else {
									reply_reply +=		"<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_empty.png');\" onclick=\"likeReRe('" + boardJSON.reply_list[i].re_re_list[j].re_re_num + "', '" + loginUserId + "', 'false');\"></div>";
								}
								reply_reply +=		"</div>";
								reply_reply += "</div>";
							}
						}
						let replyNode = "";
						replyNode += "<div id=\"popup-content-reply-wrap-" + boardJSON.reply_list[i].reply_num + "\" class=\"popup-content-reply-wrap\">";
						replyNode += 	"<div class=\"popup-content-reply-profile-img-wrap\">";
						if(boardJSON.reply_list[i].reply_writer_img === "null") {
							replyNode += 	"<div class=\"popup-content-reply-profile-img\" style=\"background-image: url('" + contextPath +"/img/server_images/profile_image/unknown.png');\"></div>";
						}
						else {
							replyNode += 	"<div class=\"popup-content-reply-profile-img\" style=\"background-image: url('" + contextPath +"/img/server_images/profile_image/" + boardJSON.reply_list[i].reply_writer_img +"');\"></div>";
						}
						replyNode += 	"</div>";
						replyNode += 	"<div class=\"popup-content-reply-content-wrap\">";
						replyNode += 		"<span style=\"font-size: 13px;\">";
						replyNode +=			"<a href=\"#\" style=\"color: black; font-size: 13px; font-weight: bold;\">" + boardJSON.reply_list[i].reply_writer_id + "</a> ";
						replyNode +=			boardJSON.reply_list[i].reply_contents;
						replyNode +=		"</span>";
						replyNode +=		"<div class=\"popup-content-reply-info-wrap\">";
						replyNode +=			"<div>" + boardJSON.reply_list[i].reply_time_interval + "</div>";
						replyNode +=			"<div id=\"reply-like-cnt-text-" + boardJSON.reply_list[i].reply_num +"\">좋아요 " + boardJSON.reply_list[i].reply_like_cnt + "개</div>";
						replyNode +=			"<div onclick=\"clickReplyLeaveBtn('" + boardJSON.reply_list[i].reply_num + "', '" + boardJSON.reply_list[i].reply_writer_id + "');\">답글 달기</div>";
						if(boardJSON.reply_list[i].reply_owner_check === "true") {
							replyNode +=		"<div onclick=\"removeReply('" + boardJSON.reply_list[i].reply_num + "', '" + loginUserId + "');\">삭제</div>";
						}
						replyNode +=		"</div>";
						replyNode += 		"<div id=\"reply-reply-show-btn-" + boardJSON.reply_list[i].reply_num + "\" onclick=\"showReplyReply(" + boardJSON.reply_list[i].reply_num + ");\">";
						replyNode +=			"답글 보기";
						replyNode +=		"</div>";
						replyNode +=		reply_reply;
						replyNode +=	"</div>";
						replyNode +=	"<div id=\"reply-heart-wrap-" + boardJSON.reply_list[i].reply_num +"\" class=\"reply-heart-wrap\">";
						if(boardJSON.reply_list[i].reply_like_check === "true") {
							replyNode +=	"<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_red.png\');\" onclick=\"likeReply('" + boardJSON.reply_list[i].reply_num + "', '" + loginUserId + "', 'true');\"></div>";
						}
						else {
							replyNode +=	"<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_empty.png\');\" onclick=\"likeReply('" + boardJSON.reply_list[i].reply_num + "', '" + loginUserId + "', 'false');\"></div>";
						}
						replyNode +=	"</div>";
						replyNode += "</div>";
						popupRightReplyWrap.insertAdjacentHTML("beforeend",	replyNode);
					}
				}
//				댓글 달기 폼 추가, 아이콘들, 좋아요 개수, 게시 시간 추가
				let formNode = "";
				formNode += "<div class=\"popup-right-bottom-wrap\">";
				formNode +=		"<div class=\"popup-right-bottom-top-wrap\">";
				formNode +=			"<div class=\"popup-right-bottom-top-left-wrap\">";
				formNode +=				"<div class=\"popup-right-bottom-top-left-icons-wrap\">";
				formNode +=					"<div id=\"popup-board-heart-wrap\">";
				if(boardJSON.board_like_check === "true") {
					formNode +=					"<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_red.png')\" onclick=\"popupBoardLike('" + boardJSON.board_num + "', '" + loginUserId + "', 'true');\"></div>";
				}
				else {
					formNode +=					"<div style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_empty.png')\" onclick=\"popupBoardLike('" + boardJSON.board_num + "', '" + loginUserId + "', 'false');\"></div>";
				}
				formNode +=					"</div>";
				formNode +=					"<div>";
				formNode +=						"<div style=\"background-image: url('" + contextPath + "/img/seonghak/bubble.png')\"></div>";
				formNode +=					"</div>";
				formNode +=					"<div>";
				formNode +=						"<div style=\"background-image: url('" + contextPath + "/img/seonghak/dm.png')\"></div>";
				formNode +=					"</div>";
				formNode +=				"</div>";
				formNode +=				"<div id=\"popup-board-like-cnt-text\">";
				formNode +=					"좋아요 " + boardJSON.board_like_cnt + "개";
				formNode +=				"</div>";
				formNode +=				"<div>";
				formNode +=					boardJSON.board_time_interval;
				formNode +=				"</div>";
				formNode +=			"</div>";
				formNode +=			"<div id=\"popup-bookmark-wrap\">";
				if(boardJSON.board_bookmark_check === "true") {
					formNode +=			"<div style=\"background-image: url('" + contextPath + "/img/seonghak/bookmark_black.png');\" onclick=\"popupBoardBookmark('" + boardJSON.board_num + "', '" + loginUserId + "', 'true');\"></div>";
				}
				else {
					formNode +=			"<div style=\"background-image: url('" + contextPath + "/img/seonghak/bookmark.png');\" onclick=\"popupBoardBookmark('" + boardJSON.board_num + "', '" + loginUserId + "', 'false');\"></div>";
				}
				formNode +=			"</div>";
				formNode +=		"</div>";
				formNode +=		"<div>";
				formNode +=			"<form>";
				formNode +=				"<textarea id=\"popup-textarea\" name=\"popupReplyContent\" spellcheck=\"false\" placeholder=\"댓글 달기...\"></textarea>";
				formNode +=				"<input type=\"button\" onclick=\"writeReplyInPopUp('" + loginUserId + "', '" + boardNum + "');\" value=\"게시\" />";
				formNode +=			"</form>";
				formNode +=		"</div>";
				formNode +=	"</div>";
				popupRightWrap.insertAdjacentHTML("beforeend", formNode);
				document.getElementById("popup-background-wrap").style.display = "block";
			}
		}
	}
	xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum);
	
}
//	팝업창 닫는 함수
function removePopup() {
	document.body.classList.remove("stop-scroll");
	let popupLeftWrap = document.getElementsByClassName("popup-window-left-wrap")[0];
	popupLeftWrap.innerHTML = "";
	let popupRightWrap = document.getElementsByClassName("popup-window-right-wrap")[0];
	popupRightWrap.innerHTML = "";
	if(document.getElementById("popup-background-wrap").style.display !== "none") {
		document.getElementById("popup-background-wrap").style.display = "none";
	}
	location.reload();
}
//해당 팝업창 바깥에서 클릭이 발생하면 팝업창을 닫음
document.getElementById("popup-background-wrap").addEventListener("click", function(e) {
	if(e.target.id === "popup-background-wrap" || e.target.id === "popup-remove-btn-wrap") {
		removePopup();
	}
});
function movePopupImgLeft() {
	let image_arr = document.getElementsByClassName("popup-left-images");
	let count = 1;
	for(let img of image_arr) {
		if(img.style.display !== "none") {
			count = parseInt(img.id.replace("popup-left-image-", ""));
		}
	}
	if(count !== 1) {
		document.getElementById("popup-left-image-" + count).style.display = "none";
		count--;
		document.getElementById("popup-left-image-" + count).style.display = "block";
		document.getElementById("popup-image-move-right-btn").style.display = "block";
		if(count === 1) {
			document.getElementById("popup-image-move-left-btn").style.display = "none";
		}
	}
}
function movePopupImgRight() {
	let image_arr = document.getElementsByClassName("popup-left-images");
	let count = 1;
	for(let img of image_arr) {
		if(img.style.display !== "none") {
			count = parseInt(img.id.replace("popup-left-image-", ""));
		}
	}
	if(count < image_arr.length) {
		document.getElementById("popup-left-image-" + count).style.display = "none";
		count++;
		document.getElementById("popup-left-image-" + count).style.display = "block";
		document.getElementById("popup-image-move-left-btn").style.display = "block";
		if(count === image_arr.length) {
			document.getElementById("popup-image-move-right-btn").style.display = "none";
		}
	}
}
//	대댓글 보기 숨기기 함수
function showReplyReply(replySeqNum) {
	let reply_reply_list = document.getElementsByClassName("reply-seq-" + replySeqNum);
//	대댓글이 존재하고
	if(reply_reply_list.length !== 0) {
//		해당 댓글의 첫번째 대댓글의 display가 none이거나 ""이면
		if(reply_reply_list[0].style.display === "none" || reply_reply_list[0].style.display === "") {
//			대댓글을 모두 보여주고 text는 답글 숨기기로 바꿈
			for(let i = 0; i < reply_reply_list.length; i++) {
				reply_reply_list[i].style.display = "flex";
			}
			document.querySelector("#reply-reply-show-btn-" + replySeqNum).textContent = "답글 숨기기";
		}
//		해당 댓글의 첫번째 대댓글의 display가 flex이면
		else {
//			대댓글을 모두 숨겨준다.
			for(let i = 0; i < reply_reply_list.length; i++) {
				reply_reply_list[i].style.display = "none";
			}
//			텍스트는 답글 보기로 바꿈
			document.querySelector("#reply-reply-show-btn-" + replySeqNum).textContent = "답글 보기";
		}
	}
	else {
		alert("답글이 존재하지 않습니다!");
	}
	
}
//	더보기 버튼 클릭시 더보기 팝업창 띄우거나 닫음
//	게시물이 내 소유가 아닐 때
const popup_more_wrap = document.querySelectorAll(".popup-more-wrap")[0];
//	게시물이 내 소유일 때
const popup_more_wrap2 = document.querySelectorAll(".popup-more-wrap2")[0];
const ask_remove_board_wrap = document.getElementById("ask-remove-board-wrap");
function showMorePopup(isMine, boardNum, contentOrder) {
	document.body.classList.add("stop-scroll");
	if(isMine === "true") {
		popup_more_wrap2.classList.remove("displayNone");
		document.getElementById("remove-board-btn").classList.add(boardNum);
		document.getElementById("remove-board-btn").classList.add(contentOrder);
	}
	else {
		popup_more_wrap.classList.remove("displayNone");
	}
}
//	더보기 버튼 클릭 시 내 게시물이 아닐 경우 띄워주는 창
function removeMorePopup() {
	if(document.getElementById("popup-background-wrap").style.display !== "block") {
		document.body.classList.remove("stop-scroll");
	}
	popup_more_wrap.classList.add("displayNone");
}
popup_more_wrap.addEventListener("click", function(e) {
	if(e.target.id === "popup-more-wrap") {
		removeMorePopup();
	}
});
//	더보기 버튼 클릭 시 내 게시물일 경우 띄워주는 창
function removeMorePopup2() {
	if(document.getElementById("popup-background-wrap").style.display !== "block") {
		document.body.classList.remove("stop-scroll");
	}
	document.getElementById("remove-board-btn").classList.remove(document.getElementById("remove-board-btn").classList[0]);
	document.getElementById("remove-board-btn").classList.remove(document.getElementById("remove-board-btn").classList[0]);
	popup_more_wrap2.classList.add("displayNone");
}
popup_more_wrap2.addEventListener("click", function(e) {
	if(e.target.id === "popup-more-wrap2") {
		removeMorePopup2();
	}
});
//	삭제 버튼을 클릭했을 때 정말 삭제할 것인지 물어보는 창
function showAskRemoveBoard() {
	popup_more_wrap2.classList.add("displayNone");
	ask_remove_board_wrap.classList.remove("displayNone");
}
function removeAskRemoveBoard() {
	if(document.getElementById("popup-background-wrap").style.display !== "block") {
		document.body.classList.remove("stop-scroll");
	}
	document.getElementById("remove-board-btn").classList.remove(document.getElementById("remove-board-btn").classList[0]);
	document.getElementById("remove-board-btn").classList.remove(document.getElementById("remove-board-btn").classList[0]);
	ask_remove_board_wrap.classList.add("displayNone");
}
ask_remove_board_wrap.addEventListener("click", function(e) {
	if(e.target.id === "ask-remove-board-wrap") {
		removeAskRemoveBoard();
	}
});
//	실제 삭제
function removeBoard() {
	const targetBoardNum = document.getElementById("remove-board-btn").classList[0];
	const xhr = new XMLHttpRequest();
	xhr.open("POST", contextPath + "/board/SHRemoveBoard.bo", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				let txt = xhr.responseText.trim();
				if(txt === "O") {
					if(document.getElementById("popup-background-wrap").style.display !== "block") {
						let targetContentNum = document.getElementById("remove-board-btn").classList[1];
						let target = document.getElementById("content-layout-" + targetContentNum);
						target.remove();
					}
					removeAskRemoveBoard();
					if(document.getElementById("popup-background-wrap").style.display === "block") {
						removePopup();
					}
				}
			}
		}
	}
	xhr.send("boardNum=" + targetBoardNum);
	
}


//	aside, 왼쪽 추천 팔로우 버튼 클릭시 수행되는 함수
function follow(userId, btnNumber, userImg) {
	let targetBtn = null;
	if(btnNumber <= 5) {
		targetBtn = document.getElementById("aside-follow-btn-" + btnNumber);
	}
	const recommandAreaBtn = document.getElementById("recommand-area-follow-btn-" + btnNumber);
	if(recommandAreaBtn.innerText === "팔로우") {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/user/SHFollowUser.us", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let txt = xhr.responseText.trim();
					if(txt === "O") {
						if(btnNumber <= 5) {
							targetBtn.innerText = "팔로잉";
							targetBtn.style.color = "black";
						}
						
						recommandAreaBtn.innerText = "팔로잉";
						recommandAreaBtn.style.color = "black";
						recommandAreaBtn.style.backgroundColor = "white";
						recommandAreaBtn.style.border = "1px solid #e0e0e0";
					}
				}
			}
		}
		xhr.send("userId=" + userId);
	}
	else {
		const followCancelWrap = document.querySelector(".follow-cancel-wrap");
		const userImgDiv = document.querySelector(".follow-info-img");
		const userIdDiv = document.querySelector(".follow-info-wrap > div:nth-child(2)");
		document.body.classList.add("stop-scroll");
		followCancelWrap.classList.remove("displayNone");
		if(userImg === '') {
			userImgDiv.style.backgroundImage = "url('" + contextPath + "/img/server_images/profile_image/unknown.png')";
		}
		else {
			userImgDiv.style.backgroundImage = "url('" + contextPath + "/img/server_images/profile_image/" + userImg + "')";
		}
		userIdDiv.innerText = userId + "님의 팔로우를 취소하시겠어요?";
		const realFollowCancelBtn = document.getElementById("real-follow-cancel");
		realFollowCancelBtn.classList.add("" + userId);
		realFollowCancelBtn.classList.add("" + btnNumber);
	}
}
//	팔로우 취소
function cancelFollow() {
	const realFollowCancelBtn = document.getElementById("real-follow-cancel");
	const userId = realFollowCancelBtn.classList[0];
	const btnNumber = realFollowCancelBtn.classList[1];
	let targetBtn = null;
	if(btnNumber <= 5) {
		targetBtn = document.getElementById("aside-follow-btn-" + btnNumber);
	}
	const recommandAreaBtn = document.getElementById("recommand-area-follow-btn-" + btnNumber);
	const xhr = new XMLHttpRequest();
	xhr.open("POST", contextPath + "/user/SHFollowCancelUser.us", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				let txt = xhr.responseText.trim();
				if(txt === "O") {
					if(btnNumber <= 5) {
						targetBtn.innerText = "팔로우";
						targetBtn.style.color = "#2196f3";
					}
					recommandAreaBtn.innerText = "팔로우";
					recommandAreaBtn.style.color = "white";
					recommandAreaBtn.style.border = "none";
					recommandAreaBtn.style.backgroundColor = "#2196f3";
				}
			}
		}
	}
	xhr.send("userId=" + userId);
	exitCancel();
}
//	팔로우 취소 팝업창 취소
function exitCancel() {
	const followCancelWrap = document.querySelector(".follow-cancel-wrap");
	document.body.classList.remove("stop-scroll");
	followCancelWrap.classList.add("displayNone");
	const realFollowCancelBtn = document.getElementById("real-follow-cancel");
	realFollowCancelBtn.classList.remove(realFollowCancelBtn.classList[0] + "");
	realFollowCancelBtn.classList.remove(realFollowCancelBtn.classList[0] + "");
}

////////////////////////////////////////////////////////////////////////////////////////
//	메인에서 하트 클릭 시 실행
function clickHeartIcon(isRed, loginUserId, boardNum, contentOrder) {
//	하트가 눌려저 있는 상황 (좋아요 취소)
	const targetWrap = document.querySelector("#reply-area-icons-left-wrap-" + contentOrder);
	if(isRed === "true") {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/like/SHCancelLikeClickBoard.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let txt = xhr.responseText.trim();
					if(txt !== "X") {
						const targetHeartIcon = document.getElementById("heart-icon-" + contentOrder);
						targetHeartIcon.remove();
						let text = "<div id=\"heart-icon-" + contentOrder + "\" class=\"heart-icon\" style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_empty.png');\" onclick=\"clickHeartIcon('false', '" + loginUserId + "', '" + boardNum + "', '" + contentOrder + "');\"></div>";
						targetWrap.insertAdjacentHTML("afterbegin", text);
						const targetText = document.getElementById("reply-area-like-wrap-" + contentOrder);
						targetText.innerText = "좋아요 " + txt + "개";
					}
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum);
	}
//	하트를 누르지 않은 상황 (좋아요)
	else {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/like/SHLikeClickBoard.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let txt = xhr.responseText.trim();
					if(txt !== "X") {
						const targetHeartIcon = document.getElementById("heart-icon-" + contentOrder);
						targetHeartIcon.remove();
						let text = "<div id=\"heart-icon-" + contentOrder + "\" class=\"heart-icon\" style=\"background-image: url('" + contextPath + "/img/seonghak/like_heart_red.png');\" onclick=\"clickHeartIcon('true', '" + loginUserId + "', '" + boardNum + "', '" + contentOrder + "');\"></div>";
						targetWrap.insertAdjacentHTML("afterbegin", text);
						const targetText = document.getElementById("reply-area-like-wrap-" + contentOrder);
						targetText.innerText = "좋아요 " + txt + "개";
					}
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////
//	메인에서 북마크 버튼 클릭 시 실행
function clickBookmarkIcon(isBlack, loginUserId, boardNum, contentOrder) {
//	북마크가 눌려 있는 상태이므로 북마크를 취소한다
	const targetWrap = document.getElementById("reply-area-icons-right-wrap-" + contentOrder);
	if(isBlack === "true") {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/bookmark/SHCancelBookmarkClickBoard.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let txt = xhr.responseText.trim();
					if(txt === "O") {
						const targetBookmarkIcon = document.getElementById("bookmark-icon-" + contentOrder);
						targetBookmarkIcon.remove();
						let emptyBookmark = "<div id=\"bookmark-icon-" + contentOrder + "\" class=\"bookmark-icon\" style=\"background-image: url('" + contextPath + "/img/seonghak/bookmark.png\" onclick=\"clickBookmarkIcon('false', '" + loginUserId + "', '" + boardNum + "', '" + contentOrder + "');\"></div>";
						targetWrap.insertAdjacentHTML("afterbegin", emptyBookmark);
					}
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum);
	}
//	북마크가 눌려 있지 않은 상태이므로 북마크를 추가한다
	else {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/bookmark/SHBookmarkClickBoard.bo", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let txt = xhr.responseText.trim();
					if(txt === "O") {
						const targetBookmarkIcon = document.getElementById("bookmark-icon-" + contentOrder);
						targetBookmarkIcon.remove();
						let emptyBookmark = "<div id=\"bookmark-icon-" + contentOrder + "\" class=\"bookmark-icon\" style=\"background-image: url('" + contextPath + "/img/seonghak/bookmark_black.png\" onclick=\"clickBookmarkIcon('true', '" + loginUserId + "', '" + boardNum + "', '" + contentOrder + "');\"></div>";
						targetWrap.insertAdjacentHTML("afterbegin", emptyBookmark);
					}
				}
			}
		}
		xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum);
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////
//	메인에서 댓글 남기기
function writeReply(contentOrder, loginUserId, boardNum) {
	const targetTextarea = document.getElementById("reply-textarea-" + contentOrder);
	const targetMyReplyWrap = document.getElementById("my-reply-wrap-" + contentOrder);
	let content = targetTextarea.value.trim();
	if(content === "") {
		alert("댓글 내용을 입력하세요!");
		targetTextarea.value = "";
		targetTextarea.focus();
		return false;
	}
	if(content.length > 200) {
		alert("댓글은 200자 이하로 작성하세요!");
		targetTextarea.value = "";
		targetTextarea.focus();
		return false;
	}
	const pattern = /\s/g;
	if(content.replace(pattern, "") === "") {
		alert("공백만 입력할 수 없습니다!");
		targetTextarea.value = "";
		targetTextarea.focus();
		return false;
	}
	content = content.replace(/\r\n/gi, '<br>');
	content = content.replace(/\\n/gi, '<br>');
	content = content.replace(/\n/gi, '<br>');
	const xhr = new XMLHttpRequest();
	xhr.open("POST", contextPath + "/reply/SHReplyWrite.bo", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				let txt = xhr.responseText.trim();
				if(txt !== "X") {
					const targetReplyCountWrap = document.getElementById("reply-area-reply-count-wrap-" + contentOrder);
					targetReplyCountWrap.innerText = txt;
					let newMyReply = "<span><a href=\"#\">" + loginUserId + "</a>&nbsp;&nbsp;" + content + "</span>";
					targetMyReplyWrap.insertAdjacentHTML("beforeend", newMyReply);
					targetTextarea.value = "";
				}
			}
		}
	}
	xhr.send("userId=" + loginUserId + "&boardNum=" + boardNum + "&replyContents=" + content);
}