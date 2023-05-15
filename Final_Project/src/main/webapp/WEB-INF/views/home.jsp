<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
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

</style>


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
			<div>
			
			</div>
		</div>
	</div>
</div>

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
</body>

</html>
