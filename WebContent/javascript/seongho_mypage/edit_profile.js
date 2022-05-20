

//input_disabled
/*var pepName = document.getElementById("pepName"); 
var pepUsername = document.getElementById("pepUsername"); 
var pepWebsite = document.getElementById("pepWebsite");
var pepIntro = document.getElementById("pepIntro");
var pepEmail = document.getElementById("pepEmail");
var pepPhonenumber = document.getElementById("pepPhonenumber");
var pepGender = document.getElementById("pepGender");

var submit_btn = document.getElementById("submit_btn"); 

pepName.addEventListener('input', state_change);
pepUsername.addEventListener('input', state_change);
pepWebsite.addEventListener('input', state_change);
pepIntro.addEventListener('input', state_change);
pepEmail.addEventListener('input', state_change);
pepPhonenumber.addEventListener('input', state_change);
pepGender.addEventListener('input', state_change);

function state_change(){		
	submit_btn.disabled = false;
	submit_btn.style = "pointer-events: inherit";
	submit_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),1)";
}
*/


//유효성 검사 및 db 한번에	
var userInfo = document.userInfo;
var pepName2 = userInfo.pepName;
var pepUsername2 = userInfo.pepUsername;
var pepEmail2 = userInfo.pepEmail;
var pepPhonenumber2 = userInfo.pepPhonenumber;
var pepGender2 = userInfo.pepGender;



function check(){
	var pepName2_value = pepName.value;
	var pepUsername2_value = pepUsername.value;
	var pepEmail2_value = pepEmail.value;
	var pepPhonenumber2_value = pepPhonenumber.value;
	var pepGender2_value = pepGender.value;
	
	let xhr = new XMLHttpRequest();
	//통신할 곳과의 연결 통로 열기
	xhr.open("POST",cp+"/user/CheckEditOk.us",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); // 헤더 확인
	//xhr의 상태가 변할 때 호출될 함수 미리 설정
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				let txt = xhr.responseText;
				txt = txt.trim();
				// 통과
				if(txt == "O"){
					userInfo.action=cp+"/user/UserEditProfile.us";
					userInfo.submit();
					alert("변경 성공")
				}
				//실패
				else if(txt == "id"){
					// 밑에 검은 창 띄워줌 일단은 alert로
					alert("id 중복.");

				}
				else if(txt == "phone_a"){
					// 밑에 검은 창 띄워줌
					alert("옳바른 핸드폰 번호 써주세요.");
				}
				else if(txt == "phone_b"){
					// 밑에 검은 창 띄워줌 일단은 alert로
					alert("핸드폰 번호 중복");
					
				}
				else if(txt == "email_a"){
					// 밑에 검은 창 띄워줌
					alert("옳바른 이메일 써주세요.");
				}
				else if(txt == "email_b"){
					// 밑에 검은 창 띄워줌
					alert("이메일 중복");
				}
			}
		}
	}
	//통신하기
	xhr.send("pepName="+pepName2_value+"&pepUsername="+pepUsername2_value+"&pepEmail="+pepEmail2_value+"&pepPhonenumber="+pepPhonenumber2_value+"&pepGender="+pepGender2_value);
	

}
