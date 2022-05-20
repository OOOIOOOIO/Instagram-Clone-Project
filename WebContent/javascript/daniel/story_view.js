//검색창
let search = document.getElementById("search");
let search_icon = document.getElementById("search-icon");
let delete_icon = document.getElementById("delete-icon");
delete_icon.addEventListener("mousedown", function(e) {
	search.value = "";
});
search.addEventListener("focus", function() {
	search_icon.style.display = "none";
	delete_icon.style.display = "block";
	search.style.textIndent = "4%";
	search.style.color = "black";
	this.select();
});
search.addEventListener("blur", function(){
	search_icon.style.display = "block";
	delete_icon.style.display = "none";
	search.style.textIndent = "15%";
	if(search.value !== ""){
		search.style.color = "gray";
	}
});

//검색창 클릭시 최근검색 팝업
let search_popup = document.querySelector(".search-popup");
search.addEventListener("click", function(e) {
	let recent_cnt = document.getElementsByClassName("recent-search-user").length;
	search_popup.style.display = "block";
	if(recent_cnt > 5){
		search_popup.style.overflowY = "scroll";
	} else if(recent_cnt == 0){
		document.querySelector(".recent-remove").style.display = "none";
	}
	document.querySelector(".main").addEventListener("click", function(e) {
		search_popup.style.display = "none";
	});
});

//검색창 팝업에서 모두 지우기
let recent_remove_all = document.querySelector(".recent-remove");
let recent_search_user_wrap = document.querySelector(".recent-search-user-wrap");
recent_remove_all.addEventListener("click", function(e) {
	let recent_search_user = document.getElementsByClassName("recent-search-user");
	recent_search_user_wrap.innerHTML = "";
	let recent_cnt = document.getElementsByClassName("recent-search-user").length;
	if(recent_cnt == 0) {
		document.querySelector(".recent-remove").style.display = "none";
		search_popup.style.overflowY = "hidden";
	}
});

//검색창 팝업에서 하나씩 지우기
function remove_recent_one(num){
	document.getElementById("recent-search-user-" + num).remove();
	let recent_cnt = document.getElementsByClassName("recent-search-user").length;
	if(recent_cnt <= 5 && recent_cnt > 0) {
		document.querySelector(".recent-remove").style.display = "flex";
		search_popup.style.overflowY = "hidden";
	} else if(recent_cnt == 0){
		document.querySelector(".recent-remove").style.display = "none";
	}
}

//스토리 좌우이동
let subStoryLeftBtn = document.getElementById("story-sub-left");
let subStoryRightBtn = document.getElementById("story-sub-right");
subStoryLeftBtn.addEventListener("click", function() {
	let x = document.getElementById("story-sub");
	subStoryRightBtn.style.display="block";
	x.scrollLeft = x.scrollLeft - 945;
	if(x.scrollLeft <= 1000) {
		subStoryLeftBtn.style.display = "none";
	}
});
subStoryRightBtn.addEventListener("click", function() {
	let x = document.getElementById("story-sub");
	subStoryLeftBtn.style.display = "block";
	x.scrollLeft = x.scrollLeft + 945;
	if(x.scrollLeft >= x.scrollWidth-2000) {
		subStoryRightBtn.style.display = "none";
	}
});

//스토리 7개보다 적을시 좌우이동키 안띄워줌
onload = function(){
	let story_cnt = document.getElementsByClassName("story-info").length;
	if(story_cnt <= 7){
		subStoryRightBtn.style.display = "none";
	}
}

//추천 계정 팝업
let recommend_popup_btn = document.getElementById("button2");
let recommend_popup = document.getElementById("popup-recommend");
let recommend_popup_remove = document.querySelector(".button2 > span");
recommend_popup_btn.addEventListener("click", function(e) {
	if(recommend_popup_remove.style.transform === "rotate(135deg)"){
		recommend_popup.style.display = "block";
		recommend_popup_remove.style.transform = "rotate(315deg)";
	} else {
		recommend_popup.style.display = "none";
		recommend_popup_remove.style.transform = "rotate(135deg)";
	}
});

//추천 계정 좌우이동
let recommend_right_btn = document.getElementById("recommend-right-btn");
let recommend_left_btn = document.getElementById("recommend-left-btn");
recommend_left_btn.addEventListener("click", function() {
	let x = document.getElementById("recommend-people");
	recommend_right_btn.style.display = "block";
	x.scrollLeft = x.scrollLeft - 945;
	if(x.scrollLeft <= 1000){
		recommend_left_btn.style.display = "none";
	}
});
recommend_right_btn.addEventListener("click", function() {
	let x = document.getElementById("recommend-people");
	x.scrollLeft = x.scrollLeft + 945;
	recommend_left_btn.style.display = "block";
	if(x.scrollLeft >= x.scrollWidth - 2000){
		recommend_right_btn.style.display = "none";
	}
});

//추천 계정 x 클릭시 목록에서 삭제 + 4개이하로 될시 오른쪽으로 이동키 삭제
function recommend_delete(userid){
	document.getElementById("recommend-people-wrap-" + userid).remove();
	let recommend_cnt = document.getElementsByClassName("recommend-people-wrap").length;
	if(recommend_cnt <= 4){
		recommend_right_btn.style.display = "none";
	}
}

//처음 접속시 추천 계정 5개보다 적을때 좌우 이동키 안띄워줌
onload = function(){
	let recommend_cnt = document.getElementsByClassName("recommend-people-wrap").length;
	if(recommend_cnt <= 4){
		recommend_right_btn.style.display = "none";
	}
}

//차단팝업
let block = document.getElementById("block");
let block_btn = document.getElementsByClassName("button3");
let popup_background = document.getElementById("popup-background");
let body = document.querySelector("body");
block_btn[0].addEventListener("click", function(e){
	popup_background.style.display = "block";
	popup_background.style.background = "rgba(0,0,0,0.7)";
	document.body.classList.add("stop-scroll");
});
popup_background.addEventListener("click", function(e) {
	if(e.target.id === "popup-background"){
		popup_background.style.display = "none";
		document.body.classList.remove("stop-scroll");
	}
});

//차단팝업 취소
let cancel_block_popup = document.querySelector(".cancel");
cancel_block_popup.addEventListener("click", function(e) {
	popup_background.style.display = "none";
});

//비슷한 계정 보기
let see_all_popup = document.getElementById("see-all-popup-open");
let popup_background_see_all = document.getElementById("popup-background-see-all");
see_all_popup.addEventListener("click", function(e) {
	popup_background_see_all.style.display = "block";
	document.body.classList.add("stop-scroll");
});

//비슷한 계정 닫기
let similar_close = document.getElementById("similar-account-close");
similar_close.addEventListener("click", function(e) {
	popup_background_see_all.style.display = "none";
	document.body.classList.remove("stop-scroll");
});

//태그됨 <-> 스토리
let tag = document.getElementById("tag");
let write = document.getElementById("write");
let tag_img = document.querySelector("#tag-img");
let write_img = document.querySelector("#write-img");
let story = document.querySelector(".story");
let tag_popup = document.querySelector(".tag-popup");
let footer = document.querySelector("footer");
tag.addEventListener("click", function(e) {
	write.style.borderTop = "none";
	write.style.color = "gray";
	write.style.cursor = "pointer";
	write_img.setAttribute("src", cp + "/img/daniel/story_view/write.png");
	tag.style.borderTop = "1px solid black";
	tag.style.color = "black";
	tag.style.cursor = "default";
	tag_img.setAttribute("src", cp + "/img/daniel/story_view/tag_on.png");
	story.style.display = "none";
	tag_popup.style.display = "block";
});
write.addEventListener("click", function(e) {
	tag.style.borderTop="none";
	tag.style.color = "gray";
	tag.style.cursor = "pointer";
	tag_popup.style.display = "none";
	tag_img.setAttribute("src", cp + "/img/daniel/story_view/tag.png");
	write.style.borderTop = "1px solid black";
	write.style.color = "black";
	write.style.cursor = "default";
	write_img.setAttribute("src", cp + "/img/daniel/story_view/write_on.png");
	story.style.display = "block";
});

//header 마이페이지쪽 띄워주기/닫기
let mypage_img = document.querySelector("#mypage-img");
let mypage_popup = document.querySelector(".mypage-popup");
mypage_img.addEventListener("click", function(e) {
	mypage_popup.style.display = "block";
	if(mypage_popup.style.display === "block"){
		document.querySelector(".main").addEventListener("click", function(e) {
			mypage_popup.style.display = "none";
		});
	}
});

//ajax로 유저 검색
function check_search() {
	let obj = null;
	let recent_menu = document.querySelector(".recent-menu");
	let search = document.getElementById("search").value;
	let recent_search_user_wrap = document.querySelector(".recent-search-user-wrap");
	// 배열 선언이유 : 최근 검색된 유저 보여주기위해
	// obj는 지역변수라 for문밖에서 못써서 그 값을 배열에 넣어줌
	let recent_search_id_save = new Array();
	let recent_search_name_save = new Array();
	let recent_search_img_save = new Array();
	recent_search_user_wrap.innerHTML = "";
	
	let xhr = new XMLHttpRequest();
		xhr.open("GET", cp + "/user/searchUser.us?search=" + search, true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == XMLHttpRequest.DONE) {
				if (xhr.status == 200 || xhr.status == 201) {
						obj = JSON.parse(xhr.responseText);
						for (let i = 0; i < obj.search_user.length; i++) {
						let node = ""
						node += "<div class='recent-search-user' id='recent-search-user-${i}'>"
							node += "<div class='recent-search-user-profile'>"
								if(obj.search_user[i].img == null){
									node += "<img src=\"" + cp + "/server_images/profile_image/basic_img.png\" class='recent-search-user-img-${i}' id='recent-search-user-img'>"
								} else {
									node += "<img src=\"" + cp + "/server_images/profile_image/" + obj.search_user[i].img + "\" class='recent-search-user-img-${i}' id='recent-search-user-img'>"
								}
							node += "</div>"
							node += "<div class='recent-search-user-link'>"
								node += "<div class='recent-search-user-name-${i}' id='recent-search-user-name'>" + obj.search_user[i].id + "</div>"
								if(obj.search_user[i].name == null){
									node += "<div class='recent-search-user-etc-${i}' id='recent-search-user-etc'></div>"
								} else{
									node += "<div class='recent-search-user-etc-${i}' id='recent-search-user-etc'>" + obj.search_user[i].name + "</div>"
								}
							node += "</div>"
							node += "<div class='recent-search-user-remove' id='recent-search-user-remove-${i}'>"
								node += "<img src='${cp}/img/daniel/story_view/recent_search_user_remove.png' class='recent_user_remove' onclick='remove_recent_one(${i});'>"
							node += "</div>"
						node += "</div>"
						
					document.getElementById("recent-search-user-wrap").insertAdjacentHTML("afterbegin", node);
					}
					let recent_cnt = document.getElementsByClassName("recent-search-user").length;
					if(recent_cnt > 5){
						search_popup.style.overflowY = "scroll";
					} else if(recent_cnt == 0){
						document.querySelector(".recent-remove").style.display = "none";
					}
				}
			}
		}
		xhr.send();
}

