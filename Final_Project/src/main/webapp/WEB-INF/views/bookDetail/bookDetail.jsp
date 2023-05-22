<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/hatLogo1.png" />
<head>
<meta charset="UTF-8">
<c:set var="book" value="${Cont}"/>  	 
<c:set var="reviewList" value="${review}"/>  	 
<c:set var="perR" value="${PercentR}"/>
<c:set var="session" value="${session }" />  	 
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
<body style="font-family: MICEGothic Bold; color:black; ">
<!-- 구매 하단 호버 바 -->
<h4>${session }</h4>
<div class="hoverBuyBar">
	<div class="hBB_left">
		<span class="mr-4">총 상품 금액</span>	
		<p style="font-size: 1.6em; margin:0;">
			<span style="font-size: 0.6em; color: gray; text-decoration: line-through;">
				<span id="totalPrice2">${book.bookPrice} </span>원</span>		<!-- 도서 판매가 -->
			<span style="color: #4dac27; font-size: 0.8em; ">10%</span>
			<span id="totalPrice">${book.bookPrice}</span>원		<!-- 초기 가격 표시 -->
		</p>
	</div>
	<div class="hBB_right">
		<div class="RoundBox_s">
			<div>
				<button id="decrementBtn" class="decrementBtn">-</button>
			</div>
			<div id="numberDisplay">1</div>
			<div>
				<button id="incrementBtn" class="incrementBtn">+</button>
			</div>
		</div>
		<c:choose>
			<c:when test="${empty session.memberId }">
				<div class="RoundBox_m" id="dibs" onclick="needLogin()">
  					<img id="heartIcon" src="resources/img/heart.png" width="23px;">
				</div>
			</c:when>
			<c:when test="${!empty session.memberId }">
				<div class="RoundBox_m" id="dibs" onclick="toggleLike('${session.getMemberNo()}', ${book.bookNo});">
  					<img id="heartIcon" src="resources/img/heart.png" width="23px;">
				</div>
			</c:when>
		</c:choose>
		<%--
		 <div class="RoundBox_m" id="dibs" onclick="toggleLike('${session.getMemberNo()}', ${book.bookNo});">
  			<img id="heartIcon" src="resources/img/heart.png" width="23px;">
		</div>
		 --%>

		<div class="RoundBox_l_white">장바구니</div>
		<div class="RoundBox_l">바로구매</div>
	</div>
</div>

		<!-- 		Incloud Header Area		 -->
<div class="container align-content-center" style="min-width:1250px; z-index: 101;"><!-- 가로폭 컨테이너 -->

<div >
	<ul class="cateBar">
		<li><a class="homeIcon" href="<%=request.getContextPath()%>/"></a></li>
		<li><a href="#">${book.bookCategory }
		<img style="width:18px; vertical-align: sub;" id="categoryIco1" src="resources/img/pointIco.png" onclick="resetActivePopup(),togglePopup('catePopup1', 'categoryIco1', 'resources/img/pointIco.png', 'resources/img/pointIco_active.png')">&nbsp;/
		</a></li>
		<li><a href="#">${book.bookGenre }
		<img style="width:18px; vertical-align: sub;" id="categoryIco2" src="resources/img/pointIco.png" onclick="resetActivePopup(),togglePopup('catePopup2', 'categoryIco2', 'resources/img/pointIco.png', 'resources/img/pointIco_active.png')">&nbsp;
		</a></li>
	</ul>
	<!-- 히든팝업1 -->
	<div id="catePopup1" hidden >
		<a href="#"><span>국내도서</span></a>
		<a href="#"><span>해외도서</span></a>
		<a href="#"><span>일본도서</span></a>
	</div>
	
	<!-- 히든팝업2 -->
	<div id="catePopup2" hidden>
		<a href="#"><span>문학</span></a>
		<a href="#"><span>역사</span></a>
		<a href="#"><span>자기계발</span></a>
		<a href="#"><span>취미</span></a>
		<a href="#"><span>참고서</span></a>
		<a href="#"><span>공포/호러</span></a>
		<a href="#"><span>자기계발</span></a>
	</div> 
</div>

		<h2 class="pt-4 pb-4 text-center">${book.bookName}</h2>
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
					<a href="#" style="text-decoration: none; color: #404040;" >주간 베스트 TOP 10</a> 
				</div>
			</c:if>
				<div style="border-bottom :1px solid #eaeaea; border-top :1px solid #eaeaea; height: auto;" class="text-left">
				<br>
				
				<p style="color: #4dac27;">추천해요</p>
				<div class="prod_review_box">
					<div class="col_review">
						<div class="progress" style="background-color: #dbdbdbd1;border-radius: 1em;">
							  <div class="progress-bar bg-success" role="progressbar" style="width:${perR.like_percentage}%; background-color: #6dd046!important;" aria-valuenow="${perR.like_percentage}" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
				
					</div>
				</div>	  	
					<p style="font-family: MICEGothic Light; color: gray; font-size: 13px; margin-top:10px;">
						<c:set var="reviewCount" value="0" />
							<c:forEach var="review" items="${reviewList}">
							  <c:set var="reviewCount" value="${reviewCount + 1}" />
							</c:forEach>
							<c:if test="${reviewCount == 0}">리뷰가 없습니다</c:if>
							<c:if test="${reviewCount > 0}">
								<c:out value="${reviewCount}" />&nbsp;개의 리뷰 중 <fmt:formatNumber value="${perR.like_percentage}" pattern="###" />%의 구매자가 추천
							</c:if>
					</p>
				</div>
		</div>

			<!-- 책 이미지-->
			<div class="carousel slide" id="carouselBSExample"
				data-ride="carousel" style="width: 500px; height: 550px; ;">
				<ol class="carousel-indicators">
					<li class="active" data-target="#carouselBSExample"
						data-slide-to="0" style="background-color: #383838;">1</li>
					<c:if test="${!empty book.bookImg1}">
						<li data-target="#carouselBSExample" data-slide-to="1"  style="background-color: #383838;">2</li>
					</c:if>
					<c:if test="${!empty book.bookImg2}">
						<li data-target="#carouselBSExample" data-slide-to="2"  style="background-color: #383838;">3</li>
					</c:if>
					<c:if test="${!empty book.bookImg3}">
						<li data-target="#carouselBSExample" data-slide-to="3"  style="background-color: #383838;">4</li>
					</c:if>
				</ol>
				<div class="carousel-inner"  >
					<div class="carousel-item active" style="height: 500px; ">
						<img style="box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.12); transform: translate(0%, 2%); height: 480px;"
							src="${book.bookCover }"
							alt="${book.bookName}" />
					</div>
					<c:if test="${!empty book.bookImg1}">
					<div class="carousel-item" style="height: 500px;">
						<img style="box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.12); transform: translate(0%, 2%); height: 480px;"
							src="${book.bookImg1 }"
							alt="${book.bookName}" />
					</div>
					</c:if>
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
				<div style="height: auto;" class="text-left">
				<c:if test="${book.bookWeekBest == 1 }">
					<span class="smallTextBoxGreen">MD의 선택</span>
					<span class="smallTextBoxGreen">주간 베스트TOP10</span>
				</c:if>
				<c:if test="${book.bookPrice > 15000 }">
					<span class="smallTextBoxBlue">배송비 무료</span>
				</c:if>
				<span class="smallTextBox">소득공제</span>
				<br><br>
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
						<span style="color: #4dac27; margin-left: 170px;">
							<fmt:formatNumber>${book.bookPrice * 0.05 }</fmt:formatNumber>P</span>
						<img style="width:22px" id="pointIco" src="resources/img/pointIco.png" onclick="togglePopup('popupPoint', 'pointIco', 'resources/img/pointIco.png', 'resources/img/pointIco_active.png')">
			<!-- 팝업 -->		
			<div id="popupPoint" hidden 
					style="position: absolute; background-color: white; border: 1px solid black;
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
					style="position: absolute; background-color: white; border: 1px solid black;
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
			
			<!-- large modal -->
			<button type="button" class="btn-dark" data-toggle="modal" data-target=".modal" style="width:330px; height: 40px; border-radius: 0.3em; /* border-color: none; background-color: #282828; color:white; font-size: 10px;*/">
			<span style="font-size: 13px;">매장 &nbsp;재고·위치</span>
			  </button>
			
			  
			  <div class="modal" tabindex="-1" role="dialog">
				  <div class="modal-dialog modal-xl" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">
				        	<span style="font-size: 1.3em;">피터팬 </span>
				        	<span style="font-size: 1em;">- 매장 위치 </span>
				        </h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				       <div class="row offset-sm-0">
			      		<div style="padding:20px;">
			      			<div id="map" style="width:600px;height:500px; border-radius: 0.4em;"></div>
			      		</div>
				      	<div style="width: 400px; padding: 20px 10px;" class="container align-content-center">
				      		<div id="innerStoreInfo" style="   max-height: 500px; 
																		  overflow-y: auto; 
																		  border: 1px solid #ccc; 
																		  padding: 10px;
																		  border-radius: 0.4em;"></div>
				      		<p style="font-size: 13px;">*서울시에 있는 교보문고를 기준으로 생성한 지도입니다.</p>
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
		<!-- 		책 정보 슬라이더 구역 끝		 -->
			<div class="sps_inner">
	            <ul class="tabs" >
	                <li class="tab_item"><a href="#book_detail_info_event" ><span class="tab_text">이벤트</span></a></li>
	                <li class="tab_item"><a href="#book_detail_info_img" ><span class="tab_text">상품정보</span></a></li>
	                <li class="tab_item"><a href="#" ><span class="tab_text">리뷰(${reviewCount})</span></a></li>
	                <li class="tab_item" ><a href="#" ><span class="tab_text">교환/반품/품절</span></a></li>
	            </ul>
       		</div>
       		
       		<div>
       			<section class="detail_info_main" id="book_detail_info_event" >
       				<img src="resources/img/bookEvent.png">
       			</section>
       			<section class="detail_info_main" id="book_detail_info_img" style="margin: 30px 0px; border-radius: 2em;">
       				<img alt="${book.bookName}" src="${book.bookImg4 }">
       			</section>
       			<section style="margin: 50px 0px;">
       				<h3>책 소개</h3>
       				<br>
       				<h5>이 책이 속한 분야</h5>
       				<h6>${book.bookCategory }<span style="margin:0 15px;">></span>${book.bookGenre }</h6>
       				<br><br>
       				<p>${book.bookCont }</p>
       			</section>
       			<section>4</section>
       			<section>5</section>
       		</div>
       		<div class="detail_info_side">
       			<section>1</section>
       			<section>2</section>
       			<section>3</section>
       			<section>4</section>
       			<section>5</section>
       		</div>
       		
	</div>		<!-- flex row container -->
</div>		<!-- width 1250 container -->

		<!-- 		Incloud Footer Area		 -->
		
	<script src="resources/js/book/bookDetail.js"></script>	
    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/theme.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=5vpu3ugfk8"></script>
    <script src="resources/js/book/naverMap.js"></script>
 
	<script>
	function updateTotalPrice() {
		
		  var originalPrice = ${book.bookPrice }; // 책의 판매가
		  var discount = 0.1; // 할인율 (10%)
		  var bookQuantity = parseInt(document.getElementById("numberDisplay").innerText); // 책의 권수

		  var discountedPrice = originalPrice - (originalPrice * discount); // 할인 적용된 가격
		  var unDiscountedPrice = originalPrice; // 할인 적용된 가격
		  var totalPrice = discountedPrice * bookQuantity; // 총 상품 가격
		  var totalPrice2 = unDiscountedPrice * bookQuantity; // 총 상품 가격

		  document.getElementById("totalPrice").innerText = totalPrice.toLocaleString();
		  document.getElementById("totalPrice2").innerText = totalPrice2.toLocaleString();
		}

		document.getElementById("decrementBtn").addEventListener("click", function() {
		  var numberDisplay = document.getElementById("numberDisplay");
		  var bookQuantity = parseInt(numberDisplay.innerText);

		  if (bookQuantity > 1) {
		    bookQuantity--;
		    numberDisplay.innerText = bookQuantity;
		    updateTotalPrice();
		  }
		});

		document.getElementById("incrementBtn").addEventListener("click", function() {
		  var numberDisplay = document.getElementById("numberDisplay");
		  var bookQuantity = parseInt(numberDisplay.innerText);

		  bookQuantity++;
		  numberDisplay.innerText = bookQuantity;
		  updateTotalPrice();
		});

		updateTotalPrice(); // 초기 총 상품 금액 업데이트

</script>
</body>
</html>