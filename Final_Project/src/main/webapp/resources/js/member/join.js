//f는 form 태그 이름을 작성한 것으로 
function check() {
  
	if (f.memberId.value == "") {
		alert("아이디를 입력하세요");
		f.memberId.focus();
		return false;
	}
      
	if (f.memberPwd.value == "") {
		alert("비밀번호를 입력하세요");
		f.memberPwd.focus();
		return false;
	}
      
    if (f.memberCheckPwd.value == "") {
      	alert("비밀번호 확인을 입력하세요");
      	f.memberCheckPwd.focus();
      	return false;
    } 
      
    if (f.memberName.value == "") {
		alert("이름를 입력하세요");
		f.memberName.focus();
		return false;
	}
      
	if (isNaN(f.memberPhone.value)) {
		alert("연락처는 숫자만 입력이 가능합니다");
		f.memberPhone.focus();
		return false;
	}
      
	if (f.memberPhone.value == "") {
		alert("연락처를 입력하세요");
		f.memberPhone.focus();
		return false;
	}
      
	if (f.memberEmail.value == "") {
		alert("이메일을 입력하세요");
		f.memberEmail.focus();
		return false;
	}
      
	if (f.memberBirth.value == "") {
		alert("생년월일을 입력하세요");
		f.memberBirth.focus();
		return false;
	}
  
	if (isNaN(f.memberBirth.value)) {
		alert("나이는 숫자만 입력이 가능합니다");
		f.memberBirth.focus();
		return false;
	}
  
	if (f.memberGender.value == "") {
		alert("성별를 선택해주세요");
		f.memberBirth.focus();
		return false;
	}
  
	if (f.addrPost.value == "") {
		alert("주소를 입력해주세요.");
		f.addrPost.focus();
		return false;
	}
      
	if (f.addrMain.value == "") {
		alert("주소를 입력해주세요.");
		f.addrMain.focus();
		return false;
	}
      
	if (f.addrDetail.value == "") {
		alert("주소를 입력해주세요.");
		f.addrDetail.focus();
		return false;
	}
}