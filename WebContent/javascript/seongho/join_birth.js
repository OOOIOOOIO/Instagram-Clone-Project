// input_disabled
var year = document.getElementById("year"); 
var next_btn = document.getElementById("next_btn"); 

year.addEventListener('change', state_birth);

function state_birth(){	
	if(year.value <= 2015){
		next_btn.disabled = false;
		next_btn.style = "pointer-events: inherit";
		next_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),1)";
	}
	else{
		next_btn.disabled = true;
		next_btn.style = "pointer-events: none";
		next_btn.style.backgroundColor = "rgba(var(--d69,0,149,246),.3)";
	}
}