// text_up
var input1 = document.getElementById('1-1');
var input2 = document.getElementById('2-1');
var input3 = document.getElementById('3-1');
var input4 = document.getElementById('4-1');


input1.addEventListener('input', updateValue1);


function updateValue1(e) {

	document.getElementById("1").style = "transform: scale(.83333) translateY(-10px)";
	document.getElementById("1-1").style = "font-size: 12px"; "padding: 14px 0 2px 8px!important";
	document.getElementById("1-1").style = "padding: 14px 0 2px 8px!important";
}
input2.addEventListener('input', updateValue2);

function updateValue2(e) {
	document.getElementById("2").style = "transform: scale(.83333) translateY(-10px)";
	document.getElementById("2-1").style = "font-size: 12px"; "padding: 14px 0 2px 8px!important";
	document.getElementById("2-1").style = "padding: 14px 0 2px 8px!important";
	
}

input3.addEventListener('input', updateValue3);
	

function updateValue3(e) {
	document.getElementById("3").style = "transform: scale(.83333) translateY(-10px)";
	document.getElementById("3-1").style = "font-size: 12px"; "padding: 14px 0 2px 8px!important";
	document.getElementById("3-1").style = "padding: 14px 0 2px 8px!important";
	
}

input4.addEventListener('input', updateValue4);

function updateValue4(e) {
	document.getElementById("4").style = "transform: scale(.83333) translateY(-10px)";
	document.getElementById("4-1").style = "font-size: 12px"; "padding: 14px 0 2px 8px!important";
	document.getElementById("4-1").style = "padding: 14px 0 2px 8px!important";
	
}


// 유효성 검사 그림 넣기
var flag_1 = false;
var flag_2 = false;
var flag_3 = false;
var flag_4 = false;

// 1, 그림 넣기(휴대폰번호 or 이메일) 
$("#1-1").on("change", function(event) {
	if(this.value){ // 맞았을 때
		if(this.value.length >= 10 || (this.value.includes("@") && this.value.includes(".com"))){
			flag_1 = true;
			$("#js_img_1").css({"background-image":"url(https://www.instagram.com/static/bundles/es6/sprite_core_32f0a4f27407.png/32f0a4f27407.png)"});
			$('#js_img_1').css("background-position-x", "-225px");
			$('#js_img_1').css("background-position-y", "-333px");
		}
		else{
			flag_1 = false;
			$("#js_img_1").css({"background-image":"url(https://www.instagram.com/static/bundles/es6/sprite_core_32f0a4f27407.png/32f0a4f27407.png)"});
			$('#js_img_1').css("background-position-x", "-249px");
			$('#js_img_1').css("background-position-y", "-333px");
		}
    } 
    else{
	  $("#js_img_1").hide();
    }     
});

//2, 그림 넣기(성명)
$("#2-1").on("change", function(event) {
	if(this.value){ // 맞았을 때
		if(this.value.length >= 1){
			flag_2 = true;
			$("#js_img_2").css({"background-image":"url(https://www.instagram.com/static/bundles/es6/sprite_core_32f0a4f27407.png/32f0a4f27407.png)"});
			$('#js_img_2').css("background-position-x", "-225px");
			$('#js_img_2').css("background-position-y", "-333px");
		}
		else{
			flag_2 = false;
			$("#js_img_2").css({"background-image":"url(https://www.instagram.com/static/bundles/es6/sprite_core_32f0a4f27407.png/32f0a4f27407.png)"});
			$('#js_img_2').css("background-position-x", "-249px");
			$('#js_img_2').css("background-position-y", "-333px");
		}
    } 
    else{
	  $("#js_img_2").hide();
    }     
});

//3, 그림 넣기(사용자 이름)
$("#3-1").on("change", function(event) {
	if(this.value){ // 맞았을 때
		if(this.value.length >= 1 ){
			$("#js_img_3").css({"background-image":"url(https://www.instagram.com/static/bundles/es6/sprite_core_32f0a4f27407.png/32f0a4f27407.png)"});
			$('#js_img_3').css("background-position-x", "-225px");
			$('#js_img_3').css("background-position-y", "-333px");
			flag_3 = true;
		}
		else{
			flag_3 = false;
			$("#js_img_3").css({"background-image":"url(https://www.instagram.com/static/bundles/es6/sprite_core_32f0a4f27407.png/32f0a4f27407.png)"});
			$('#js_img_3').css("background-position-x", "-249px");
			$('#js_img_3').css("background-position-y", "-333px");
		}
    } 
    else{
	  $("#js_img_3").hide();
    }     
});

//4, 그림 넣기(비밀번호)
$("#4-1").on("change", function(event) {
	if(this.value){ // 맞았을 때
		if(this.value.length >= 6){
			flag_4 = true;
			$("#js_img_4").css({"background-image":"url(https://www.instagram.com/static/bundles/es6/sprite_core_32f0a4f27407.png/32f0a4f27407.png)"});
			$('#js_img_4').css("background-position-x", "-225px");
			$('#js_img_4').css("background-position-y", "-333px");
		}
		else{
			flag_4 = false;
			$("#js_img_4").css({"background-image":"url(https://www.instagram.com/static/bundles/es6/sprite_core_32f0a4f27407.png/32f0a4f27407.png)"});
			$('#js_img_4').css("background-position-x", "-249px");
			$('#js_img_4').css("background-position-y", "-333px");
		}
    } 
    else{
	  $("#js_img_4").hide();
    }     
});


//4, 비밀먼호 표시 - 숨김 버튼 표시
$("#4-1").on("keyup", function(event) {
  if (event.keyCode == 13) { // enter 키 누를 시
    event.preventDefault();
    $("#showPW_btn").triggerHandler("click");
  } else {
    if (this.value) {
      $("#showPW_btn").css("display", "inline-block");
    } else {
      $("#showPW_btn").hide();
    }
  }
});


$("#showPW_box").on("click", function() {
  if ($("#4-1").attr("type") == "password") {
    $("#4-1").attr("type", "text");
    $($(this)).text("숨기기");
    $($(this)).css("font-weight", 600);
    $($(this)).css("user-select", "none");
    $($(this)).css("cursor", "pointer");
    
  } else {
    $("#4-1").attr("type", "password");
    $($(this)).text("비밀번호 표시");
  }
});


//가입버튼 활성화 
var input_1 = document.getElementById("1-1"); 
var input_2 = document.getElementById("2-1"); 
var input_3 = document.getElementById("3-1"); 
var input_4 = document.getElementById("4-1"); 

input_1.addEventListener('change', state_join);
input_2.addEventListener('change', state_join);
input_3.addEventListener('change', state_join);
input_4.addEventListener('change', state_join);


function state_join(){		
	if(flag_1 && flag_2 && flag_3 && flag_4){
		join_btn.disabled = false;
		join_btn.style = "pointer-events: inherit";
		join_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),1)";
	}
	else{
		join_btn.style = "pointer-events: none";
		join_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),.3)";
		join_btn.disabled = true;
	}
}


//랜덤 username주기
function random_username(){
	const data = Math.random().toString(36).substr(2,11);
	//Math.random().toString(36).substr(2,11); 
	//Math.floor(Math.random() * 100001);
	document.getElementById("3-1").value = data;
}



// 유효성 검사
var join_btn = document.getElementById("join_btn");
var text_phone = document.getElementById("text_phone");
var text_email = document.getElementById("text_email");
var text_password = document.getElementById("text_password");
var text_userid = document.getElementById("text_userid");
var text_email_again = document.getElementById("text_email_again");
var text_phone_again = document.getElementById("text_phone_again");

var userInfo = document.userInfo;
var user_id = userInfo.user_id;
var user_pw = userInfo.user_pw;
var user_emailOrPhone = userInfo.emailOrPhone;



function check(){
	text_userid.style.display="none";
	text_password.style.display="none";
	text_email.style.display="none";
	text_phone.style.display="none";
	text_email_again.style.display="none";
	text_phone_again.style.display="none";
	
	let	user_id_value = user_id.value;
	let	user_pw_value = user_pw.value;
	let user_emailOrPhone_value = user_emailOrPhone.value;
	
	let xhr = new XMLHttpRequest();
	//통신할 곳과의 연결 통로 열기
	xhr.open("POST",cp+"/user/CheckIdOk.us",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); // 헤더 확인
	//xhr의 상태가 변할 때 호출될 함수 미리 설정
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				let txt = xhr.responseText;
				//문자열.trim() : 문자열의 양쪽에 있는 공백 제거
				txt = txt.trim();
				
				if(txt == "O"){
					//중복체크 통과
					userInfo.action=cp+"/user/UserJoinOk.us";
					userInfo.submit();
					//onclick="location.href='${cp}/user/UserJoinOk.us'"
				}
				else if(txt == "id"){
					//중복체크 실패
					text_userid.style.display="block";
				}
				else if(txt == "email_a"){
					text_email_again.style.display="block";
				}
				else if(txt == "email_b"){
					text_email.style.display="block";
				}
				else if(txt == "phone_a"){
					text_phone_again.style.display="block";
				}
				else if(txt == "phone_b"){
					text_phone.style.display="block";
				}
				else{;}
			}
		}
	}
	//통신하기
	xhr.send("user_id="+user_id_value+"&user_emailOrPhone="+user_emailOrPhone_value);
	
	// 비밀번호 형식
	if(/(\w)\1\1\1/.test(user_pw_value)){
		text_password.style.display="block";
	}
}




