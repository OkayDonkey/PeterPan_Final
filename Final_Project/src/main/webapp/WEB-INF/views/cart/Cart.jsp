<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	const path = "<%= request.getContextPath()%>/";
</script> 
<title>Insert title here</title>

<link rel="stylesheet" type ="text/css" href ="resources/css/main/main.css">
</head>
<body>
<c:set var="session" value="${session }" /> 
<c:set var="list" value="${cList }" />
<c:set var ="cartTotalPrice" value="0" />
<input type="hidden" id="memberId" value="${session.memberId }">


<jsp:include page="../top/top.jsp" /> 



<div class="container align-content-center" style="min-width:1250px; z-index: 101;"><!-- 가로폭 컨테이너 -->
	<div class="row justify-content-sm-between" style=" padding:10px;" ><!-- Flex Row 컨테이너 -->
		<div  class="detail_info_main mb-5"><!-- 메인 좌측 컨테이너 -->

			<h3 class="mb-4">주문결제(${list.size()})</h3>
			<div>
				<div class="border-y-bold py-3"><!-- top -->
					피터팬 도서 장바구니
				</div>
				<div id="cartItems">
				<c:forEach  items="${list }" var="dto" >
				<c:if test="${!empty list }">
					<c:set var="totalprice" value="${dto.bookPrice * dto.cartCount}" /> <!-- total price 정의  -->
					<c:set var ="cartTotalPrice" value="${cartTotalPrice + totalprice }" />
					
					<div class="column border_bottom_gray"   id="cartItems"><!-- bottom -->
						<div class="row ailgn-content-center pl-4 ">
						<div class="row py-3">
							<div class="px-2 my-2">
								<img width="100" alt="${ dto.bookCover}" src="${ dto.bookCover}"  style="border-radius: 0;">
							</div>
							<div class="px-2 my-2 bookCartWidth" style="width: 150px;">
									<div class="text-left mb-2"  style="font-weight: 600; ">
									<a style="color:black; " href="${path }bookDetail.go?bookNo=${ dto.bookNo}">${ dto.bookName}</a> 
									<span><input type="button" class="xIcon deleteBtn"
					 						onclick="if(confirm('정말로 삭제하시겠습니까??'))
					 								{location.href='cartDelete.go?cartNo=${dto.cartNo}'}else{retrun}"></span></div>
									<div class="text-left mb-2" style="font-size: 1em;  font-weight: 700;  ">
									<span style="color: #4dac27; font-size: 0.9em; font-weight: 600;  ">10%</span>
									<fmt:formatNumber>${ dto.bookPrice - ( dto.bookPrice * 0.1)}</fmt:formatNumber>원
									<span class="strikeNum"><fmt:formatNumber>${ dto.bookPrice}</fmt:formatNumber>원</span>
									</div>
							</div>
						</div>
						<div class="flex_center_center border-x-light">
							<span class="mb-2 bold" id="totalCostDisplay${ dto.bookNo}">
								<fmt:formatNumber> ${totalprice - ( totalprice * 0.1 ) } </fmt:formatNumber>원
							</span>
							<div class="RoundBox_s bold">
								<div>
									<button id="decrementBtn${ dto.bookNo}" class="decrementBtn" 
									onclick="costMinusCalculator(${ dto.bookNo},${ dto.bookPrice},${dto.cartCount });">-</button>
								</div>
								<div id="numberDisplay${ dto.bookNo}">${ dto.cartCount}</div>
								<div>
									<button id="incrementBtn${ dto.bookNo}" class="incrementBtn"
									onclick="costPlusCalculator(${ dto.bookNo},${ dto.bookPrice},${dto.cartCount });">+</button>
								</div>
							</div>
						</div>
						<div class="bold flex_center_center p-3">
							<div class="smallTextBoxBlue mb-2" style="width: fit-content;">택배배송</div>
							<div class="smallTextGrayNone">배송지 등록하기 ></div>
						</div>
						</div>
					</div>
				</c:if>
				</c:forEach>
				<c:if test="${empty list }">
					<div class="flex_center_center p-5 mt-5">
					<img width="40" src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/ico_nodata@2x.png">
					<br>
					<b> 장바구니에 담은 상품이 없습니다 </b>
					</div>
				</c:if>
				</div>
				
			</div>
			<img src="resources/img/payBar.png" class="my-5">
			<div class="flex_column">
				<div class="container">
					<button class="FAQ_Btn mt-5" onclick="location.href='boardPage.go'">주문/결제 FAQ</button>
				</div>
				<div class="borderRoundGray_bg mt-3">
					<h6>장바구니 유의사항</h6>
					<br>
					<p>ㆍ&nbsp;택배 배송일정은 기본배송지 기준으로 예상일이 노출됩니다.</p>
					<p>ㆍ&nbsp;상품별 배송일정이 서로 다를시 가장 늦은 일정의 상품 기준으로 모두 함께 배송됩니다.</p>
					<p>ㆍ&nbsp;배송지 수정시 예상일이 변경 될 수 있으며, 주문서에서 배송일정을 꼭 확인하시기 바랍니다.</p>
					<p>ㆍ&nbsp;바로드림의 수령가능일은 나의 기본매장 기준으로 노출됩니다.</p>
					<p>ㆍ&nbsp;쿠폰, 통합포인트, 교환권 사용시 적립예정포인트가 변동 될 수 있습니다.</p>
				</div>
			</div>
		</div><!-- 메인 좌측 컨테이너 -->
		
		<div class="detail_info_side"><!-- 메인 우측 컨테이너 -->
		<div class="flex-align-items-center Fixed">
			<span class="greenCircle">1</span><span class="ml-2 mr-3 bold-font">장바구니</span>
			<span class="grayCircle">2</span><span class="ml-2 mr-3">주문/결제</span>
			<span class="grayCircle">3</span><span class="ml-2">주문완료</span>
		</div>
			<div class="borderRoundGray my-4 Fixed p-4" style="color:black !important;  border-color: lightgray;">
				<div>
					<div class="mb-3"><b><span class="text-left" >상품금액</span><span class="float-right" id="cartTotalPrice1">
							<fmt:formatNumber>${ cartTotalPrice - (cartTotalPrice * 0.1 )}</fmt:formatNumber>원</span></b></div>
					<div class="pb-3 mb-3 border_bottom_gray"><span class="text-left">배송비</span>
					<img style="width:18px" id="drvInfoIco" src="resources/img/infoIco.png" 
					onclick="togglePopup('popupDrvInfo', 'drvInfoIco', 'resources/img/infoIco.png', 'resources/img/infoIco_active.png')">
					<span class="float-right">
							<c:if test="${ cartTotalPrice > 15000}">
								0원
							</c:if>
							<c:if test="${ cartTotalPrice < 15000}">
								4,000원
							</c:if>
					</span></div>
					
<!-- 팝업 -->
	<div id="popupDrvInfo" hidden 
		style="position: absolute; background-color: white; border: 1px solid gray;
				width:350px; border-radius: 0.5em; padding:20px; right: 0px;
				box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3); color:black !important;">
		<p style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:black;">국내도서/외국도서</p>
		<p style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px;">
			도서만 15,000원 이상 구매 시 무료배송 
		</p>
		<p style="font-size: 12px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px;">
			* 15,000원 미만 시 2,500원 배송비 부과
		</p>
	<div style="margin-top: 20px;">
		<p style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; ">해외주문 서양도서/해외주문 일본도서</p>
		<p style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px;">
			각각 구매하거나 함께 15,000원 이상 구매 시 무료배송
		</p>
		<p style="font-size: 12px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px;">
			* 15,000원 미만 시 2,500원 배송비 부과
		</p>
	</div>
</div>
<!-- 팝업 End-->					
	<!-- 팝업 -->		
			<div id="popupPoint" hidden 
					style="position: absolute; background-color: white; border: 1px solid gray;
							width:350px; border-radius: 0.5em; margin-top:75px; padding:20px; right: 0px;
							box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3); ">
				<div style="border-bottom: 1px solid #eaeaea;">
					<p style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#2c2c2c">기본적립</p>
					<p style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">
						<span>5% 적립</span> 
						<span style="float: right;"><fmt:formatNumber>${totalprice * 0.05 }</fmt:formatNumber>P</span> 
					</p>
				</div>
					<p style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin: 10px 0 6px 0; color:#2c2c2c"> 
						<span>추가적립</span> 
					</p>
				<div >
					<ul style="padding-left: 20px;">
						<li>
						<span style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">5만원 이상 구매 시 추가</span> 
						<span style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; color:#595959; float:right;">2,000P</span>
						</li>
						<li>
							<span  style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">3만원 이상 구매 시, 등급별 2~4% 추가</span> 
							<span style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em;  color:#595959;  float:right;"><fmt:formatNumber>${totalprice * 0.05 }</fmt:formatNumber>P</span>
						</li>
						<li>
							<span  style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">리뷰 작성 시, e교환권 추가 최대 </span> 
							<span style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; color:#595959;  float:right;">300원</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- 팝업 End-->
				</div>
				<div class="mb-3"><b><span class="text-left">결제 예정 금액</span>
				<span class="float-right" id="cartTotalPrice2"><fmt:formatNumber>${ cartTotalPrice - (cartTotalPrice * 0.1 )}</fmt:formatNumber>원
				</span></b></div>
				<div class="mb-3"><span class="text-left">적립예정 포인트</span>
					<img style="width:22px" id="pointIco" src="resources/img/pointIco.png" onclick="togglePopup('popupPoint', 'pointIco', 'resources/img/pointIco.png', 'resources/img/pointIco_active.png')">
					
					<c:if test="${totalprice > 50000 }">			
					<span class="float-right" id="pointDisplay">
						<fmt:formatNumber>${( totalprice * 0.05 ) + 2000 }</fmt:formatNumber>P
					</span>
					</c:if>	
					<c:if test="${totalprice <= 50000 }">			
					<span class="float-right" id="pointDisplay">
						<fmt:formatNumber>${totalprice * 0.05 }</fmt:formatNumber>P
					</span>
					</c:if>	
				</div>
				<form method="post" action="buy.go">
					<c:if test="${empty list }">
					<input type="reset" value="주문하기(${list.size()})"  class="buyTextBoxBlue flex_center_center" 
					style="font-weight: 500; font-size: 1.1em; width: 100%;">
					</c:if>
					<c:if test="${!empty list }">
					<input type="submit" value="주문하기(${list.size()})"  class="buyTextBoxBlue flex_center_center" 
					style="font-weight: 500; font-size: 1.1em; width: 100%;" >
					</c:if>
				</form>
			</div>
		</div><!-- 메인 우측 컨테이너 -->
	</div><!-- Flex Row 컨테이너 -->
</div><!-- 가로폭 컨테이너 -->

<br><br><br><br><br><br><br><br>
<jsp:include page="../top/footer.jsp" /> 
<script>
	
	var memberId = document.getElementById("memberId").value;
	var ajaxCheck = 0;

function costPlusCalculator(bookNo, bookCost, bookEA) {
	  console.log("책번호: " + bookNo + ", 책가격: " + bookCost + ", 책수량: " + bookEA);
	  
	  var displayNo = document.getElementById("numberDisplay" + bookNo);
	  console.log("해당 책의 수량: " + displayNo.innerText);
	  
	  var currentQuantity = parseInt(displayNo.innerText);
	  var newQuantity = currentQuantity + 1;
	  
	  displayNo.innerText = newQuantity;
	  
	  //Ajax로 수량 업데이트 시키기
	       $.ajax({
			   type: "POST",
			   url: "cartEaPlus.go",
			   data: {
			     bookNo: bookNo,
			     memberId : memberId,
			     cartCount : newQuantity,
			   },
			   success: function (result) {
			     console.log("Ajax반환 성공 데이터:" + result);
			     ajaxCheck = result;
			
			     updateTotalCost(bookNo, bookCost, newQuantity);
			     
			   },
			   error: function (request, status, error) {
			     console.log(status + " : " + error); // 오류 발생시 콘솔에 출력
			   }
			 });
	  
	  
	  console.log("변경된 책의 수량 및 변수값: " + displayNo.innerText);
	}

	function costMinusCalculator(bookNo, bookCost, bookEA) {
	  console.log("책번호: " + bookNo + ", 책가격: " + bookCost + ", 책수량: " + bookEA);
	  
	  var displayNo = document.getElementById("numberDisplay" + bookNo);
	  console.log("해당 책의 수량: " + displayNo.innerText);
	  
	  var currentQuantity = parseInt(displayNo.innerText);
	  var newQuantity = currentQuantity - 1;
	  
	  if (newQuantity >= 1) {
	    displayNo.innerText = newQuantity;
	    
	    //Ajax로 수량 업데이트 시키기
	    
	     $.ajax({
			   type: "POST",
			   url: "cartEaMinus.go",
			   data: {
			     bookNo: bookNo,
			     memberId : memberId,
			     cartCount : newQuantity,
			   },
			   success: function (result) {
			     console.log("Ajax반환 성공 데이터:" + result);
			    
			     ajaxCheck = result;
		
			     updateTotalCost(bookNo, bookCost, newQuantity);
			   },
			   error: function (request, status, error) {
			     console.log(status + " : " + error); // 오류 발생시 콘솔에 출력
			   }
			 });
	    
	  }
	  
	  console.log("변경된 책의 수량 및 변수값: " + displayNo.innerText);
	}

	function updateTotalCost(bookNo, bookCost, bookQuantity) {
	  var totalPrice = (bookCost - ( bookCost * 0.1 )) * bookQuantity;
	  var totalCostDisplay = document.getElementById("totalCostDisplay" + bookNo);
	  var totalCostDisplay1 = document.getElementById("cartTotalPrice1");
	  var totalCostDisplay2 = document.getElementById("cartTotalPrice2");
	  var pointDisplay = document.getElementById("pointDisplay");
	  
	  totalCostDisplay.innerText = totalPrice.toLocaleString() + "원";

	  
	  console.log("변경된 책의 총액: " +  totalCostDisplay.innerText);
	  
	  $.ajax({
		   type: "POST",
		   url: "cartTotalCostCheck.go",
		   data: {
		     bookNo: bookNo,
		     memberId : memberId,
		   },
		   success: function (result) {
		     console.log("Ajax반환 성공 데이터:" + result);
		     if (result > 0) {
		    	 if(ajaxCheck > 0){
		    		 
		    		 result = result - (result * 0.1 );
		    		 
		    		 totalCostDisplay1.innerText = Number(result).toLocaleString() + "원";
		    		 totalCostDisplay2.innerText = Number(result).toLocaleString() + "원";

					  pointDisplay.innerText = (result * 0.05 ).toLocaleString() + "원";
					  
					  ajaxCheck = 0;
		    	 }else{
		    		 console.log("ajax반환값 오류 : "+ ajaxCheck);
		    	 }
		    	 
		     } else {
		    	 console.log("컨트롤러 통신 오류발생");
		     }
		   },
		   error: function (request, status, error) {
		     console.log(status + " : " + error); // 오류 발생시 콘솔에 출력
		   }
		 });
	  
	}


</script>
<script src="resources/js/book/bookDetail.js"></script>	
</body>
</html>