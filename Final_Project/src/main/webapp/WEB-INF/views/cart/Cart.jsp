<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type ="text/css" href ="resources/css/main/main.css">
</head>
<body>
<jsp:include page="../top/top.jsp" /> 
<div>

	<form action="#" method ="post">
		
		<c:set var="list" value="${cList }" />
		<input type="hidden" name="totalP" value="${total }">
		<c:set var ="cartTotalPrice" value="0" />
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
					<c:set var="totalprice" value="${dto.bookPrice * dto.cartCount}" /> <!-- total price 정의  -->
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

</body>
</html>