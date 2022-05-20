// text_up
const input1 = document.getElementById('1-1');

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