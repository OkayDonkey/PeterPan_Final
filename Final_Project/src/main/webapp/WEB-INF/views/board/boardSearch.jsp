<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/hatLogo1.png" />
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/theme.min.css" />
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/vendor.min.css" />
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/board/mainboard.css"/>
<meta charset="UTF-8">
<title>고객센터 - 피터팬</title>
</head>
<script type="text/javascript" src="resources/js/board/boardFAQ.js"></script>
<body>

	<!-- 상단 네비바  -->
	<jsp:include page="./../top/top.jsp" />

	<!-- 화면 나누기 구성 -->
	<div class="container align-content-center" style="min-width: 1200px;">
		<div class="row justify-content-sm-between" style="width: 1200px;">
	
			<!-- 왼쪽 메뉴바 -->
			<jsp:include page="../boardInclude/boardLeft.jsp" />
			
			<!-- 창마다 바뀜 -->
			<div class="main" style="width: 900px; font-size: 24px; color: black">
				<div class="main_heading">
					<h2 class="main_heading_1" >자주 묻는 질문</h2>
				</div>
			<!-- 검색창 -->
			<div>
				<div>
					<h2 class="title_heading">질문 검색</h2>
				</div>
	
				<!-- 검색창 -->
				<form method="post" action="<%=request.getContextPath()%>/board_search.go?boardArea=FAQ">
					<div class="input_text_box">
						<div class="input_btn_box">
							<div class="form_ip_search">
								<input type="search"  name="keyword" class="form_ip"  title="자주 묻는 질문" placeholder="질문을 검색해 보세요.">
							</div>
							<div class="form_btn">
								<button type="submit" class="btn">
									<span class="text">검색</span>
								</button>
							</div>
						</div>
					</div>
				</form>
				
				<div class="asked_category_list">
						<ul class="tab_menu">
							<li class="tab_item"><a class="tab_a" href="#">BEST 10</a></li>
	
							<li class="tab_item"><a class="tab_a" href="#">회원</a></li>
	
							<li class="tab_item"><a class="tab_a" href="#" >도서/상품정보/교과서</a></li>
	
							<li class="tab_item"><a class="tab_a" href="#">주문/결제</a></li>
	
							<li class="tab_item"><a class="tab_a" href="#">배송/수령일 안내</a></li>
	
							<li class="tab_item"><a class="tab_a" href="#">반품/교환/환불</a></li>
	
							<li class="tab_item"><a class="tab_a" href="#">서비스</a></li>
	
							<li class="tab_item"><a class="tab_a" href="#">eBook</a></li>
						</ul>
					</div>
			</div>
			
				<!-- 아코디언 형식 리스트 -->	
				<c:set value="${searchList }" var="List"/>
				<c:if test="${empty List}">
					<div id="title_category">
						<p class="category_title">검색결과 <span class="number">0</span>건</p>
					</div>
				</c:if>	
				<c:if test="${!empty List}">
					<div id="title_category">
						<p class="category_title">검색결과 <span  class="number">${List.size()}</span>건</p>
					</div>
						 <div id="accordion">
						<c:forEach items="${List }" var="dto">
						    <div class="card">
						      <button class="card-header" data-toggle="collapse" data-target="#collapse${dto.boardNO}" aria-expanded="false" aria-controls="collapse${dto.boardNO}" onclick="closeOtherAccordions(this)">
						        <span class="Q">Q</span>
						        <span class="acodianCategoryTitle">${dto.boardTitle}</span>
						      </button>
						      <div id="collapse${dto.boardNO}" class="collapse" aria-labelledby="heading${dto.boardNO}" data-parent="#accordion" style="padding: 0px 10px 30px 10px;">
						        <div class="card-body">${dto.boardContent}</div>
						      </div>
						    </div>
						</c:forEach>
						  </div>
				</c:if>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/js/board/searchboardFAQ.js"></script>
	
	
	<!-- <div class="category_title">[bestTitle]</div>

<div class="card">
  <button class="card-header" id="[heading + dto.boardNO]" data-toggle="collapse" data-target="[collapse + dto.boardNO]" aria-expanded="true" aria-controls="[collapse + dto.boardNO]" style="outline: none; width: 100%;">
    <span class="Q">Q</span>
    <span class="acodianCategoryTitle">[dto.boardTitle]</span>
  </button>
  <div class="collapse" id="[collapse + dto.boardNO]" aria-labelledby="[heading + dto.boardNO]" data-parent="#accordion" style="padding: 0px 10px 30px 10px;">
    <div class="card-body">[dto.boardContent]</div>
  </div>
</div> -->
	
	
	
	<!-- footer -->
	<jsp:include page="./../top/footer.jsp" />
</body>
</html>