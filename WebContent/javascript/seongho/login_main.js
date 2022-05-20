// text_up
var input1 = document.getElementById('1-1');
var input2 = document.getElementById('2-1');

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

// show_pw
$("#2-1").on("keyup", function(event) {
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
})


$("#showPW_box").on("click", function() {
  if ($("#2-1").attr("type") == "password") {
    $("#2-1").attr("type", "text");
    $($(this)).text("숨기기");
    $($(this)).css("font-weight", 600);
    $($(this)).css("user-select", "none");
    $($(this)).css("cursor", "pointer");
    
  } else {
    $("#2-1").attr("type", "password");
    $($(this)).text("비밀번호 표시");
  }
});

//input_disabled

var input_1 = document.getElementById("1-1"); 
var input_2 = document.getElementById("2-1"); 
var login_btn = document.getElementById("login_btn"); 

input_1.addEventListener('input', state_login);
input_2.addEventListener('input', state_login);

function state_login(){		
	if(input_1.value.length >= 1 && input_2.value.length >= 6){
		login_btn.disabled = false;
		login_btn.style = "pointer-events: inherit";
		login_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),1)";
	}
	else{
		login_btn.style = "pointer-events: none";
		login_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),.3)";
		login_btn.disabled = true;
	}
}


//login_main
var text_userid = document.getElementById("text_id");
var text_pw = document.getElementById("text_pw");


var userInfo = document.userInfo;
var user_id = userInfo.user_id;
var user_pw = userInfo.user_pw;



//유효성 검사	
function check(){
	text_userid.style.display="none";
	text_pw.style.display="none";
	
	let	user_id_value = user_id.value;
	let	user_pw_value = user_pw.value;
	
	let xhr = new XMLHttpRequest();
	//통신할 곳과의 연결 통로 열기
	xhr.open("POST",cp+"/user/LoginCheckOk.us",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); // 헤더 확인
	//xhr의 상태가 변할 때 호출될 함수 미리 설정
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				let txt = xhr.responseText;
				txt = txt.trim();
				// 통과
				if(txt == "O"){
					userInfo.action=cp+"/user/UserLoginOk.us";
					userInfo.submit();
				}
				//실패
				else if(txt == "id"){
					text_userid.style.display="block";
				}
				//실패
				else if(txt == "pw"){
					text_pw.style.display="block";
				}
				else{
					text_userid.style.display="block";
				}
			}
		}
	}
	//통신하기
	xhr.send("user_id="+user_id_value+"&user_pw="+user_pw_value);
	

}
