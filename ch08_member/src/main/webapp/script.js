
function inputIdChk(){
	frm.idBtnCheck.value = "idUncheck";
}

function idCheck(id){
	if(id == ""){
		alert("아이디를 입력하세요");
		frm.id.focus();
		return;
	}
	frm.idBtnCheck.value = "idCheck";
	url = "IDCheck.jsp?id=" + id;
	window.open(url, "IDCheck", "width=300, height=150");
}

function inputCheck(){
	if(frm.idBtnCheck.value != "idCheck")
	{
		alert("아이디 중복 버튼을 눌러주세요.")
		return;
	}
	if(frm.pwd.value == ""){
		alert("비밀번호를 입력하세요.");
		frm.pwd.focus();
		return;
	}
	if(frm.pwd.value != frm.repwd.value){
		alert("비밀번호가 같지 않습니다.")
		frm.repwd.focus();
		return;
	}
	if(frm.name.value == ""){
		alert("이름을 입력하세요.");
		frm.pwd.focus();
		return;
	}
	frm.submit();
}