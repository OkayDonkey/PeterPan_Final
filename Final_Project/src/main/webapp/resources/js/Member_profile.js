$(function() {
		$('#updatebtn123').on(
				'click',
				function() {
					let password1 = $("#account-pass").val();
					let password2 = $("#account-confirm-pass").val();
					let text = "회원수정 완료";
					let text2 = "비밀번호가 일치하지 않습니다.";
					/* if (password1 !== "" || password2 !== "") {
					    if (password1 === password2) {
					        $(".toast-header").removeClass("bg-warning").removeClass("text-white"); // 기존 클래스 제거
					        $(".toast-header").addClass("bg-success").addClass("text-white"); // 클래스 추가
					        $(".font-weight-semibold").text(""); // 텍스트 초기화
					        $(".font-weight-semibold").append("success"); // 텍스트 지정
					        $("#toast-body").text(""); // 텍스트 초기화
					        $("#toast-body").append(text); // 텍스트 지정
					        $("#successPwdToast").show(); // 창띄우기
					        return false;
					    }  */{
						if (password1 != password2) {
							$(".toast-header").removeClass("bg-success")
									.removeClass("text-white"); // 기존 클래스 제거
							$(".toast-header").addClass("bg-warning")
									.addClass("text-white"); // 클래스 추가
							$(".font-weight-semibold").text(""); // 텍스트 초기화
							$(".font-weight-semibold").append("failed"); // 텍스트 지정
							$("#toast-body").text(""); // 텍스트 초기화
							$("#toast-body").append(text2); // 텍스트 지정
							$("#failPwdToast").show(); // 창띄우기
							return false;
						}
					}
				});
	});
		$(function() {
		  // 이미지 클릭 시 파일 업로드 창 실행
		  $('#Change_Profile').click(function() {
		    console.log('fileadd');
		    $("input[name='fileProfile']").click();
		  });
		
		  // 파일 선택 시 실행되는 이벤트
		  $("input[name='fileProfile']").on('change', function(e) {
		    // form 데이터 생성
		    var frm = document.getElementById('profile_file_add');
		    frm.method = 'POST';
		    frm.enctype = 'multipart/form-data';
		    var fileData = new FormData(frm);
		  });
		});
		
		var currentImage = document.getElementById("current-image");
		
		function setThumbnail(event) {
		  var reader = new FileReader();
		  reader.onload = function(event) {
		    var img = document.createElement("img");
		    img.setAttribute("src", event.target.result);
		    img.setAttribute("class", "col-lg-6");
		    var parent = currentImage.parentNode;
		    parent.replaceChild(img, currentImage); // 현재 이미지 삭제
		    document.querySelector("div#image_container").appendChild(img); // 새로운 이미지 추가
		    currentImage = img; // 현재 이미지 소스 업데이트
		  };
		  reader.readAsDataURL(event.target.files[0]);
		};


	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);

				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명ㄴ 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('post').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("addr").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("addr").value = jibunAddr;
				}
			}
		}).open();
	};