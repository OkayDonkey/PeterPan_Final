var usedCoupon = null; // 사용된 쿠폰 번호를 저장하는 변수
var pointDisplay = document.getElementById("pointDisplay");

function couponCostCal(p, no) {
    if (usedCoupon === null) { // 사용된 쿠폰이 없는 경우에만 실행
        // 총 금액
        var totalPrice = Number(document.getElementById("orderTotalCost").value);
        var totalPriceElement = document.getElementById("orderTotalCost");
        var totalCostDisplay1 = document.getElementById("cartTotalPrice1");
        var totalCostDisplay2 = document.getElementById("cartTotalPrice2");
        var pickedArea = document.getElementById("coupon" + no);
        var pickedCouponNo = document.getElementById("useCouponNo").value;

        totalPrice -= p;

        if (totalPrice <= 0) {
            totalPrice = 0;
        }

        totalPriceElement.value = totalPrice;

        totalCostDisplay2.innerText = Number(totalPrice).toLocaleString() + "원";
        pointDisplay.removeAttribute("hidden");
        pointDisplay.innerHTML = "<b><span class='float-left'>쿠폰 사용 할인 금액</span> <span class='float-right'>-" + Number(p).toLocaleString() + "원</span></b>";

        // 새로운 배경색을 원하는 값으로 설정
        var newBackgroundColor = "#4ebc643b"; // 원하는 색상을 HEX, RGB 등의 형식으로 지정하세요

        // 요소의 배경색을 변경
        pickedArea.style.backgroundColor = newBackgroundColor;

        // 사용된 쿠폰 번호를 변수에 저장
        usedCoupon = no;
		pickedCouponNo = no;
		
		console.log("사용된 쿠폰 번호: "+pickedCouponNo);
				
        document.getElementById("costCancelBtn_" + no).removeAttribute("hidden");
        document.getElementById("costBtn_" + no).setAttribute("hidden", true);
    } else {
    	alert("쿠폰은 한개만 사용 가능합니다.");
    }
}

function couponCostCancel(p, no) {
    if (usedCoupon === no) { // 취소할 쿠폰 번호가 현재 사용된 쿠폰과 일치하는 경우에만 실행
        // 총 금액
        var totalPrice = Number(document.getElementById("orderTotalCost").value);
        var totalPriceElement = document.getElementById("orderTotalCost");
        var totalCostDisplay1 = document.getElementById("cartTotalPrice1");
        var totalCostDisplay2 = document.getElementById("cartTotalPrice2");
        var pickedArea = document.getElementById("coupon" + no);

        totalPrice += p; // 쿠폰 가격 복원

        if (totalPrice <= 0) {
            totalPrice = 0;
        }

        totalPriceElement.value = totalPrice;

        totalCostDisplay2.innerText = Number(totalPrice).toLocaleString() + "원";
        pointDisplay.innerText = "";

        // 배경색 초기화
        pickedArea.style.backgroundColor = "";

        // 사용된 쿠폰 번호 초기화
        usedCoupon = null;

        document.getElementById("costCancelBtn_" + no).setAttribute("hidden", true);
        document.getElementById("costBtn_" + no).removeAttribute("hidden");
    } 
}
