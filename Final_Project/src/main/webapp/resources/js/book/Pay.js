const IMP = window.IMP; // 생략 가능
IMP.init('imp12711251'); // 예: imp00000000a

function requestPay() {
		
		console.log("call pay");
		
    IMP.request_pay({
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: "ORD20180131-0000011",   // 주문번호
      name: "노르웨이 회전 의자",
      amount: 64900,                         // 숫자 타입
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
    }, function (rsp) { // callback
     	console.log(rsp);
      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
    });
  }
  
  
 // 모든 payBox 요소를 가져옴
var payBoxes = document.getElementsByClassName("payBox");

// payBox 요소를 클릭했을 때 실행되는 함수
function handleClick(event) {
    // 클릭한 요소의 테두리 속성 변경
    event.target.style.border = "2px solid #5055b1";
    event.target.style.backgroundColor = "#eaeaea";

    // 다른 payBox 요소들의 테두리 속성 초기화
    for (var i = 0; i < payBoxes.length; i++) {
        if (payBoxes[i] !== event.target) {
            payBoxes[i].style.border = "1px solid #ccc";
            payBoxes[i].style.backgroundColor = "white";
        }
    }

    // 클릭한 payBox 요소 안의 img 태그의 alt 속성 값 추출
    var altValue = event.target.querySelector("img").getAttribute("alt");
    console.log("Alt Value: " + altValue);
}

// 각 payBox 요소에 클릭 이벤트 핸들러 등록
for (var i = 0; i < payBoxes.length; i++) {
    payBoxes[i].addEventListener("click", handleClick);
}
