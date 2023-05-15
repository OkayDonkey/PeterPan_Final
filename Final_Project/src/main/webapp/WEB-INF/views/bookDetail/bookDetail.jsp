<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="book" value="${Cont}"/>  	 
<title>${book.bookName} | ${book.bookWriter} - 피터팬</title>
<!-- 부트스트랩 필수파일 -->
   
   <!-- 부트스트랩 JS -->
    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/theme.min.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
   <!-- 부트스트랩 CSS -->
   <link rel="stylesheet" media="screen" id="main-styles" href="resources/css/theme.min.css" />
   <link rel="stylesheet" media="screen" id="main-styles" href="resources/css/vendor.min.css" />
   
<!-- 부트스트랩 필수파일 END-->
</head>
<body style="font-family: MICEGothic Bold; color:black;">


		<!-- 		Incloud Header Area		 -->
<div class="container align-content-center" style="min-width:1250px;"><!-- 가로폭 컨테이너 -->
		<h2 class="pt-4 pb-5 text-center">${book.bookName}</h2>
	<div class="row justify-content-sm-between" style=" padding:10px;" >
	
		<div class="flex-column pt-5" style="width:330px;">
			
			<p style="font-size: 16px; " class="text-left">
				${book.bookWriter} 저자(글)
			</p>
			<p style="font-family: MICEGothic Light; color: gray; font-size: 15px; font-weight: weight;" class="text-left">
			${book.bookTrans} · ${book.bookRelDate}  
			</p>
			<c:if test="${book.bookWeekBest == 1 }">
			<div class="book_best_box">
				<img src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/ico_trophy@2x.png" style="width:20px; height: 20px;">
				&nbsp;<a href="" style="text-decoration: none; color: #404040;" >주간 베스트</a> 
			</div>
			</c:if>
				<div style="border-bottom :1px solid #eaeaea; border-top :1px solid #eaeaea; height: auto;" class="text-left">
				<br>
					<p style="font-size: 20px;">${book.bookName}</p>
					<p style="font-size: 15px;"></p>
					<p style="font-family: MICEGothic Light; color: gray; font-size: 13px;">출판사, 출판일   ${book.bookTrans} ＊ ${book.bookRelDate}  </p>
				</div>
				
				<div style="border-bottom :1px solid #eaeaea; border-top :1px solid #eaeaea; height: auto;" class="text-left">
				<br>
					<p style="font-size: 20px;">배송안내</p>
					<p style="font-size: 15px;">${twoDaysLater} 도착 예정</p>
				</div>
			
		</div>

			<!-- 책 이미지-->
			<div class="carousel slide" id="carouselBSExample"
				data-ride="carousel" style="width: 500px; height: 550px;">
				<ol class="carousel-indicators">
					<li class="active" data-target="#carouselBSExample"
						data-slide-to="0" style="background-color: #383838;">1</li>
					<c:if test="${!empty book.bookImg2}">
						<li data-target="#carouselBSExample" data-slide-to="1"  style="background-color: #383838;">2</li>
					</c:if>
					<c:if test="${!empty book.bookImg3}">
						<li data-target="#carouselBSExample" data-slide-to="2"  style="background-color: #383838;">3</li>
					</c:if>
					<c:if test="${!empty book.bookImg4}">
						<li data-target="#carouselBSExample" data-slide-to="3"  style="background-color: #383838;">4</li>
					</c:if>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active" style="height: 550px;">
						<img
							src="${book.bookImg1 }"
							alt="${book.bookName}" />
					</div>
					<c:if test="${!empty book.bookImg2}">
					<div class="carousel-item" style="height: 550px;">
						<img
							src="${book.bookImg2 }"
							alt="${book.bookName}" />
					</div>
					</c:if>
					<c:if test="${!empty book.bookImg3}">
					<div class="carousel-item" style="height: 550px;">
						<img
							src="${book.bookImg3 }"
							alt="${book.bookName}" />
					</div>
					</c:if>
					<c:if test="${!empty book.bookImg4}">
					<div class="carousel-item" style="height: 550px;">
						<img
							src="${book.bookImg4 }"
							alt="${book.bookName}" />
					</div>
					</c:if>
				</div>
				<a class="carousel-control-prev" href="#carouselBSExample"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon-gray" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselBSExample"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon-gray" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

			<div class="flex-column pt-5" style="width:330px;" style="font-family: MICEGothic Light">
			
			
				<div style="border-bottom :1px solid #eaeaea; height: auto;" class="text-left">
				<br>
					<p style="font-size: 20px;">${book.bookName}</p>
						<p style="font-size: 1.7em; " class="text-left">
							<span style="color: #4dac27; ">10%</span>
							<fmt:formatNumber>${book.bookPrice - ( book.bookPrice * 0.1 )} </fmt:formatNumber>원		<!-- 10%할인률 적용된 가격 -->
							<span style="font-size: 0.6em; color: gray; text-decoration: line-through;"><fmt:formatNumber>${book.bookPrice} </fmt:formatNumber>원</span>		<!-- 도서 판매가 -->
						</p>
				</div>
				
				<div style="border-bottom :1px solid #eaeaea; border-top :1px solid #eaeaea; height: auto; padding:20px 0;" class="text-left">
						<span style="font-size: 1em;">적립 / 혜택</span>
						<span style="color: #4dac27;">
							<fmt:formatNumber>${book.bookPrice * 0.05 }</fmt:formatNumber>P</span>
						<img id="pointIco" src="resources/img/pointIco.png" style="width:22px" onclick="changeImageSrc()">
					<div id="popupBook" hidden 
					style="position: fixed; background-color: white; border: 1px solid black;
							width:330px; border-radius: 0.5em; margin-top:10px; padding:20px;
					">
					<p style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px;">기본적립</p>
					<p style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;"> <span>5% 적립</span> <span><fmt:formatNumber>${book.bookPrice * 0.05 }</fmt:formatNumber>P</span> </p>
					<p style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px;"> <span>추가적립</span> </p>
				
				<div >
					<ul >
						<li>
						<span style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px;">5만원 이상 구매 시 추가</span> 
						<span style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px;">2,000P</span>
						</li>
						<li class="bul_item_dot font_size_min">
							<span class="cont_title">3만원 이상 구매 시, 등급별 2~4% 추가</span> 
							<span class="cont_desc"><fmt:formatNumber>${book.bookPrice * 0.05 }</fmt:formatNumber>P</span>
						</li>
						<li class="bul_item_dot font_size_min">
							<span class="cont_title">리뷰 작성 시, e교환권 추가</span> 
							<span class="cont_desc">최대 300원</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
				
				<div style="border-bottom :1px solid #eaeaea; border-top :1px solid #eaeaea; height: auto;" class="text-left">
					<br>
						<p style="font-size: 20px;">배송안내</p>
						<p style="font-size: 15px;">${twoDaysLater} 도착 예정</p>
						
				</div>
			
		</div>
	</div>



</div>		
		 	
		<!-- 		Incloud Footer Area		 -->
		
	<script src="resources/js/bookDetail.js"></script>	
</body>
</html>