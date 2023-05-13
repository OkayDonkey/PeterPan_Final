

$(function() {

	$("#signup-id")
		.on(
			"blur",
			function() { //회원가입 페이지에서 입력창에서 시점이 옮겨 갔을때  호출되는 무명함수.
				$("#signup-idchk").hide(); //span태그 영역을 숨겨라.
				let userId = $("#signup-id").val(); //signup-id의 value값을 뽑아와라.


				let idRegExp = /^[a-z0-9]{4,12}$/; //아이디 유효성 검사
				if (!idRegExp.test(userId)) {

					let warningTxt = '<font color="red">영문 소문자나 숫자 4~12자리로 입력해야합니다.</font>';
					$("#signup-idchk").text(""); //span 테그 영역 초기화.
					$("#signup-idchk").show();
					$("#signup-idchk").append(warningTxt);
					$("#signup-id").val('').focus();//span 테그 영역 초기화.
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
							$("#signup-idchk").text(""); //span 테그 영역 초기화.
							$("#signup-idchk").show();
							$("#signup-idchk").append(warningTxt);
							$("#signup-id").val('').focus();//span 테그 영역 초기화.
						} else {
							let warningTxt = '<font color="green">사용가능한 아이디입니다.</font>';
							$("#signup-idchk").text(""); //span 테그 영역 초기화.
							$("#signup-idchk").show();
							$("#signup-idchk").append(warningTxt);
						}
					},
					error: function(data) {
						alert("통신오류");
					}
				});

			});




});

function checkAll() {

	var passwordRegExp = /^[a-zA-Z0-9]{4,12}$/; //비밀번호 유효성 검사
	var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	var nameRegExp = /^[가-힣]{2,4}$/;
	var phoneRegExp = /^[0-9]{9,11}$/;
	
	
	$("#signup-pwdchk").hide(); //span태그 영역을 숨겨라.
	$("#signup-pwdconfirm-chk").hide(); //span태그 영역을 숨겨라.
	$("#signup-namechk").hide(); //span태그 영역을 숨겨라.
	$("#signup-emailchk").hide(); //span태그 영역을 숨겨라.
	$("#signup-phonechk").hide(); //span태그 영역을 숨겨라.

	if ($("#signup-id").val() == "") {
		
		let warningTxt = '<font color="red">아이디를 작성해주세요.</font>';
		$("#signup-idchk").text(""); //span 태그 영역 초기화.
		$("#signup-idchk").show();
		$("#signup-idchk").append(warningTxt);
		$("#signup-id").val('').focus();//input 태그 영역 초기화.
		
		return false;
	}
	if ($("#signup-password").val() == "") {
		
		let warningTxt = '<font color="red">비밀번호를 작성해주세요.</font>';
		$("#signup-pwdchk").text(""); //span 태그 영역 초기화.
		$("#signup-pwdchk").show();
		$("#signup-pwdchk").append(warningTxt);
		$("#signup-password").val('').focus();//input 태그 영역 초기화.

		return false;
	}
	if (!passwordRegExp.test($("#signup-password").val())) {
		let warningTxt = '<font color="red">영문 대소문자와 숫자 4~12자리로 입력해야합니다.</font>';
		$("#signup-pwdchk").text(""); //span 태그 영역 초기화.
		$("#signup-pwdchk").show();
		$("#signup-pwdchk").append(warningTxt);
		$("#signup-password").val('').focus();//input 영역 초기화.
		return false;
	}
	if ($("#signup-password-confirm").val() == "") {
		
		let warningTxt = '<font color="red">비밀번호 확인을 작성해주세요.</font>';

		$("#signup-pwdconfirm-chk").text(""); //span 태그 영역 초기화.
		$("#signup-pwdconfirm-chk").show();
		$("#signup-pwdconfirm-chk").append(warningTxt);
		$("#signup-password-confirm").val('').focus();//input 태그 영역 초기화.		
		
		return false;
	}
	if ($("#signup-password").val() != $("#signup-password-confirm").val()) {

		let warningTxt = '<font color="red">비밀번호가 같지 않습니다.</font>';

		$("#signup-pwdconfirm-chk").text(""); //span 태그 영역 초기화.
		$("#signup-pwdconfirm-chk").show();
		$("#signup-pwdconfirm-chk").append(warningTxt);
		$("#signup-password-confirm").val('').focus();//input 태그 영역 초기화.	
				
		return false;
	}
	if ($("#signup-name").val() == "") {

		let warningTxt = '<font color="red">이름을 작성해주세요.</font>';

		$("#signup-namechk").text(""); //span 태그 영역 초기화.
		$("#signup-namechk").show();
		$("#signup-namechk").append(warningTxt);
		$("#signup-name").val('').focus();//input 태그 영역 초기화.		

		return false;
	}
	if (!nameRegExp.test($("#signup-name").val())) {

		let warningTxt = '<font color="red">이름은 한글만 작성이 가능합니다.</font>';

		$("#signup-namechk").text(""); //span 태그 영역 초기화.
		$("#signup-namechk").show();
		$("#signup-namechk").append(warningTxt);
		$("#signup-name").val('').focus();//input 태그 영역 초기화.		
		
		return false;
	}
	
	if ($("#signup-email").val() == "") {
		
		let warningTxt = '<font color="red">이메일을 작성해주세요.</font>';

		$("#signup-emailchk").text(""); //span 태그 영역 초기화.
		$("#signup-emailchk").show();
		$("#signup-emailchk").append(warningTxt);
		$("#signup-email").val('').focus();//input 태그 영역 초기화.		
		
		return false;
	}
	if (!emailRegExp.test($("#signup-email").val())) {
		
		let warningTxt = '<font color="red">이메일 형식이 올바르지 않습니다.</font>';

		$("#signup-emailchk").text(""); //span 태그 영역 초기화.
		$("#signup-emailchk").show();
		$("#signup-emailchk").append(warningTxt);
		$("#signup-email").val('').focus();//input 태그 영역 초기화.
		
		return false;
	}
	if ($("#signup-phone").val() == "") {
		
		let warningTxt = '<font color="red">연락처를 작성해주세요.</font>';

		$("#signup-phonechk").text(""); //span 태그 영역 초기화.
		$("#signup-phonechk").show();
		$("#signup-phonechk").append(warningTxt);
		$("#signup-phone").val('').focus();//input 태그 영역 초기화.		
		
		return false;
	}
	if (!phoneRegExp.test($("#signup-phone").val())) {
		
		let warningTxt = '<font color="red">연락처 형식이 올바르지 않습니다.</font>';

		$("#signup-phonechk").text(""); //span 태그 영역 초기화.
		$("#signup-phonechk").show();
		$("#signup-phonechk").append(warningTxt);
		$("#signup-phone").val('').focus();//input 태그 영역 초기화.	
		
		return false;
	}
	$('#signup-form').submit();
}

