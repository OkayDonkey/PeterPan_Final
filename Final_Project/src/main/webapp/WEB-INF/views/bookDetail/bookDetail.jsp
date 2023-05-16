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
					<img src="resources/img/trophyIco.png" style="width:20px; height: 20px;"> &nbsp;
					<a href="" style="text-decoration: none; color: #404040;" >주간 베스트 TOP 10</a> 
				</div>
			</c:if>
				<div style="border-bottom :1px solid #eaeaea; border-top :1px solid #eaeaea; height: auto;" class="text-left">
				<br>
				
					<p style="font-family: MICEGothic Light; color: gray; font-size: 13px;">
					%%%%%%%%%		리뷰 점수 평점기능 넣기  %%%%%%%%
					</p>
				</div>
		</div>

			<!-- 책 이미지-->
			<div class="carousel slide" id="carouselBSExample"
				data-ride="carousel" style="width: 500px; height: 550px; ;">
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
				<div class="carousel-inner"  >
					<div class="carousel-item active" style="height: 500px; ">
						<img style="box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.12); transform: translate(0%, 2%); height: 480px;"
							src="${book.bookImg1 }"
							alt="${book.bookName}" />
					</div>
					<c:if test="${!empty book.bookImg2}">
					<div class="carousel-item" style="height: 500px;">
						<img style="box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.12); transform: translate(0%, 2%); height: 480px;"
							src="${book.bookImg2 }"
							alt="${book.bookName}" />
					</div>
					</c:if>
					<c:if test="${!empty book.bookImg3}">
					<div class="carousel-item" style="height: 500px;">
						<img style="box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.12); transform: translate(0%, 2%); height: 480px;"
							src="${book.bookImg3 }"
							alt="${book.bookName}" />
					</div>
					</c:if>
					<c:if test="${!empty book.bookImg4}">
					<div class="carousel-item" style="height: 500px;">
						<img style="box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.12); transform: translate(0%, 2%); height: 480px;"
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
							<span style="font-size: 0.6em; color: gray; text-decoration: line-through;">
							<fmt:formatNumber>${book.bookPrice} </fmt:formatNumber>원</span>		<!-- 도서 판매가 -->
						</p>
				</div>
				
				<div style="border-bottom :1px solid #eaeaea; border-top :1px solid #eaeaea; height: auto; padding:20px 0;" class="text-left">
						<span style="font-size: 1em;">적립 / 혜택</span>
						<span style="color: #4dac27; margin-left: 180px;">
							<fmt:formatNumber>${book.bookPrice * 0.05 }</fmt:formatNumber>P</span>
						<img style="width:22px" id="pointIco" src="resources/img/pointIco.png" onclick="togglePopup('popupPoint', 'pointIco', 'resources/img/pointIco.png', 'resources/img/pointIco_active.png')">
			<!-- 팝업 -->		
			<div id="popupPoint" hidden 
					style="position: fixed; background-color: white; border: 1px solid black;
							width:330px; border-radius: 0.5em; margin-top:10px; padding:20px; 
							box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);">
				<div style="border-bottom: 1px solid #eaeaea;">
					<p style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#2c2c2c">기본적립</p>
					<p style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">
						<span>5% 적립</span> 
						<span style="float: right;"><fmt:formatNumber>${book.bookPrice * 0.05 }</fmt:formatNumber>P</span> 
					</p>
				</div>
					<p style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin: 10px 0 6px 0; color:#2c2c2c"> 
						<span>추가적립</span> 
					</p>
				<div >
					<ul style="padding-left: 20px;">
						<li>
						<span style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">5만원 이상 구매 시 추가</span> 
						<span style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959; margin-left: 95px;">2,000P</span>
						</li>
						<li>
							<span  style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">3만원 이상 구매 시, 등급별 2~4% 추가</span> 
							<span style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959; margin-left: 27px;"><fmt:formatNumber>${book.bookPrice * 0.05 }</fmt:formatNumber>P</span>
						</li>
						<li>
							<span  style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">리뷰 작성 시, e교환권 추가 최대 </span> 
							<span style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959; margin-left: 63px;">300원</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- 팝업 End-->
		</div>
				<div style="border-bottom :1px solid #eaeaea; height: auto; font-size: 1em;" class="text-left">
					<br>
						<span>배송안내</span>
						<span style="font-size: 13px; margin-left: 53px;">도서 포함 15,000원 이상 무료배송 </span>
						<img style="width:18px" id="drvInfoIco" src="resources/img/infoIco.png" onclick="togglePopup('popupDrvInfo', 'drvInfoIco', 'resources/img/infoIco.png', 'resources/img/infoIco_active.png')">
						<p style="text-align: right;">${twoDaysLater} 도착 예정</p>
				</div>
				<!-- 팝업 -->
				<div id="popupDrvInfo" hidden 
					style="position: fixed; background-color: white; border: 1px solid black;
							width:330px; border-radius: 0.5em; margin-top:10px; padding:20px; 
							box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);">
					<p style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#2c2c2c">국내도서/외국도서</p>
					<p style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">
						도서만 15,000원 이상 구매 시 무료배송 
					</p>
					<p style="font-size: 12px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">
						* 15,000원 미만 시 2,500원 배송비 부과
					</p>
				<div style="margin-top: 20px;">
					<p style="font-size: 15px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#2c2c2c">해외주문 서양도서/해외주문 일본도서</p>
					<p style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">
						각각 구매하거나 함께 15,000원 이상 구매 시 무료배송
					</p>
					<p style="font-size: 12px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959;">
						* 15,000원 미만 시 2,500원 배송비 부과
					</p>
				</div>
			</div>
			<!-- 팝업 End-->
			
			<!-- Launch extra large modal -->
			<button type="button" class="btn-dark" data-toggle="modal" data-target=".modal" style="width:330px; height: 40px; border-radius: 0.3em; /* border-color: none; background-color: #282828; color:white; font-size: 10px;*/">
			<span style="font-size: 13px;">매장 &nbsp;재고·위치</span>
			  </button>
			
			  
			  <div class="modal" tabindex="-1" role="dialog">
				  <div class="modal-dialog modal-xl" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">Modal title</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				       <div class="row offset-sm-0">
			      		<div style="padding:20px;">
			      			<div id="map" style="width:600px;height:500px; border-radius: 0.4em;"></div>
			      		</div>
				      	<div style="width: 400px; padding: 30px 10px;" class="container align-content-center">
				      		<p style="font-size: 13px;">*서울시, 경기도에 있는 교보문고를 기준으로 생성한 지도입니다.</p>
						</div>
			    	</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">&nbsp;닫 기&nbsp;</button>
				      </div>
				    </div>
				  </div>
				</div>
			  <!-- Modal markup End-->
			
						
		</div>
	</div>
</div>		
		<!-- 		Incloud Footer Area		 -->
		
	<script src="resources/js/bookDetail.js"></script>	
    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/theme.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=5vpu3ugfk8"></script>
    <script src="resources/js/naverMap.js"></script>
     
</body>
</html>