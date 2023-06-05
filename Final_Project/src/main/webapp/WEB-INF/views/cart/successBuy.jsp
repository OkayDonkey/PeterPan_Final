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
 <link rel="stylesheet" media="screen" id="main-styles" href="resources/css/theme.min.css" />
<link rel="stylesheet" href="resources/css/member/mypage.css" />
<link rel="stylesheet" href="resources/css/member/orderHistory.css" />
</head>
<body>
<c:set var="session" value="${session }" /> 
<c:set var="list" value="${pList }" />
<c:set var="cp" value="${coupon}" />
<c:set var ="cartTotalPrice" value="0" />
<c:set var="totalPrice" value="0" />
<c:forEach items="${list}" var="product">
  <c:set var="totalPrice" value="${totalPrice + ( product.bookPrice - ( product.bookPrice * 0.1 ))}" />
</c:forEach>
<c:forEach items="${list}" var="dto" varStatus="status">
  <c:if test="${status.index == 0 || dto.usedPoint ne list[status.index - 1].usedPoint}">
  		<c:set value="${dto.usedPoint }" var="usedPoint" />
  </c:if>
  <c:if test="${status.index == 0 || dto.paymentCost ne list[status.index - 1].paymentCost}">
  		<c:set value="${dto.paymentCost }" var="pCost" />
  </c:if>
  <c:if test="${status.index == 0 || dto.usedCouponCost ne list[status.index - 1].usedCouponCost}">
  		<c:set value="${dto.usedCouponCost }" var="cCost" />
  </c:if>
</c:forEach>

<input type="hidden" id="memberId" value="${session.memberId }">


<jsp:include page="../top/top.jsp" /> 



<div class="container align-content-center" style="min-width:1250px; z-index: 101;"><!-- 가로폭 컨테이너 -->
	<div class="row justify-content-sm-between" style=" padding:10px;" ><!-- Flex Row 컨테이너 -->
		<div  class="detail_info_main mb-5"><!-- 메인 좌측 컨테이너 -->
			<h3 class="mb-5">주문이 완료되었습니다</h3>
			<h4 class="mb-4 ml-1">주문/배송 상세 조회</h4>
			<div class="flex_column p-1">
				<c:if test="${!empty list}">
				    <c:forEach items="${list}" var="dto" varStatus="status">
				        <c:if test="${status.index == 0 || dto.purchaseNo ne list[status.index - 1].purchaseNo}">
						            <!-- Grouping logic -->
						   <div class="purchaseNoBox">
					           <div>
					           		<span class="order_date">${dto.purchaseNo.substring(0, 4)}.${dto.purchaseNo.substring(4, 6)}.${dto.purchaseNo.substring(6, 8)} | 주문번호  ${dto.purchaseNo } </span>
					           </div> 
					       </div>
						       <div class="DeliverTopBox">배송</div>    
			           </c:if>
				<div class="purchaseFlexWrap p-0 m-0 my-2">
			           <div class="">
				           <a href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}" class="prod_link">
	                           <span class="CoverBox">
	                               <img src="${dto.bookCover}" alt="${dto.bookName}">
	                           </span>
	                       </a>
	                   </div>
	                   
			           <div class="bookNameWrap">
			           		<div class="ml-4"><p><a href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}" class="prod_link">${dto.bookName }</a></p></div>
			           		<div class="ml-4 small"><b>수량 : ${dto.bookEA }</b></div>
			           </div>		
			           	
					   <div class="bookPriceWrap">
					   		<fmt:formatNumber value="${(dto.bookPrice - (dto.bookPrice * 0.1)) * dto.bookEA}" pattern="#,##0" var="formattedPrice" />
                            <span class="price">
                                <span class="val">${formattedPrice}</span>
                                <span class="unit">원</span>
                            </span>
					   </div>			
					   
					   <div class="bookDeliverWrap">
						   	<div class="blueText" style="color: #474c9f !important; font-weight: 800;">배송완료</div>
						   	<div>${dto.purchaseNo.substring(0, 4)}.${dto.purchaseNo.substring(4, 6)}.${dto.purchaseNo.substring(6, 8)}</div>
					   </div>	
	           </div>
	           			
		           </c:forEach>
	           </c:if>
	           	<h4 class="mt-5">배송정보</h4>
	            <div class="DeliverTopBox1 row">
					<div class="mr-5" ><b>기본정보</b></div>
					<div class="ml-5">
						<div><b>${session.memberName }</b>  /  ${session.memberPhone }</div>
						<div><b>[ ${session.addrPost } ]</b>  ${session.addrMain } ${session.addrDetail }</div>
					</div>
				</div>    
	           	
	           <h4 class="mt-5">결제정보</h4>
	            <div class="DeliverTopBox1 row">
					<div class="PayWrapBox mr-3" >
						<div class="row-between"><div><b>주문금액</b></div> <div><b><fmt:formatNumber >${totalPrice}</fmt:formatNumber>원</b></div></div>
						<div class="row-between"><div>상품금액</div> <div><fmt:formatNumber >${totalPrice}</fmt:formatNumber>원</div></div>
					</div>
					<div  class="PayWrapBox ml-5 mr-3" >
						<div class="row-between"><div><b>할인/포인트 금액</b></div> <div><b>-<fmt:formatNumber >${usedPoint }</fmt:formatNumber>원</b></div></div>
						<div class="row-between"><div>쿠폰 할인액</div>
						 	<c:if test="${cCost > 0}">
							 	<div><fmt:formatNumber >${cCost}</fmt:formatNumber>원</div>
							</c:if> 
							<c:if test="${cCost == 0 }">
							 	<div><fmt:formatNumber >0</fmt:formatNumber>원</div>
							</c:if>
						 </div>
					</div>
					<div  class="PayWrapBox ml-5" >
						<div class="row-between"><div><b>총 결제금액</b></div> <div><b><fmt:formatNumber >${pCost }</fmt:formatNumber>원</b></div></div>
						<div class="row-between"><div>신용카드</div> <div><fmt:formatNumber >${pCost }</fmt:formatNumber>원</div></div>
					</div>
				</div>    
				
				<h4 class="mt-5">적립정보</h4>
	            <div class="DeliverTopBox1 row">
					<div class="PayWrapBox1 mr-3" >
						<div class="row-between"><div><b>통합포인트 적립</b></div> 
							<c:if test="${totalPrice > 50000 }">
							 	<div><b><fmt:formatNumber >${( totalPrice * 0.05 ) + 2000 }</fmt:formatNumber>원</b></div>
							</c:if> 
							<c:if test="${totalPrice <= 50000 }">
							 	<div><b><fmt:formatNumber >${ totalPrice * 0.05 }</fmt:formatNumber>원</b></div>
							</c:if>
						</div>
					</div>
					<div  class="PayWrapBox1 ml-5 mr-3" >
						<div class="row-between"><div><b>잔여 포인트</b></div> 			
							<div><b><fmt:formatNumber >${session.point }</fmt:formatNumber>원</b></div>
						</div>
					</div>
				</div>    
	           	
	           	
	           	
			</div>			
					
			<br>		
			<br>		
			<br>		
			<br>		
			<br>		
		
				
		</div><!-- 메인 좌측 컨테이너 -->
		
		<!-- 메인 우측 컨테이너 -->
		<div class="detail_info_side">
		<div class="flex-align-items-center Fixed">
			<span class="grayCircle">1</span><span class="ml-2 mr-3">장바구니</span>
			<span class="grayCircle">2</span><span class="ml-2 mr-3">주문/결제</span>
			<span class="greenCircle">3</span><span class="ml-2 bold-font">주문완료</span>
		</div>
			<div class="borderRoundGray my-4 Fixed p-4" style="color:black !important;  border-color: lightgray; background-color: white;">
				<div class="flex_center_center my-5"><img width="80px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Feedbin-Icon-check.svg/2560px-Feedbin-Icon-check.svg.png"></div>
				
				<div>
					<div class="mb-3 mt-2"><b><span class="text-left" >결제 금액</span></b><span class="float-right" id="cartTotalPrice1">
							<fmt:formatNumber>${pCost }</fmt:formatNumber>원</span>
					</div>
					<div>
						<div class="mb-3 mt-2" ><b><span class="text-left" >주문 수량</span></b><span class="float-right" id="cartTotalPrice1">
							${ list.size() }개</span></div>
					</div>
					<div>
						<div class="mb-3 mt-2"><b><span class="text-left" >적립 포인트</span></b>
							<c:if test="${totalPrice > 50000 }">
								<span class="float-right" id="cartTotalPrice1"> <fmt:formatNumber >${( totalPrice * 0.05 ) + 2000 }</fmt:formatNumber>원</span>
							</c:if> 
							<c:if test="${totalPrice <= 50000 }">
								<span class="float-right" id="cartTotalPrice1"> <fmt:formatNumber >${ totalPrice * 0.05 }</fmt:formatNumber>원</span>
							</c:if>
						</div>
					</div>
					<div>
						<div class="mb-3 mt-2"><b><span class="text-left" >잔여 포인트</span></b><span class="float-right" id="cartTotalPrice1">
							<fmt:formatNumber >${session.point }</fmt:formatNumber>원</span></div>
					</div>
					<div>
						<div class="mb-3 mt-2"><b><span class="text-left" >배송 주소</span></b><br>
						<span class="float-left mt-2" id="cartTotalPrice1"> [${ session.addrPost }] ${session.addrMain } ${session.addrDetail } </span></div>
					</div><br>
					<div class="pb-4 mb-2 border_bottom_gray"><b><span class="text-left">배송비</span></b>
						<img style="width:18px" id="drvInfoIco" src="resources/img/infoIco.png" 
						onclick="togglePopup('popupDrvInfo', 'drvInfoIco', 'resources/img/infoIco.png', 'resources/img/infoIco_active.png')">
						<span class="float-right">
								<c:if test="${ pCost  > 15000}">
									0원
								</c:if>
								<c:if test="${ pCost  < 15000}">
									2,500원
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
						<span style="float: right;"><fmt:formatNumber>${totalPrice * 0.05 }</fmt:formatNumber>P</span> 
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
							<span style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em;  color:#595959;  float:right;"><fmt:formatNumber>${totalPrice * 0.05 }</fmt:formatNumber>P</span>
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
					<button type="submit"  class="buyTextBoxBlue flex_center_center" 
					style="font-weight: 500; font-size: 1.1em; width: 100%;"onclick="location.href='/main'">홈으로</button>
				
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