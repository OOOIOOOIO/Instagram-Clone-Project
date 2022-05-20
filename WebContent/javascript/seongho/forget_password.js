// text_up
const input1 = document.getElementById('1-1');

input1.addEventListener('input', updateValue1);


function updateValue1(e) {

	document.getElementById("1").style = "transform: scale(.83333) translateY(-10px)";
	document.getElementById("1-1").style = "font-size: 12px"; "padding: 14px 0 2px 8px!important";
	document.getElementById("1-1").style = "padding: 14px 0 2px 8px!important";
}

// input_disabled
var input_1 = document.getElementById("1-1");

var send_btn = document.getElementById("send_btn"); 

input_1.addEventListener('input', state_forgetPW);

function state_forgetPW(){	
	if(input_1.value.length == ""){
		send_btn.style = "pointer-events: none";
		send_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),.3)";
		send_btn.disabled = true;
	}
	else{
		send_btn.disabled = false;
		send_btn.style = "pointer-events: inherit";
		send_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),1)";
	}
}