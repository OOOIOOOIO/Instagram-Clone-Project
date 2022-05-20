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

function follow(userId, recommandCount, userImg) {
	let followBtn = document.querySelector("#follow-btn-" + recommandCount);
	let followBtnSpan = document.querySelector("#follow-btn-" + recommandCount + " > span");
	let tooltipFollowBtnWrap1 = document.querySelectorAll(".tooltip-follow-btn-wrap-" + recommandCount)[0];
	let tooltipFollowBtnWrap2 = document.querySelectorAll(".tooltip-follow-btn-wrap-" + recommandCount)[1];
	if(followBtnSpan.innerText === "팔로우") {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", contextPath + "/user/SHFollowUser.us", true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200 || xhr.status == 201){
					let txt = xhr.responseText.trim();
					if(txt === "O") {
						followBtn.style.backgroundColor = "white";
						followBtn.style.border = "1px solid black";
						followBtnSpan.innerText = "팔로잉";
						followBtnSpan.style.color = "black";
						
						tooltipFollowBtnWrap1.style.backgroundColor = "white";
						tooltipFollowBtnWrap1.style.border = "1px solid black";
						tooltipFollowBtnWrap1.style.color = "black";
						tooltipFollowBtnWrap1.innerText = "팔로잉";
						
						tooltipFollowBtnWrap2.style.backgroundColor = "white";
						tooltipFollowBtnWrap2.style.border = "1px solid black";
						tooltipFollowBtnWrap2.style.color = "black";
						tooltipFollowBtnWrap2.innerText = "팔로잉";
					}
				}
			}
		}
		xhr.send("userId=" + userId);
	}
	else {
		document.body.classList.add("stop-scroll");
		const followCancelPopup = document.querySelector(".follow-cancel-wrap");
		followCancelPopup.classList.remove("displayNone");
		const popupImg = document.querySelector(".follow-info-img");
		if(userImg !== '') {
			popupImg.style.backgroundImage = "url(\'" + contextPath +"/img/server_images/profile_image/" + userImg + "\')"
		}
		else {
			popupImg.style.backgroundImage = "url(\'" + contextPath +"/img/server_images/profile_image/unknown.png\')"
		}
		const popupText = document.querySelector(".follow-info-wrap > div:nth-child(2)");
		popupText.innerText = userId + " 님의 팔로우를 취소하시겠어요?";
		const realFollowCancelBtn = document.getElementById("real-follow-cancel");
		realFollowCancelBtn.classList.add("" + userId);
		realFollowCancelBtn.classList.add("" + recommandCount);
	}
}

function cancelFollow() {
	const realFollowCancelBtn = document.getElementById("real-follow-cancel");
	const userId = realFollowCancelBtn.classList[0];
	const recommandCount = realFollowCancelBtn.classList[1];
	let followBtn = document.querySelector("#follow-btn-" + recommandCount);
	let followBtnSpan = document.querySelector("#follow-btn-" + recommandCount + " > span");
	let tooltipFollowBtnWrap1 = document.querySelectorAll(".tooltip-follow-btn-wrap-" + recommandCount)[0];
	let tooltipFollowBtnWrap2 = document.querySelectorAll(".tooltip-follow-btn-wrap-" + recommandCount)[1];
	const xhr = new XMLHttpRequest();
	xhr.open("POST", contextPath + "/user/SHFollowCancelUser.us", true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				let txt = xhr.responseText.trim();
				if(txt === "O") {
					followBtn.style.backgroundColor = "#2196f3";
					followBtn.style.border = "none";
					followBtnSpan.innerText = "팔로우";
					followBtnSpan.style.color = "white";
					
					tooltipFollowBtnWrap1.style.backgroundColor = "#2196f3";
					tooltipFollowBtnWrap1.style.border = "none";
					tooltipFollowBtnWrap1.style.color = "white";
					tooltipFollowBtnWrap1.innerText = "팔로우";
					
					tooltipFollowBtnWrap2.style.backgroundColor = "#2196f3";
					tooltipFollowBtnWrap2.style.border = "none";
					tooltipFollowBtnWrap2.style.color = "white";
					tooltipFollowBtnWrap2.innerText = "팔로우";
				}
			}
		}
	}
	xhr.send("userId=" + userId);
	exitCancel();
}

function exitCancel() {
	document.body.classList.remove("stop-scroll");
	const followCancelPopup = document.querySelector(".follow-cancel-wrap");
	followCancelPopup.classList.add("displayNone");
	const realFollowCancelBtn = document.getElementById("real-follow-cancel");
	realFollowCancelBtn.classList.remove(realFollowCancelBtn.classList[0] + "");
	realFollowCancelBtn.classList.remove(realFollowCancelBtn.classList[0] + "");
}