function kakaoLogin() {
  $.ajax({
    url: "kakao_login.go",
    type: "get",
    async: false,
    dataType: "text",
    success: function (res) {
      location.href = res;
    },
  });
}
