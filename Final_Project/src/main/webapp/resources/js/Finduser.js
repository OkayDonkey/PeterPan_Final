/**
 * 
 */

$(function() {
	$(".alert-success").hide(); //span태그 영역을 숨겨라.
	$(".alert-danger").hide(); //span태그 영역을 숨겨라.

$("#FindIdBtn").on(
			"click",
			function() { //회원가입 페이지에서 입력창에서 시점이 옮겨 갔을때  호출되는 무명함수.
			
				let userName = $("#recover-id-name").val(); //signup-id의 value값을 뽑아와라.
				let userEmail = $("#recover-id-email").val(); //signup-id의 value값을 뽑아와라.

				//아이디 중복 여부 확인
				$.ajax({
					type: "post",
					url: "find_id.do",
					data: {
						paramName: userName,
						paramEmail: userEmail
					},
					datatype: "json",
					success: function(data) {
						if (data == "") { //DB에 아이디가 없을경우
							$(".alert-success").hide(); //div태그 영역을 숨겨라.
							$(".alert-danger").hide(); //div태그 영역을 숨겨라.
							
							$("#recover-id-name").val('');
							$("#recover-id-email").val('');
							
							$(".alert-danger").show();
							
						} else {
							$(".alert-success").hide(); //div태그 영역을 숨겨라.
							$(".alert-danger").hide(); //div태그 영역을 숨겨라.
							
							$("#recover-id-name").val('');
							$("#recover-id-email").val('');
							
							$("#member_id").text("");
							$(".alert-success").show();
							$("#member_id").append(data);
						}
					},
					error: function(data) {
						alert("통신오류");
					}
				});

			});

$("#FindPwdBtn").on(
			"click",
			function() { //회원가입 페이지에서 입력창에서 시점이 옮겨 갔을때  호출되는 무명함수.
			
				let userName = $("#recover-pwd-name").val(); //signup-id의 value값을 뽑아와라.
				let userEmail = $("#recover-pwd-email").val(); //signup-id의 value값을 뽑아와라.
				let userId = $("#recover-pwd-id").val(); //signup-id의 value값을 뽑아와라.

				//아이디 중복 여부 확인
				$.ajax({
					type: "post",
					url: "find_pwd.do",
					data: {
						paramName: userName,
						paramEmail: userEmail,
						paramId: userId
					},
					datatype: "json",
					success: function(data) {
						if (data == -1) { //DB에 아이디가 없을경우
							$(".alert-success").hide(); //div태그 영역을 숨겨라.
							$(".alert-danger").hide(); //div태그 영역을 숨겨라.
							
							$("#recover-pwd-name").val('');
							$("#recover-pwd-id").val('');
							$("#recover-pwd-email").val('');
							
							$(".alert-danger").show();
						} else {
							$(".alert-success").hide(); //div태그 영역을 숨겨라.
							$(".alert-danger").hide(); //div태그 영역을 숨겨라.
							
							$("#recover-pwd-name").val('');
							$("#recover-pwd-id").val('');
							$("#recover-pwd-email").val('');

							$(".alert-success").show();
						}
					},
					error: function(data) {
						alert("통신오류");
					}
				});

			});
		});
	