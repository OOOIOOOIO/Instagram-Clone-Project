// input_disabled
var input_1 = document.getElementById("1-1"); 

var next_btn = document.getElementById("next_btn"); 

input_1.addEventListener('input', state_email);

function state_email(){
	if(input_1.value.length >= 6){
	next_btn.disabled = false;
	next_btn.style = "pointer-events: inherit";
	next_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),1)";
	}
	else{
		next_btn.style = "pointer-events: none";
		next_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),.3)";
		next_btn.disabled = true;
	}
}


// 유효성 검사
var text = document.getElementById("text");
var input_1 = document.getElementById("1-1"); 

function checkAndSend_email(){
	if(input_1.value == "111111"){
		location.href=cp+"/instagram/join/join_agreeTerms.jsp"
	}
	else{
		text.style.display = "block";
	}
}