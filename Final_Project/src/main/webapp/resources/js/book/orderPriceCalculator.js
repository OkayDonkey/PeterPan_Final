var usedCoupon = null; // 사용된 쿠폰 번호를 저장하는 변수
var pointDisplay = document.getElementById("pointDisplay");

function couponCostCal(p, no) {
  if (usedCoupon === null) {
    var totalPrice = Number(document.getElementById("orderTotalCost").value);
    var totalPriceElement = document.getElementById("orderTotalCost");
    var totalCostDisplay1 = document.getElementById("cartTotalPrice1");
    var totalCostDisplay2 = document.getElementById("cartTotalPrice2");
    var pickedArea = document.getElementById("coupon" + no);
    var pickedCouponNo = document.getElementById("useCouponNo");

    totalPrice -= p;

    if (totalPrice <= 0) {
      totalPrice = 0;
    }

    totalPriceElement.value = totalPrice;

    totalCostDisplay2.innerText = Number(totalPrice).toLocaleString() + "원";
    pointDisplay.removeAttribute("hidden");
    pointDisplay.innerHTML += "<b><span class='float-left'>쿠폰 사용 할인 금액</span> <span class='float-right'>-" + Number(p).toLocaleString() + "원</span></b>";

    var newBackgroundColor = "#4ebc643b";
    pickedArea.style.backgroundColor = newBackgroundColor;

    usedCoupon = no;
    pickedCouponNo.value = no; // 값 설정

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

var pointCalExecuted = false;

function pointCal() {
  if (!pointCalExecuted) {
    pointCalExecuted = true;

    var pointD = document.getElementById("point-display");
    var memPoint = parseFloat(document.getElementById("point-display").textContent);
    var totalPrice = Number(document.getElementById("orderTotalCost").value);
    var usePoint = parseFloat(document.getElementById("usePoint").value);

    if (isNaN(usePoint) || usePoint <= 0) {
      alert("사용할 포인트는 유효한 숫자여야 합니다.");
      pointCalExecuted = false;
      return;
    }

    if (usePoint > memPoint) {
      alert("사용할 포인트는 보유 포인트보다 작아야 합니다.");
      pointCalExecuted = false;
      return;
    }

    var calPoint = memPoint - usePoint;
    var pointUsedCost = totalPrice - usePoint;

    pointD.innerText = Number(calPoint).toLocaleString();
    document.getElementById("orderTotalCost").value -= usePoint;
    document.getElementById("cartTotalPrice2").innerText = Number(pointUsedCost).toLocaleString() + "원";
    pointDisplay.removeAttribute("hidden");
    pointDisplay.innerHTML += "<b><span class='float-left'>포인트 사용 할인 금액</span> <span class='float-right'>-" + Number(usePoint).toLocaleString() + "원</span></b>";
  }
}

