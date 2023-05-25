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


<jsp:include page="../top/top.jsp" /> 



<div class="container align-content-center" style="min-width:1250px; z-index: 101;"><!-- 가로폭 컨테이너 -->
	<div class="row justify-content-sm-between" style=" padding:10px;" ><!-- Flex Row 컨테이너 -->
		<div  class="detail_info_main mb-5"><!-- 메인 좌측 컨테이너 -->

			<h3 class="mb-4">장바구니(${list.size()})</h3>
			<div>
				<div class="border-y-bold py-3"><!-- top -->
					피터팬 도서 장바구니
				</div>
				
				<c:forEach  items="${list }" var="dto" >
				<c:if test="${!empty list }">
					<c:set var="totalprice" value="${dto.bookPrice * dto.cartCount}" /> <!-- total price 정의  -->
					<c:set var ="cartTotalPrice" value="${cartTotalPrice + totalprice }" />
					
					<div class="column border_bottom_gray"><!-- bottom -->
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
									<fmt:formatNumber>${ dto.bookPrice}</fmt:formatNumber>원
									</div>
							</div>
						</div>
						<div class="flex_center_center border-x-light">
							<span class="mb-2 bold">
								<fmt:formatNumber> ${totalprice } </fmt:formatNumber>원
							</span>
							<div class="RoundBox_s bold">
								<div>
									<button id="decrementBtn" class="decrementBtn">-</button>
								</div>
								<div id="numberDisplay">${ dto.cartCount}</div>
								<div>
									<button id="incrementBtn" class="incrementBtn">+</button>
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
				
			</div>
			<div>2</div>
			<div>3</div>
			
		</div><!-- 메인 좌측 컨테이너 -->
		
		<div class="detail_info_side"><!-- 메인 우측 컨테이너 -->
			<div class="borderRoundGray my-4 Fixed p-4" style="color:black !important;  border-color: lightgray;">
				<div>
					<div class="mb-3"><b><span class="text-left">상품금액</span><span class="float-right">
							<fmt:formatNumber>${ cartTotalPrice}</fmt:formatNumber>원</span></b></div>
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
				width:330px; border-radius: 0.5em; margin-top:80px; padding:20px; right:8px;
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
			
				</div>
				<div class="mb-3"><b><span class="text-left">결제 예정 금액</span>
				<span class="float-right"><fmt:formatNumber>${ cartTotalPrice}</fmt:formatNumber>원
				</span></b></div>
				<div class="mb-3"><span class="text-left">적립예정 포인트</span><span class="float-right">
				<fmt:formatNumber>${totalprice * 0.05 }</fmt:formatNumber>P</span>
				</div>
				<div class="buyTextBoxBlue flex_center_center">
					주문하기(${list.size()})
				</div>
			</div>
		</div><!-- 메인 우측 컨테이너 -->
	</div><!-- Flex Row 컨테이너 -->
</div><!-- 가로폭 컨테이너 -->












<br><br><br><br><br><br><br><br>
<div>

	<form action="#" method ="post">
		
		
		<input type="hidden" name="totalP" value="${total }">
			<table border="1">
				<tr>
					<th colspan="6">
					주문내역
					</th>
				</tr>
				<tr>		
					<th>상품 수량</th>
					<th>상품 이미지</th>
					<th>상품 이름</th>
					<th>상품 가격</th>
					<th>상품 총 가격</th>
					<th>상품 삭제</th>			
			 	</tr>
				<c:forEach  items="${list }" var="dto" >
				<c:if test="${!empty list }">
					
					<c:set var ="cartTotalPrice" value="${cartTotalPrice + totalprice }" />
					<tr>		
					 	<td>${dto.cartCount}</td>
						<td>
							<img src=" ${dto.bookCover }" style="width: 150px; height: 200px;">
						</td>
					 	<td>${dto.bookName}	</td>
					 	<td>${dto.bookPrice}</td>
					 	<td>
						 	<fmt:formatNumber>
							${totalprice }
						 	</fmt:formatNumber>
					 	</td>
					 	<td>
					 		<input type="button" value="삭제" 
					 						onclick="if(confirm('정말로 삭제하시겠습니까??'))
					 								{location.href='cartDelete.go?cartNo=${dto.cartNo}'}else{retrun}">
					 	</td>
					</tr>
				</c:if>
				</c:forEach>
				<c:if test="${empty list }">
				<tr>
					<td colspan="6">
						
					</td>
				</tr>
				</c:if>
			</table>
			
			<div>
				<div>상품 금액 : ${cartTotalPrice }</div>
				<div>배송비 	: ${dto.bookPrice }</div>
				<div>결제 예정 금액 	: ${dto.bookPrice }</div>
				
				<input type="submit" value="주문하기">
			</div>
	</form>

</div>
<jsp:include page="../top/footer.jsp" /> 

<script src="resources/js/book/bookDetail.js"></script>	
</body>
</html>