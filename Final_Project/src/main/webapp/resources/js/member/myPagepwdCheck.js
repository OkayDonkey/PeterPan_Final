function checkPassword() {
  var passwordInput = document.getElementById("pwdCheck");
  var password = passwordInput.value;

  $.ajax({
    type: "GET",
    url: "mypage_pwd_same_check.go",
    dataType: "text",
    data: { password: password },
    success: function (response) {
      if (response == "1") {
        location.href = "member_info_modify.go";
      } else {
        // 비밀번호 확인 실패
        alert("비밀번호가 일치하지 않습니다.");
        return;
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.log("서버 요청 중 에러가 발생했습니다.");
      console.log("에러 내용:", errorThrown);
    },
  });

}
