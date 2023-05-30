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


function newAddr() {
  new daum.Postcode({
    oncomplete: function (data) {
      console.log(data);

      var roadAddr = data.roadAddress; // 도로명 주소 변수
      var jibunAddr = data.jibunAddress; // 지번 주소 변수
      var post = document.getElementById("post");
	  var addr = document.getElementById("addr");
	  var detailAddr = document.getElementById("detailAddr");
	  var hiddenAddr = document.getElementById("addrHidden");
	  var box1 = document.getElementById("deliverInfo_left");
	  var box2 = document.getElementById("deliverInfo_right");
	  
	  var newHeight = 300; // 새로운 높이 값(px)을 원하는 대로 설정하세요
		
		
	  
      post.value = data.zonecode;
      if (roadAddr !== "") {
      
     	 // box1과 box2의 높이를 설정
		box1.style.height = newHeight + "px";
		box2.style.height = newHeight + "px";
		
      	hiddenAddr.removeAttribute("hidden");
        addr.value = roadAddr;
        
      } else if (jibunAddr !== "") {
      
       // box1과 box2의 높이를 설정
		box1.style.height = newHeight + "px";
		box2.style.height = newHeight + "px";
		
  		hiddenAddr.removeAttribute("hidden");
        detailAddr.value = jibunAddr;
        
      }
    },
  }).open();
}
