<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>]
<%@ 
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!--슬라이드 css 시작 -->
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
	<!-- 슬라이드 css 끝-->

	<title>Home</title>
	
</head>



<style>
	/* 메인 전체 css */
.home_container {
	padding-bottom: 50px; /* footer의 높이만큼 여백 추가 */	
}

.home_home{
		margin: 0 auto;
		align-content:center;
		text-align: center;
		
}

/* ----------------------------------------- */
/* 슬라이드css */
.slick-prev:before,
.slick-next:before
{
    color: black;

}

.slick-prev{
	left: 160px;
    z-index: 1;
    color: black;
}
.slick-next{
	right: 160px;
    z-index: 1;
    color: black;
}

.slide_div_wrap{
	height: 350px;
}


.slide_div img{
	margin: auto;
}
.slide_div_wrap{
	padding: 15px 0 15px 0;
    background: white;
}
.image_wrap img{
	max-width: 85%;
    height: auto;
    display: block;
	margin: auto;    
}

.new_books > new_book_wrap > new_book >img{
	
	width: 270px;
	height: 350px;
}
</style>

<!-- ------------------------- css end-------------------------------- -->

<body>

<jsp:include page="./top/top.jsp" />


<div class="home_container home_home">

	<!-- 슬라이드부 start -->
	<div class="slide_div_wrap">
		<div class="slide_div">
			
			<div>
				<a href="#"><img class="image_wrap" src="resources\css\s_img\test_sl_1.jpg"> </a>			
			</div>

			<div>			
				<a href="#"><img class="image_wrap" src="resources\css\s_img\test_sl_2.jpg"> </a>			
			</div>

			<div>
				<a href="#"><img class="image_wrap" src="resources\css\s_img\test_sl_3.jpg"> </a>						
			</div>
		</div><!-- 슬라이드부분 end -->

		<div class="new_books">
			<div class="new_books_plus">
				<a href="#">더보기</a>
			</div>
			
			<div class ="new_book_wrap">
				<c:set var="list" value="${List }"/>
				<c:forEach items="${list }" var="dto" varStatus="status">
					<c:if test="${status.index < 3 }">
						<div class ="new_book">
							<img src="${dto.bookCover }">
							${dto.bookName }					
						</div>
					</c:if>
				</c:forEach>			
			</div>
		</div>
		<div class="best_books">
			<div class="best_book_plus">
				<a>더보기</a>
			</div>
			
			<div class="best_book_wrap">
				<c:set var ="bestlist" value="${bestList }"/>
				<c:forEach items="${bestlist }" var="B_dto" varStatus="status">
					<c:if test="${status.index < 6 }">
						<div>
							<img>${B_dto.bookCover }	
							${B_dto.bookName }	
						</div>	
					
					
					</c:if>
				
				
				
				</c:forEach>
			
			</div>
		</div>
	</div>
</div>

<jsp:include page="./top/footer.jsp" />


<script type="resources/js/vendor.min.js"></script>
<script type="resources/js/theme.min.js"></script>
<!--슬라이드 CDN 시작 -->
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- 슬라이드 CDN 끝-->

<script type="text/javascript">

	$(document).ready(function(){
		$('.slide_div').slick({
			dots: true,
			autoplay : true,
			autoplaySpeed: 5000
		});
		
	});

</script>


<c:if test="${sessionScope.Id == null }">
	<input type="button" value="로그인" onclick="location.href='login.go'">
</c:if>

<c:if test="${sessionScope.Id != null }">
	<input type="button" value="로그아웃" onclick="location.href='logout.go'">
</c:if>

</body>

</html>
			