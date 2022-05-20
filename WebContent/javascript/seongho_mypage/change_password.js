//input_disabled

var old_pw = document.getElementById("old_pw"); 
var new_pw = document.getElementById("new_pw"); 
var new_pw_confirm = document.getElementById("new_pw_confirm"); 
var change_btn = document.getElementById("change_btn"); 

old_pw.addEventListener('input', state_change);
new_pw.addEventListener('input', state_change);
new_pw_confirm.addEventListener('input', state_change);

function state_change(){		
	if(old_pw.value.length >= 1 && new_pw.value.length >= 1 && new_pw_confirm.value.length >= 1){
		change_btn.disabled = false;
		change_btn.style = "pointer-events: inherit";
		change_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),1)";
	}
	else{
		change_btn.style = "pointer-events: none";
		change_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),.3)";
		change_btn.disabled = true;
	}
}


// CheckPwOkAction Ajax로 검사해서 action= UserChangePasswordOkAction, submit 하는 곳
//유효성 검사	
var change_pw = document.change_pw;
var old_pw = change_pw.old_pw;
var new_pw = change_pw.new_pw;
var new_pw_confirm = change_pw.new_pw_confirm;



function check(){
	let	old_pw_value = old_pw.value;
	let	new_pw_value = new_pw.value;
	let	new_pw_confirm_value = new_pw_confirm.value;
	
	let xhr = new XMLHttpRequest();
	//통신할 곳과의 연결 통로 열기
	xhr.open("POST",cp+"/user/CheckPwOk.us",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); // 헤더 확인
	//xhr의 상태가 변할 때 호출될 함수 미리 설정
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				let txt = xhr.responseText;
				txt = txt.trim();
				// 통과
				if(txt == "O"){
					change_pw.action=cp+"/user/UserChangePasswordOk.us";
					change_pw.submit();
					window.alert("비밀번호 변경 성공");
				}
				//실패
				else if(txt == "old_pw"){
					// 밑에 검은 창 띄워줌 일단은 alert로
					alert("이전 비밀번호 틀림");

				}
				else if(txt == "new_pw"){
					// 밑에 검은 창 띄워줌
					alert("새 비밀번호 틀림");
				}
			}
		}
	}
	//통신하기
	xhr.send("old_pw="+old_pw_value+"&new_pw="+new_pw_value+"&new_pw_confirm="+new_pw_confirm_value);
	

}
