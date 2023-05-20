<%@page import="javax.servlet.http.HttpSession"%>
<%@ page session="true" pageEncoding="UTF-8"%>
<%@ 
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<jsp:include page="./top/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!--슬라이드 css 시작 -->
<!-- CSS -->


<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- 슬라이드 css 끝-->
<link rel="stylesheet" type ="text/css" href ="resources/css/main/main.css">


<title>Home</title>


</head>


<body>
	 	<jsp:include page="./top/top.jsp" />
		 <a href="<%=request.getContextPath()%>/boardPage.go">[게시판]</a>
			<!-- 슬라이드부 start -->
			<div class="slide_div_wrap" >
				<div class="slide_div">
	
					<div>
						<a href="#"><img class="image_wrap"
							src="resources\css\s_img\test_sl_1.jpg" style=" width: 1200px; height: 350px;"> </a>
					</div>
	
					<div>
						<a href="#"><img class="image_wrap"
							src="resources\css\s_img\test_sl_2.jpg"style=" width: 1200px; height: 350px;"> </a>	
					</div>
	
					<div>
						<a href="#"><img class="image_wrap"
							src="resources\css\s_img\test_sl_3.jpg" style=" width: 1200px; height: 350px;"> </a>
					</div>
				</div>
			</div>
				<!-- 슬라이드부분 end -->
		<div class="home_container home_home">
	
	
				<div class="new_books">
					<div class="books_plus">
						<span>신간</span> <a href="#"><img src="resources\css\s_img\plus.png" style="width:30px; height:30px; ">더보기</a>
					</div>
	
					<div class="new_book_wrap">
						<c:set var="list" value="${List }" />
						<c:forEach items="${list }" var="dto" varStatus="status">
							<c:if test="${status.index < 5 }">
								<div class="new_book">
									<table>
										<thead>
											<tr>
												<th>
												
													<%-- <a href="<%=request.getContextPath()%>/cart.go?bookNo=${dto.bookNo}&memberId=${sessionScope.Id}" id="modalOpen">
 														<img id="book_img" src="${dto.bookCover }">														
													</a> --%>
													<%-- data-context-path="<%=request.getContextPath()%>" data-book-no="${dto.bookNo}" data-member-id="${sessionScope.Id}" --%>
													<a href="#" data-context-path="<%=request.getContextPath()%>" data-book-no="${dto.bookNo}" data-member-id="${sessionScope.Id}" onclick="modalOpen(event);">
													    <img id="book_img" src="${dto.bookCover}">
													</a>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="td_bookname" style="font-size: 15px;">
													${dto.bookName }
												</td>
											</tr>
											
											<tr>
												<td class="td_bookwriter" style="font-size: 13px; color:gray;">
													-${dto.bookWriter}-
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
	
				<div class="best_books">
					<div class="books_plus">
						<span>베스트 작품</span> <a href="#"><img src="resources\css\s_img\plus.png" style="width:30px; height:30px;">더보기</a>
					</div>
	
					<div class="best_book_wrap">
						<c:set var="bestlist" value="${bestList}" />
						<c:forEach items="${bestlist}" var="B_dto" varStatus="status">
							<c:if test="${status.index < 10}">
								<div class="best_book">
									<div class="best_rank">
										<span>${status.index + 1}</span>
									</div>							
									<table>
										<thead>
											<tr>
												<th>
													<a>
														<img id="book_img" src="${B_dto.bookCover}">
													</a>
												</th>
											</tr>
										</thead>
										
										<tbody>
											<tr>
												<td class="td_bookname" style="font-size: 15px;">
													${B_dto.bookName }
												</td>
											</tr>
											<tr>
												<td class="td_bookwriter" style="font-size: 13px; color:gray;">
													-${B_dto.bookWriter}-
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<c:if test="${(status.index + 1) % 5 == 0}">
									<div style="width: 100%; clear: both; margin: 10px;"></div>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
				</div>

			</div>
		<!--  class="home_container home_home" end -->
	<jsp:include page="./top/footer.jsp" />


	<script type="resources/js/vendor.min.js"></script>
	<script type="resources/js/theme.min.js"></script>
	
	
	
	
	<!--슬라이드 CDN 시작 -->
	<script type="text/javascript"
		src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<!-- 슬라이드 CDN 끝-->

	<script type="text/javascript">
		$(document).ready(function() {
			$('.slide_div').slick({
				dots : true,
				autoplay : true,
				autoplaySpeed : 5000
			});
		
		});

	    function modalOpen(event) {
	        event.preventDefault();
	        
	        var contextPath = event.currentTarget.getAttribute('data-context-path');
	        var bookNo = event.currentTarget.getAttribute('data-book-no');
	        var memberId = '<%=(String)session.getAttribute("memberId")%>';
	        
	        
	       if(memberId != null){
	            document.location.href = contextPath + '/cart.go?bookNo=' + bookNo + '&memberId=' + memberId;
	       }else{
	        	alert("로그인 먼저 부탁드립니다");
	        	history.back();
	        }
	     } 
	    
	</script>

</body>

</html>
