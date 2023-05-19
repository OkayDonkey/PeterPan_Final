function findAddr() {
  new daum.Postcode({
    oncomplete: function (data) {
      console.log(data);

      var roadAddr = data.roadAddress; // 도로명 주소 변수
      var jibunAddr = data.jibunAddress; // 지번 주소 변수

      document.getElementById("post").value = data.zonecode;
      if (roadAddr !== "") {
        document.getElementById("addr").value = roadAddr;
      } else if (jibunAddr !== "") {
        document.getElementById("addr").value = jibunAddr;
      }
    },
  }).open();
}
