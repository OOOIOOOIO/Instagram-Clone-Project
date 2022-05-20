//이미지 미리보기
const previewImage = function(f){
	var file = f.files;
	
	//확장자 체크
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
		
		//선택한 파일 초기화
		f.outerHTML = f.outerHTML;
	}
	else{
		//FileReader
		var reader = new FileReader();
		
		//파일 읽기가 완료되었을 때 실행
		reader.onload = function(rst){
			document.getElementById('pre_img').style.display = 'none';
			document.getElementById('h2').style.display = 'none';
			document.getElementById('inputfile_button').style.display = 'none';
			document.getElementById('main-img-1').src = rst.target.result;
			document.getElementById('style-img-1').src = rst.target.result;
			document.getElementById('upload-img-1').src = rst.target.result;
			document.getElementById('main-img-1').style.display = 'block';
		}
		document.getElementById('next').style.display = 'block';
		document.getElementById('btn_cut_wrap').style.display = 'block';
		//파일을 읽음
		reader.readAsDataURL(file[0]);
	}
}
const previewImage2 = function(f){
	var file = f.files;
	
	//확장자 체크
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
		
		//선택한 파일 초기화
		f.outerHTML = f.outerHTML;
	}
	else{
		//FileReader
		var reader = new FileReader();
		
		//파일 읽기가 완료되었을 때 실행
		reader.onload = function(rst){
			document.getElementById('main-img-1').style.display = 'none';
			document.getElementById('main-img-2').src = rst.target.result;
			document.getElementById('style-img-2').src = rst.target.result;
			document.getElementById('upload-img-2').src = rst.target.result;
			document.getElementById('main-img-2').style.display = 'block';
			
		}
		document.getElementById('next').style.display = 'block';
		document.getElementById('btn_cut_wrap').style.display = 'block';
		document.getElementById('btn_left').style.display = 'block';
		//파일을 읽음
		reader.readAsDataURL(file[0]);
	}
}

// 스타일 설정 페이지로 이동
const goToStylePage = function() {
	document.getElementById('wrap').style.display = 'none';
	let boardForm = document.boardForm;
	let file = boardForm.file;
	if(file == null){
		alert("파일을 첨부하세요");
		return false;
	}
	document.getElementById('style_wrap').style.display = 'block';
	document.getElementById('style-img-1').style.display = 'block';
	if(document.getElementById('main-img-2').src != "") {
		document.getElementById('btn_right_style').style.display = 'block';
	}
}

// 글 적는 페이지로 이동
const goToWritePage = function() {
	document.getElementById('style_wrap').style.display = 'none';
	document.getElementById('write_wrap').style.display = 'block';
	document.getElementById('upload-img-1').style.display = 'block';
	if(document.getElementById('main-img-2').src != "") {
		document.getElementById('btn_right_upload').style.display = 'block';
	}
}

// 글 업로드
const sendit = function(){
	let boardForm = document.boardForm;
	let file = boardForm.file;
	if(file == null){
		alert("파일을 첨부하세요");
		return false;
	}
	boardForm.submit();
}

// 뒤로가기 버튼
// 첫 페이지로 가기
const goToFirst = function() {
	document.getElementById('style_wrap').style.display = 'none';
	document.getElementById('wrap').style.display = 'block';
}

const goToSecond = function() {
	document.getElementById('write_wrap').style.display = 'none';
	document.getElementById('style_wrap').style.display = 'block';
	if(document.getElementById('boardcontents').value != ''){
		alert('작성하신 내용은 저장되지 않습니다.');
		document.getElementById('boardcontents').value = '';
	}
}

// 이미지 좌우이동
var btn_left = document.getElementById('btn_left');
var btn_right = document.getElementById('btn_right');
btn_left.addEventListener("click", function() {
	btn_right.style.display="block";
	btn_left.style.display="none";
	document.getElementById('main-img-1').style.display = "block";
	document.getElementById('main-img-2').style.display = "none";
});
btn_right.addEventListener("click", function() {
	btn_left.style.display = "block";
	btn_right.style.display = "none";
	document.getElementById('main-img-2').style.display = "block";
	document.getElementById('main-img-1').style.display = "none";
});

var btn_left_style = document.getElementById('btn_left_style');
var btn_right_style = document.getElementById('btn_right_style');
btn_left_style.addEventListener("click", function() {
	btn_right_style.style.display="block";
	btn_left_style.style.display="none";
	document.getElementById('style-img-1').style.display = "block";
	document.getElementById('style-img-2').style.display = "none";
});
btn_right_style.addEventListener("click", function() {
	btn_left_style.style.display = "block";
	btn_right_style.style.display = "none";
	document.getElementById('style-img-2').style.display = "block";
	document.getElementById('style-img-1').style.display = "none";
});

var btn_left_upload = document.getElementById('btn_left_upload');
var btn_right_upload = document.getElementById('btn_right_upload');
btn_left_upload.addEventListener("click", function() {
	btn_right_upload.style.display="block";
	btn_left_upload.style.display="none";
	document.getElementById('upload-img-1').style.display = "block";
	document.getElementById('upload-img-2').style.display = "none";
});
btn_right_upload.addEventListener("click", function() {
	btn_left_upload.style.display = "block";
	btn_right_upload.style.display = "none";
	document.getElementById('upload-img-2').style.display = "block";
	document.getElementById('upload-img-1').style.display = "none";
});

// X 버튼을 누르면 이전 페이지로 이동 
const goBack = function(){
	window.history.back();
}









