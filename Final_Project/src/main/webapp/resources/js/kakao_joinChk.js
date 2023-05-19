

$(function() {

	let userId = "";
	$("#reg-id")
		.on(
			"blur",
			function() { //회원가입 페이지에서 입력창에서 시점이 옮겨 갔을때  호출되는 무명함수.
				$("#reg-idchk").hide(); //span태그 영역을 숨겨라.
				userId = $("#reg-id").val(); //reg-id의 value값을 뽑아와라.


				let idRegExp = /^[a-z0-9]{4,12}$/; //아이디 유효성 검사
				if (!idRegExp.test(userId)) {

					let warningTxt = '<font color="red">영문 소문자나 숫자 4~12자리로 입력해야합니다.</font>';
					$("#reg-idchk").text(""); //span 테그 영역 초기화.
					$("#reg-idchk").show();
					$("#reg-idchk").append(warningTxt);
					$("#reg-id").val('').focus();//span 테그 영역 초기화.
					return false;

				}
				//아이디 중복 여부 확인
				$.ajax({
					type: "post",
					url: "member_join_chk.do",
					data: {
						paramId: userId
					},
					datatype: "json",
					success: function(data) {
						if (data == -1) { //DB에 아이디 존재하는 경우(중복)
							let warningTxt = '<font color="red">중복 아이디 입니다.</font>';
							$("#reg-idchk").text(""); //span 테그 영역 초기화.
							$("#reg-idchk").show();
							$("#reg-idchk")
								.append(warningTxt);
							$("#reg-id").val('').focus();//span 테그 영역 초기화.
						} else {
							let warningTxt = '<font color="green">사용가능한 아이디입니다.</font>';
							$("#reg-idchk").text(""); //span 테그 영역 초기화.
							$("#reg-idchk").show();
							$("#reg-idchk").append(warningTxt);
						}
					},
					error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});

			});
});



function checkAll() {

	var passwordRegExp = /^[a-zA-Z0-9]{4,12}$/; //비밀번호 유효성 검사
	var phoneRegExp = /^[0-9]{9,11}$/;
	var storeRegExp = /^[0-9]{10,10}$/;
    const checkbox = document.querySelector('#is-company');
	
	
	$("#reg-pwdchk").hide(); //span태그 영역을 숨겨라.
	$("#reg-pwdconfirm-chk").hide(); //span태그 영역을 숨겨라.
	$("#reg-namechk").hide(); //span태그 영역을 숨겨라.
	$("#reg-emailchk").hide(); //span태그 영역을 숨겨라.
	$("#reg-phonechk").hide(); //span태그 영역을 숨겨라.
	$("#reg-storechk").hide(); //span태그 영역을 숨겨라.

	if ($("#reg-id").val() == "") {
		
		let warningTxt = '<font color="red">아이디를 작성해주세요.</font>';
		$("#reg-idchk").text(""); //span 태그 영역 초기화.
		$("#reg-idchk").show();
		$("#reg-idchk").append(warningTxt);
		$("#reg-id").val('').focus();//input 태그 영역 초기화.
		
		return false;
	}
	if ($("#reg-phone").val() == "") {
		
		let warningTxt = '<font color="red">연락처를 작성해주세요.</font>';

		$("#reg-phonechk").text(""); //span 태그 영역 초기화.
		$("#reg-phonechk").show();
		$("#reg-phonechk").append(warningTxt);
		$("#reg-phone").val('').focus();//input 태그 영역 초기화.		
		
		return false;
	}
	if (!phoneRegExp.test($("#reg-phone").val())) {
		
		let warningTxt = '<font color="red">연락처 형식이 올바르지 않습니다.</font>';

		$("#reg-phonechk").text(""); //span 태그 영역 초기화.
		$("#reg-phonechk").show();
		$("#reg-phonechk").append(warningTxt);
		$("#reg-phone").val('').focus();//input 태그 영역 초기화.	
		
		return false;
	}
	if ($("#reg-password").val() == "") {
		
		let warningTxt = '<font color="red">비밀번호를 작성해주세요.</font>';
		$("#reg-pwdchk").text(""); //span 태그 영역 초기화.
		$("#reg-pwdchk").show();
		$("#reg-pwdchk").append(warningTxt);
		$("#reg-password").val('').focus();//input 태그 영역 초기화.

		return false;
	}
	if (!passwordRegExp.test($("#reg-password").val())) {
		let warningTxt = '<font color="red">영문 대소문자와 숫자 4~12자리로 입력해야합니다.</font>';
		$("#reg-pwdchk").text(""); //span 태그 영역 초기화.
		$("#reg-pwdchk").show();
		$("#reg-pwdchk").append(warningTxt);
		$("#reg-password").val('').focus();//input 영역 초기화.
		return false;
	}

	if ($("#reg-password-confirm").val() == "") {
		
		let warningTxt = '<font color="red">비밀번호 확인을 작성해주세요.</font>';

		$("#reg-pwdconfirm-chk").text(""); //span 태그 영역 초기화.
		$("#reg-pwdconfirm-chk").show();
		$("#reg-pwdconfirm-chk").append(warningTxt);
		$("#reg-password-confirm").val('').focus();//input 태그 영역 초기화.		
		
		return false;
	}
	if ($("#reg-password").val() != $("#reg-password-confirm").val()) {

		let warningTxt = '<font color="red">비밀번호가 같지 않습니다.</font>';

		$("#reg-pwdconfirm-chk").text(""); //span 태그 영역 초기화.
		$("#reg-pwdconfirm-chk").show();
		$("#reg-pwdconfirm-chk").append(warningTxt);
		$("#reg-password-confirm").val('').focus();//input 태그 영역 초기화.	
				
		return false;
	}
	
	if(checkbox.checked){
		
		if ($("#reg-storenum").val() == "") {
		
			let warningTxt = '<font color="red">사업자 번호를 작성해주세요.</font>';
			$("#reg-storechk").text(""); //span 태그 영역 초기화.
			$("#reg-storechk").show();
			$("#reg-storechk").append(warningTxt);
			$("#reg-storenum").val('').focus();//input 태그 영역 초기화.

		return false;
		
		if (!storeRegExp.test($("#reg-storenum").val())) {
			let warningTxt = '<font color="red">숫자 10자리를 입력해야합니다.</font>';
			$("#reg-storechk").text(""); //span 태그 영역 초기화.
			$("#reg-storechk").show();
			$("#reg-storechk").append(warningTxt);
			$("#reg-storenum").val('').focus();//input 영역 초기화.
			
			return false;
		}
		
	}else{
	
	}
	}
		
	
	$('#reg-form').submit();
}

