var usedCoupons = []; // 사용된 쿠폰 번호를 저장하는 배열

function couponCostCal(p, no) {
    if (usedCoupons.indexOf(no) === -1) { // 이미 사용된 쿠폰 번호인지 확인
        // 총 금액
        var totalPrice = Number(document.getElementById("orderTotalCost").value);
        var totalPriceElement = document.getElementById("orderTotalCost");
        var totalCostDisplay1 = document.getElementById("cartTotalPrice1");
        var totalCostDisplay2 = document.getElementById("cartTotalPrice2");
        var pickedArea = document.getElementById("coupon" + no);

        totalPrice -= p;

        if (totalPrice <= 0) {
            totalPrice = 0;
        }

        totalPriceElement.value = totalPrice;

        totalCostDisplay1.innerText = Number(totalPrice).toLocaleString() + "원";
        totalCostDisplay2.innerText = Number(totalPrice).toLocaleString() + "원";

        // 새로운 배경색을 원하는 값으로 설정
        var newBackgroundColor = "#4ebc643b"; // 원하는 색상을 HEX, RGB 등의 형식으로 지정하세요

        // 요소의 배경색을 변경
        pickedArea.style.backgroundColor = newBackgroundColor;

        // 사용된 쿠폰 번호를 배열에 추가
        usedCoupons.push(no);

        document.getElementById("costCancelBtn_" + no).removeAttribute("hidden");
        document.getElementById("costBtn_" + no).setAttribute("hidden", true);
    }
}

function couponCostCancel(p, no) {
    var index = usedCoupons.indexOf(no); // 사용된 쿠폰 번호의 인덱스 확인

    if (index !== -1) { // 사용된 쿠폰 번호인 경우
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

        totalCostDisplay1.innerText = Number(totalPrice).toLocaleString() + "원";
        totalCostDisplay2.innerText = Number(totalPrice).toLocaleString() + "원";

        // 배경색 초기화
        pickedArea.style.backgroundColor = "";

        // 사용된 쿠폰 번호를 배열에서 제거
        usedCoupons.splice(index, 1);

        document.getElementById("costCancelBtn_" + no).setAttribute("hidden", true);
        document.getElementById("costBtn_" + no).removeAttribute("hidden");
    }
}
