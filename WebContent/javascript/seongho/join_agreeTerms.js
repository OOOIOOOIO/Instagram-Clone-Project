// 전체 선택

function selectAll(selectAll)  {
  const checkboxes = document.getElementsByName('box');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
  
  
}

var next_btn = document.getElementById("next_btn");
var all = document.getElementById('1');
var all_val = all.getAttribute("checked")

all.addEventListener('click', checkTerms);

function checkTerms(){
	if($('#1').is(':checked')){
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






