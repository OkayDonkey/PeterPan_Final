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
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" />
<head>
<meta charset="UTF-8">
<c:set var="book" value="${Cont}"/>  	 
<c:set var="reviewList" value="${review}"/>  	 
<c:set var="perR" value="${PercentR}"/>
<c:set var="newB" value="${NewRelBook}"/>
<c:set var="SameG" value="${SameGenre}"/>
<c:set var="session" value="${session }" /> 
<script type="text/javascript">
	const path = "<%= request.getContextPath()%>/";
</script> 	 
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
<body>
<!-- 구매 하단 호버 바 -->
<input type="hidden" id="bookNo" value="${book.bookNo }">
<input type="hidden" id="memberNo" value="${session.memberNo }">
<input type="hidden" id="memberId" value="${session.memberId }">
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
				<div class="RoundBox_m" id="dibsLogin" onclick="needLogin();">
  					<img id="heartIcon" src="resources/img/heart.png" width="23px;">
				</div>
			</c:when>
			<c:when test="${!empty session.memberId }">
				<div class="RoundBox_m" id="dibs" onclick="toggleLike();">
  					<img id="heartIcon" src="resources/img/heart.png" width="23px;">
				</div>
			</c:when>
		</c:choose>

			<c:choose>
				<c:when test="${empty session.memberId }">
					<div class="RoundBox_l_white" onclick="needLogin();">장바구니</div>
				</c:when>
				<c:when test="${!empty session.memberId }">
					<div class="RoundBox_l_white" onclick="cart_1()">장바구니</div>
				</c:when>
			</c:choose>
			
			<c:choose>
				<c:when test="${empty session.memberId }">
					<div class="RoundBox_l_white" onclick="needLogin();">바로구매</div>
				</c:when>
				<c:when test="${!empty session.memberId }">
					<div class="RoundBox_l" onclick="directBuy()">바로구매</div>
				</c:when>
			</c:choose>
	</div>
</div>

<div id="needLoginPopup"  class="needLoginPopup"	hidden>
	<div class="LoginPopupBox">
		<p>로그인 후 이용가능합니다.</p>
		<p style="margin-bottom: 40px; font-weight: 100;">로그인 페이지로 이동하시겠습니까?</p>
		<div class="row">
			<div class="RoundBox1" onclick="needLogin();">취소</div>
			<div class="RoundBox2" onclick="location.href='login.go'">확인</div>
		</div>
	</div>
</div>
<!-- 구매 하단 호버 바 End-->

<!-- 		Incloud Top Area		 -->

		<jsp:include page="../top/top.jsp" />

		<jsp:include page="../top/floating.jsp" />
		
<div class="container align-content-center" style="min-width:1250px; z-index: 101;"><!-- 가로폭 컨테이너 -->
		
<div>
	<ul class="cateBar" >
		<li><a class="homeIcon" href="<%=request.getContextPath()%>/" ></a></li>
		<li><a href="#">${book.bookCategory }
		<img style="width:18px; vertical-align: sub;" id="categoryIco1" src="resources/img/pointIco.png" onclick="resetActivePopup(),togglePopup('catePopup1', 'categoryIco1', 'resources/img/pointIco.png', 'resources/img/pointIco_active.png')">&nbsp;/
		</a></li>
		<li><a href="#">${book.bookGenre }
		<img style="width:18px; vertical-align: sub;" id="categoryIco2" src="resources/img/pointIco.png" onclick="resetActivePopup(),togglePopup('catePopup2', 'categoryIco2', 'resources/img/pointIco.png', 'resources/img/pointIco_active.png')">&nbsp;
		</a></li>
	</ul>
	<!-- 히든팝업1 -->
	<div id="catePopup1" hidden >
		<a href="${path }tolist.go?bookCategory=국내도서" class="hover_bold"><span>국내도서</span></a>
		<a href="${path }tolist.go?bookCategory=해외도서" class="hover_bold"><span>해외도서</span></a>
		<a href="${path }tolist.go?bookCategory=일본도서" class="hover_bold"><span>일본도서</span></a>
	</div>
	
	<!-- 히든팝업2 -->
	<div id="catePopup2" hidden>
		<a href="${path }genreList.go?bookCategory=국내도서 &bookGenre=문학" class="hover_bold"><span>문학</span></a>
		<a href="${path }genreList.go?bookCategory=국내도서 &bookGenre=역사" class="hover_bold"><span>역사</span></a>
		<a href="${path }genreList.go?bookCategory=국내도서 &bookGenre=자기계발" class="hover_bold"><span>자기계발</span></a>
		<a href="${path }genreList.go?bookCategory=국내도서 &bookGenre=취미" class="hover_bold"><span>취미</span></a>
		<a href="${path }genreList.go?bookCategory=국내도서 &bookGenre=참고서" class="hover_bold"><span>참고서</span></a>
		<a href="${path }genreList.go?bookCategory=국내도서 &bookGenre=공포" class="hover_bold"><span>공포/호러</span></a>
	</div> 
</div>

<h2 class="pt-4 pb-4 text-center" style="font-weight: 700;">${book.bookName}</h2>
	<div class="row justify-content-sm-between" style=" padding:10px;" >
	
		<div class="flex-column pt-5" style="width:330px; ">
			
			<p style="font-size: 16px; font-weight: 600;" class="text-left">
				${book.bookWriter} 저자(글)
			</p>
			<p style="color: gray; font-size: 15px; font-weight: 500;" class="text-left">
			${book.bookTrans} · ${book.bookRelDate}  
			</p>
			<c:if test="${book.bookWeekBest == 1 }">
				<div class="book_best_box">
					<img src="resources/img/trophyIco.png" style="width:20px; height: 20px;"> &nbsp;
					<a href="#" style="text-decoration: none; color: #404040; font-weight: 600;" >주간 베스트 TOP 10</a> 
				</div>
			</c:if>
				<div style="border-bottom :1px solid #eaeaea; border-top :1px solid #eaeaea; height: auto;" class="text-left">
				<br>
				
				<p style="color: #4dac27; font-weight: 600;">추천해요</p>
				<div class="prod_review_box">
					<div class="col_review">
						<div class="progress" style="background-color: #dbdbdbd1;border-radius: 1em;">
							  <div class="progress-bar bg-success" role="progressbar" style="width:${perR.like_percentage}%; background-color: #6dd046!important;" aria-valuenow="${perR.like_percentage}" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
				
					</div>
				</div>	  	
					<p style="color: gray; font-size: 13px; margin-top:10px; font-weight: 600;">
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
						<img style="box-shadow: 0px 0px 15px 0px rgb(0 0 0 / 7%); transform: translate(0%, 2%); height: 480px;"
							src="${book.bookCover }"
							alt="${book.bookName}" />
					</div>
					<c:if test="${!empty book.bookImg1}">
					<div class="carousel-item" style="height: 500px;">
						<img style="box-shadow: 0px 0px 15px 0px rgb(0 0 0 / 7%); transform: translate(0%, 2%); height: 480px;"
							src="${book.bookImg1 }"
							alt="${book.bookName}" />
					</div>
					</c:if>
					<c:if test="${!empty book.bookImg2}">
					<div class="carousel-item" style="height: 500px;">
						<img style="box-shadow: 0px 0px 15px 0px rgb(0 0 0 / 7%); transform: translate(0%, 2%); height: 480px;"
							src="${book.bookImg2 }"
							alt="${book.bookName}" />
					</div>
					</c:if>
					<c:if test="${!empty book.bookImg3}">
					<div class="carousel-item" style="height: 500px;">
						<img style="box-shadow: 0px 0px 15px 0px rgb(0 0 0 / 7%); transform: translate(0%, 2%); height: 480px;"
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

			<div class="flex-column pt-5" style="width:330px;">
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
					<p style="font-size: 20px;  font-weight: 600;">${book.bookName}</p>
						<p style="font-size: 1.7em; " class="text-left">
							<span style="color: #4dac27; font-weight: 600; ">10%</span>
							<span style="font-weight: 600; ">
								<fmt:formatNumber>${book.bookPrice - ( book.bookPrice * 0.1 )} </fmt:formatNumber>원		<!-- 10%할인률 적용된 가격 -->
							</span>
							<span style="font-size: 0.6em; color: gray; text-decoration: line-through;">
							<fmt:formatNumber>${book.bookPrice} </fmt:formatNumber>원</span>		<!-- 도서 판매가 -->
						</p>
				</div>
				
				<div style="border-bottom :1px solid #eaeaea; border-top :1px solid #eaeaea; 
				height: auto; padding:20px 0;  font-weight: 600; " class="text-left">
						<span style="font-size: 1em;">적립 / 혜택</span>
						<span style="color: #4dac27; margin-left: 170px;">
							<fmt:formatNumber>${book.bookPrice * 0.05 }</fmt:formatNumber>P</span>
						<img style="width:22px" id="pointIco" src="resources/img/pointIco.png" onclick="togglePopup('popupPoint', 'pointIco', 'resources/img/pointIco.png', 'resources/img/pointIco_active.png')">
			<!-- 팝업 -->		
			<div id="popupPoint" hidden 
					style="position: absolute; background-color: white; border: 1px solid black;
							width:330px; border-radius: 0.5em; margin-top:10px; padding:20px; 
							box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3); ">
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
							<span style="font-size: 13px; line-height: 19px;  letter-spacing: -0.01em; margin-bottom: 6px; color:#595959; margin-left: 18px;"><fmt:formatNumber>${book.bookPrice * 0.05 }</fmt:formatNumber>P</span>
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
				<div style="border-bottom :1px solid #eaeaea; height: auto; font-size: 1em;  font-weight: 600; " class="text-left">
					<br>
						<span>배송안내</span>
						<div class="float-right"><span style="font-size: 13px; margin-left: 53px;">도서 포함 15,000원 이상 무료배송 </span>
						<img style="width:18px" id="drvInfoIco" src="resources/img/infoIco.png" onclick="togglePopup('popupDrvInfo', 'drvInfoIco', 'resources/img/infoIco.png', 'resources/img/infoIco_active.png')"></div>
						<p style="text-align: right;">${twoDaysLater} 도착 예정</p>
				</div>
				<!-- 팝업 -->
				<div id="popupDrvInfo" hidden 
					style="position: absolute; background-color: white; border: 1px solid black;
							width:330px; border-radius: 0.5em; margin-top:-10px; padding:20px; 
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
			<span style="font-size: 13px;  font-weight: 600; ">매장 &nbsp;재고·위치</span>
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
	                <li class="tab_item"><a href="#totalReviewNum" ><span class="tab_text">리뷰(${reviewCount})</span></a></li>
	                <li class="tab_item" ><a href="#ExchangeInformation" ><span class="tab_text">교환/반품/품절</span></a></li>
	            </ul>
       		</div>
       		
       		<div  class="detail_info_main mb-5">
       			<section class="detail_info_main" id="book_detail_info_event" >
       						<div class="row borderRoundGray_bg">
       						<h3 style="width: 100%;">다른 ${book.bookGenre } 도서<a class="moreBtn_ml" href="#">더보기 ></a></h3>
						<c:forEach  items="${SameG }" var="same">
							<div class="column ailgn-content-center pl-1">
								<div class="px-1 my-2">
									<img style="border-radius: 0;"width="120px" alt="${ same.bookCover}" src="${ same.bookCover}">
								</div>
								<div class="my-2" style="width: 150px;">
										<div class="text-left mt-1 mb-2 pr-4"  style="font-weight: 600; "><a style="color:black; " href="${path }bookDetail.go?bookNo=${same.bookNo}">${ same.bookName}</a></div>
										<div style="  font-size: 0.8em; font-weight: 400;" class="text-left mb-1 pr-4">${ same.bookWriter}</div>
										<div class="text-left mb-2 pr-3" style="font-size: 0.9em;  font-weight: 600;  ">
										<span style="color: #4dac27; font-size: 1em; ">10%</span>
										<fmt:formatNumber>${ same.bookPrice}</fmt:formatNumber>원
										</div>
								</div>
							</div>
						</c:forEach>
					</div>
       			</section>
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
       						<div id="totalReviewNum" ></div>
       				<p>${book.bookCont }</p>
       			</section>
       			<!-- 하단 리뷰영역 -->
       			<section>
       			<div class="reviewBox row">
       				<div class="reviewBoxTop">
	       				<div class="BorderBlackBottomText">전체 리뷰(<span id="totalReviewNum" >${reviewCount}</span>)</div>
	       				<div>
	       					<c:choose>
								<c:when test="${empty session.memberId }">
									<button class="writeBtn"  onclick="needLogin();">
										<span class="writeIco"></span>	       				
										<span>리뷰 작성</span>	       				
				       				</button>
								</c:when>
								<c:when test="${!empty session.memberId }">
									<button class="writeBtn"  onclick="reviewPopup();">
										<span class="writeIco"></span>	       				
										<span>리뷰 작성</span>	       				
				       				</button>
								</c:when>
							</c:choose>
	       				</div>
       				</div>
					<div class="reviewBoxBottom" id="reviewInnerAjax">
					<c:if test="${empty reviewList }">
						<div class="flex_center_center p-5">
							<img class="mb-2" width="36px" src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/ico_nodata@2x.png">
							<p class="flex_center_center">이 상품의 첫 리뷰어가 되어주세요.</p>
						</div>
					</c:if>
							<c:forEach  items="${reviewList }" var="rView">
								<div class="reviewBlock">
									<div class="container">
										<p>
											<span class="reviewBuyerBox">구매자</span>
											<span class="smallTextGray mr-1">${rView.memberId }</span>
											<span class="smallTextGray mr-1">${rView.reviewRegdate }</span>
											<span class="smallTextGray mr-1">${rView.reviewTitle }</span>
											<c:if test="${rView.recommend == true }">
												<span class="recommend_img"></span>
											</c:if>
											<c:if test="${rView.recommend == false }">
												<span class="notRecommend_img"></span>
											</c:if>
										</p>
									</div>
									<div class="container"><p class="TextGray">${rView.reviewCont }</p></div>
								</div>
							</c:forEach>
					</div>
					
       			</div>
       			</section>
       			<!-- 하단 리뷰영역 End -->
       			<section>
       				<div class="infoBoxTop row" id="ExchangeInformation">
	       				<div class="BorderBlackBottomText2 mt-5">교환/반품/품절 안내</div>
       						<div class="reviewBlock-info">
									<div class="container">
											<p class="bold-font">반품/교환방법</p>
											<p class="TextGray">마이룸 > 주문관리 > 주문/배송내역 > 주문조회 > 반품/교환 신청, [1:1 상담 > 반품/교환/환불] <br>또는 고객센터 (1544-1900)
											* 오픈마켓, 해외배송 주문, 기프트 주문시 [1:1 상담>반품/교환/환불] 또는 고객센터 (1544-1900)</p>
									</div>
							</div>
							<div class="reviewBlock-info">
									<div class="container">
											<p class="bold-font">반품/교환가능 기간</p>
											<p class="TextGray">변심반품의 경우 수령 후 7일 이내,<br>
														상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내</p>
									</div>
							</div>
							<div class="reviewBlock-info">
									<div class="container">
											<p class="bold-font">반품/교환비용</p>
											<p class="TextGray">변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</p>
									</div>
							</div>
							<div class="reviewBlock-info">
									<div class="container">
											<p class="bold-font">반품/교환 불가 사유</p>
											<p class="TextGray">
															1) 소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br>
															(단지 확인을 위한 포장 훼손은 제외)<br>
															2) 소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br>
															예) 화장품, 식품, 가전제품(악세서리 포함) 등<br>
															3) 복제가 가능한 상품 등의 포장을 훼손한 경우<br>
															예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집<br>
															4) 소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)<br>
															5) 디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우<br>
															6) 시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우<br>
															7) 전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는 경우<br>
											</p>
									</div>
							</div>
							<div class="reviewBlock-info">
									<div class="container">
											<p class="bold-font">상품 품절</p>
											<p class="TextGray">공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는 이메일과 문자로 안내드리겠습니다.</p>
									</div>
							</div>
							<div class="reviewBlock-info">
									<div class="container">
											<p class="bold-font">소비자 피해보상 환불 지연에 따른 배상</p>
											<p class="TextGray">1) 상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁 해결 기준 <br>
											(공정거래위원회 고시)에 준하여 처리됨<br>2) 대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 처리함</p>
									</div>
							</div>
						</div>
       			</section>
       		<div  class="mb-5 px-2"></div>
       		</div>
       		
       		<!-- 상세페이지 오른쪽 사이드바 -->
			<div class="detail_info_side">
				<section class="container pb-4 mt-md-3">
					<h5 class="h5 text-left pb-2">
						추천 이벤트<a class="moreBtn" href="#">더보기 ></a>
					</h5>
					<div class="owl-carousel "  data-owl-carousel='{ "nav": false, "dots": false, "loop": true, "margin": 10, "autoplay": true, "autoplayTimeout": 4000, "responsive": {"0":{"items":1},"630":{"items":2},"991":{"items":3},"1200":{"items":1}} }'>
					  <img style="border-radius: 1em; width: 260px;" src="https://contents.kyobobook.co.kr/pmtn/2022/event/e5f1a5ef6cd54ce98f602ec3402d617e.jpg"/>
					  <img style="border-radius: 1em; width: 260px;"  src="https://contents.kyobobook.co.kr/pmtn/2022/event/bd59a332c04b48d6abd7d0bfe570d4e5.jpg"/>
					  <img style="border-radius: 1em; width: 260px;"  src="https://contents.kyobobook.co.kr/pmtn/2022/event/3c10e5972f304d62b73ade3f936d8b8a.jpg"/>
					  <img style="border-radius: 1em; width: 260px;"  src="https://contents.kyobobook.co.kr/pmtn/2022/event/c3402a1bfc38412d8b8975f9305e13d5.jpg"/>
					  <img style="border-radius: 1em; width: 260px;"  src="https://contents.kyobobook.co.kr/pmtn/2022/event/a87a5c2bdbfe4d2cab152b0f0ab166dd.jpg"/>
					</div>
				</section>
				<section>
				<div class="container pb-4 mt-3">
					<h5 class="h5 text-left pb-2">
						새로 나온 책<a class="moreBtn" href="#">더보기 ></a>
					</h5>
					<div class="row">
						<c:forEach  items="${newB }" var="newBook">
							<div class="row ailgn-content-center pl-4">
								<div class="px-2 my-2">
									<img width="120" alt="${ newBook.bookCover}" src="${ newBook.bookCover}">
								</div>
								<div class="px-2 my-2" style="width: 150px;">
										<div class="text-left mt-4 mb-2"  style="font-weight: 600; ">
										<a style="color:black; " href="${path }bookDetail.go?bookNo=${ newBook.bookNo}">${ newBook.bookName}</a></div>
										<div style="  font-size: 0.8em; font-weight: 400;" class="text-left mb-2">${ newBook.bookWriter}</div>
										<div class="text-left mb-2" style="font-size: 0.9em;  font-weight: 600;  ">
										<span style="color: #4dac27; font-size: 1em; ">10%</span>
										<fmt:formatNumber>${ newBook.bookPrice}</fmt:formatNumber>원
										</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				</section>
			</div>
		</div>		<!-- flex row container -->
</div>		<!-- width 1250 container -->

		<!-- 리뷰작성 팝업 -->
	<div id="reviewPopup"  class="needLoginPopup" hidden>
 		<div class="reviewWritePop mt-3">
		 		<div>
					<input type="hidden" id="bookNo" name="bookNo" value="${book.bookNo }">
					<input type="hidden" id="memberNo" name="memberNo" value="${session.memberNo }">
					<div><p>리뷰작성<span class="xIcon"></span></p></div>
					<!-- 책정보 -->
					<div class="borderRoundGray">
							<div class="row ailgn-content-center pl-4">
								<div class="px-2 my-2">
									<img width="120" alt="${ book.bookCover}" src="${ book.bookCover}">
								</div>
								<div class="px-2 my-2" style="width: 150px;">
									<div class="text-left mt-4 mb-2" style="font-weight: 800; font-size: 1.1em; ">${ book.bookName}</div>
									<div style=" font-size: 0.95em; font-weight: 400; "
										class="text-left mb-2">${ book.bookWriter}</div>
									<div class="text-left mb-2" style="font-size: 1em; font-weight: 800; ">
										<span style="color: #4dac27; font-size: 1em;">10%</span>
										<fmt:formatNumber>${ book.bookPrice}</fmt:formatNumber>
										원
									</div>
								</div>
							<div class="likeCheckBox" id="likeCheckBox" onclick="checkLike( 'resources/img/Bad.png' , 'resources/img/Good.png' )">
								<img id="LikePng" width="80px" src="resources/img/Bad.png">
								<input id="checkBox" name="likeCheck" type="radio" value="false" hidden>
							</div>
							</div>
					</div>
					<!-- 책정보 -->
					<div class="mt-4"><p class="mb-2">리뷰작성<span style="color:#3c9a17; ">*</span></p></div>
					<div class="borderRoundGray">
						<input type="text" id="reviewTitle" class="reviewWriterTitleInput" 
						placeholder="소제목을 입력해주세요.">
					</div>
					<div class="borderRoundGray mt-2">
						<input type="text" id="reviewCont" class="reviewWriterInput" 
						placeholder="내용을 10자 이상 입력해주세요. ">
					</div>
					
						<div class="row justify-content-center mt-4">
							<div class="RoundBox1" onclick="reviewPopup();">취소</div>
							<div class="RoundBox2" onclick="insertReview();">등록</div>
						</div>
				</div>
		</div>
	</div>
		<!-- 리뷰작성 팝업 End-->
		
		<!-- 		Incloud Footer Area		 -->
	<jsp:include page="../top/footer.jsp" />
		
	<script src="resources/js/book/bookDetail.js"></script>	
    <script src="resources/js/vendor.min.js"></script>
    <script src="resources/js/theme.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=5vpu3ugfk8"></script>
    <script src="resources/js/book/naverMap.js"></script>
 
	<script>
	
	/* 전역으로 사용 start */
	var bookNo = "${book.getBookNo()}";
	var memberId = "${session.getMemberId() }";
	var cartPrice = null;
	var cartQuantity = null;
	/* 전역  사용 end */

	function updateTotalPrice() {
		
	  var originalPrice = ${book.bookPrice };
	  var discount = 0.1;
	  var bookQuantity = parseInt(document.getElementById("numberDisplay").innerText);

	  var discountedPrice = originalPrice - (originalPrice * discount);
	  var unDiscountedPrice = originalPrice;
	  var totalPrice = discountedPrice * bookQuantity;
	  var totalPrice2 = unDiscountedPrice * bookQuantity;

	  document.getElementById("totalPrice").innerText = totalPrice.toLocaleString();
	  document.getElementById("totalPrice2").innerText = totalPrice2.toLocaleString();

	  // cartPrice와 cartQuantity에 값 할당
	  cartPrice = totalPrice;
	  cartQuantity = bookQuantity;
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

	updateTotalPrice();

	function cart_1(){
	  // cartPrice와 cartQuantity를 미리 할당
	  location.href = 'cart.go?bookNo=' + bookNo + '&memberId=' + memberId + '&totalPrice=' + cartPrice + '&cartCount=' + cartQuantity;
	}
	
	function directBuy(){
	  // cartPrice와 cartQuantity를 미리 할당
	  location.href = 'directBuy.go?bookNo=' + bookNo + '&memberId=' + memberId + '&totalPrice=' + cartPrice + '&cartCount=' + cartQuantity;
	}

</script>
</body>
</html>