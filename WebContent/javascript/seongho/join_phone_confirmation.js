// text_up
var input1 = document.getElementById('1-1');

input1.addEventListener('input', updateValue1);

function updateValue1(e) {

	document.getElementById("1").style = "transform: scale(.83333) translateY(-10px)";
	document.getElementById("1-1").style = "font-size: 12px"; "padding: 14px 0 2px 8px!important";
	document.getElementById("1-1").style = "padding: 14px 0 2px 8px!important";
}

// only_number
$("#1-1").keyup(function(event){
	var inputVal = $(this).val();
	$(this).val(inputVal.replace(/[^0-9]/gi,''));
});

// 유효성 검사
var text = document.getElementById("text");
var input_1 = document.getElementById("1-1"); 

function checkAndSend_phone(){
	if(input_1.value == 111111){
		location.href=cp+"/instagram/join/join_agreeTerms.jsp"
	}
	else{
		text.style.display = "block";
	}
}

	
function resend(){
	"핸드폰으로 코드 다시 보내주기"
}