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
<c:set var="cp" value="${coupon}" />
<c:set var ="cartTotalPrice" value="0" />
<input type="hidden" id="memberId" value="${session.memberId }">


<jsp:include page="../top/top.jsp" /> 



<div class="container align-content-center" style="min-width:1250px; z-index: 101;"><!-- 가로폭 컨테이너 -->
	<div class="row justify-content-sm-between" style=" padding:10px;" ><!-- Flex Row 컨테이너 -->
		<div  class="detail_info_main mb-5"><!-- 메인 좌측 컨테이너 -->

			<h3 class="mb-4">주문 상세정보</h3>
				<div class="borderRoundBGray mb-4">
					<div class="row">



					</div>
				      
			      	<div id="cartItems">
					<c:forEach  items="${list }" var="dto" >
					<c:if test="${!empty list }">
						<c:set var="totalprice" value="${dto.bookPrice * dto.cartCount}" /> <!-- total price 정의  -->
						<c:set var ="cartTotalPrice" value="${cartTotalPrice + totalprice }" />
						
						
						<div class="column border_bottom_gray"   id="cartItems"><!-- bottom -->
							<div class="row ailgn-content-center pl-4 ">
							<div class="row py-3 pl-3">
								<div class="px-2 my-2">
									<img width="100" alt="${ dto.bookCover}" src="${ dto.bookCover}"  style="border-radius: 0;">
								</div>
								<div class="px-2 my-2 bookCartWidth" style="width: 150px;">
										<div class="text-left mb-2"  style="font-weight: 600; ">
										<a style="color:black; " href="${path }bookDetail.go?bookNo=${ dto.bookNo}">${ dto.bookName}</a> 
										</div>
										<div class="text-left mb-2" style="font-size: 1em;  font-weight: 700;  ">
										<span style="color: #4dac27; font-size: 0.9em; font-weight: 600;  ">10%</span>
										<fmt:formatNumber>${ dto.bookPrice - ( dto.bookPrice * 0.1)}</fmt:formatNumber>원
										<span class="strikeNum"><fmt:formatNumber>${ dto.bookPrice}</fmt:formatNumber>원</span>
										</div>
								</div>
							</div>
							<div class="flex_center_center" style="width: 120px;">
									<div id="numberDisplay${ dto.bookNo}" style="font-size: 0.9em;">${ dto.cartCount}개</div>
							</div>
							<div class="flex_center_center float-right"  style="width: 100px;">
								<span class="bold" id="totalCostDisplay${ dto.bookNo}">
									<fmt:formatNumber> ${totalprice - ( totalprice * 0.1 ) } </fmt:formatNumber>원
								</span>
							</div>
							</div>
						</div>
					</c:if>
					</c:forEach>
				</div>
					
				</div>
				
		</div><!-- 메인 좌측 컨테이너 -->
		
		<!-- 메인 우측 컨테이너 -->
		<div class="detail_info_side">
		<div class="flex-align-items-center Fixed">
			<span class="grayCircle">1</span><span class="ml-2 mr-3">장바구니</span>
			<span class="greenCircle">2</span><span class="ml-2 mr-3 bold-font">주문/결제</span>
			<span class="grayCircle">3</span><span class="ml-2">주문완료</span>
		</div>
			<div class="borderRoundGray my-4 Fixed p-4" style="color:black !important;  border-color: lightgray; background-color: white;">
				<div>
					<div class="mb-3"><b><span class="text-left" >상품금액</span><span class="float-right" id="cartTotalPrice1">
							<fmt:formatNumber>${ cartTotalPrice - (cartTotalPrice * 0.1 )}</fmt:formatNumber>원</span></b></div>
					<div class="pb-4 mb-2 border_bottom_gray"><span class="text-left">배송비</span>
						<img style="width:18px" id="drvInfoIco" src="resources/img/infoIco.png" 
						onclick="togglePopup('popupDrvInfo', 'drvInfoIco', 'resources/img/infoIco.png', 'resources/img/infoIco_active.png')">
						<span class="float-right">
								<c:if test="${ cartTotalPrice > 15000}">
									0원
								</c:if>
								<c:if test="${ cartTotalPrice < 15000}">
									4,000원
								</c:if>
						</span>
					</div>
					
<!-- 팝업 -->
	<div id="popupDrvInfo" hidden 
		style="position: absolute; background-color: white; border: 1px solid gray;
				width:350px; border-radius: 0.5em; padding:20px; right: 0px;
				box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3); color:black !important; z-index: 3000;">
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
							width:350px; border-radius: 0.5em; margin-top:100px; padding:20px; right: 0px;
							box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);  z-index: 3000;">
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
				<div id="pointDisplay" class="mb-3" style="font-weight: 500; color:#5055b1;" hidden></div><br>
				<div class="mb-3"><b><span class="text-left">결제 예정 금액</span>
				<span class="float-right" id="cartTotalPrice2"><fmt:formatNumber>${ cartTotalPrice - (cartTotalPrice * 0.1 )}</fmt:formatNumber>원
				</span></b></div>
				<div class="mb-3"><span class="float-left">적립예정 포인트</span>
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
					<button type="submit"  class="buyTextBoxBlue flex_center_center" 
					style="font-weight: 500; font-size: 1.1em; width: 100%;"onclick="requestPay()">주문/결제(${list.size()})</button>
				
			<div class="mt-3">
			<div id="accordion Fixed">
				  <div class="card1">
				    <div class="card-header2" id="headingOne">
				       <div><b><span class="p-2 mt-2">
					        주문 상품 정보 동의
					        </span></b>
				        </div> 
				        <div>
					        <button class="btn-white btn-link float-right" data-toggle="collapse"
					        data-target="#collapse3" aria-expanded="true" aria-controls="collapseOne">
					          <img src="resources/img/arrow-down.png" width="15px" height="15px">
				        </button>
				        </div>
				    </div>
				    <div id="collapse3" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
				      <div class="card-body roundBgGray small">
			      	주문할 상품의 상품명, 가격, 배송정보 등을 최종 확인하였으며, 구매에 동의하십니까? (전자상거래법 제 8조 2항)
			      </div>
			    </div>
			  </div>
			</div><!-- 쿠폰 아코디언 끝-->
			</div>
			</div>
			
			
		</div><!-- 메인 우측 컨테이너 -->
	</div><!-- Flex Row 컨테이너 -->
</div><!-- 가로폭 컨테이너 -->

 
<br><br><br><br><br><br><br><br>
<jsp:include page="../top/footer.jsp" /> 
  <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script src="resources/js/book/bookDetail.js"></script>	
<script src="resources/js/book/orderPriceCalculator.js"></script>	
<!-- 다음 주소 가져오는 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 다음주소 찾기 js -->
<script type="text/javascript" src="resources/js/member/findAddr.js"></script>
<script src="resources/js/book/Pay.js"></script>	
</body>
</html>