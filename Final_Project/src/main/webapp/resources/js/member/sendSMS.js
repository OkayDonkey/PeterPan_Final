// 클릭하면 넣은 번호로 인증번호 보내기
function sendPhone() {
  var phoneNumber = document.getElementById("memberPhone").value;

  $.ajax({
    type: "POST",
    url: "send.go",
    data: { memberPhone: phoneNumber },
    success: function (response) {

      if(response == 1) {
        alert("인증번호가 발송되었습니다.");
      }else {
        alert("인증번호 발송이 실패하였습니다.");
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("인증번호 발송이 실패하였습니다.");
    },
  });
}

