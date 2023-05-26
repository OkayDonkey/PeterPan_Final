<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/hatLogo1.png" />
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/theme.min.css" />
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/vendor.min.css" />
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/board/mainboard.css"/>
<meta charset="UTF-8">
<title>고객센터 - 피터팬</title>
</head>
<script type="text/javascript" src="resources/js/board/boardFAQ.js"></script>
<body>

	<input type="hidden" id="category" value="${category }">

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
	
				<div class="input_text_box">
					<div class="input_btn_box">
						<div class="form_ip_search">
							<input type="search" class="form_ip" title="자주 묻는 질문"
								placeholder="질문을 검색해 보세요.">
						</div>
						<div class="form_btn">
							<button type="button" class="btn">
								<span class="text">검색</span>
							</button>
						</div>
					</div>
				</div>
				
				<div class="asked_category_list">
						<ul class="tab_menu">
							<li class="tab_item"><a class="tab_a" id="clicked" href="#">BEST 10</a></li>
	
							<li class="tab_item"><a class="tab_a"  href="#">회원</a></li>
	
							<li class="tab_item"><a class="tab_a"  href="#" >도서/상품정보/교과서</a></li>
	
							<li class="tab_item"><a class="tab_a"  href="#">주문/결제</a></li>
	
							<li class="tab_item"><a class="tab_a"  href="#">배송/수령일 안내</a></li>
	
							<li class="tab_item"><a class="tab_a"  href="#">반품/교환/환불</a></li>
	
							<li class="tab_item"><a class="tab_a"  href="#">서비스</a></li>
	
							<li class="tab_item"><a class="tab_a"  href="#">eBook</a></li>
						</ul>
					</div>
			</div>
			
			<!-- 아코디언 형식 리스트 -->	
				<div id="title_category">
					<p class="category_title"></p>
				</div>
				<div id="accordion"></div>	
			<!-- <script type="text/javascript" src="resources/js/board/boardFAQ.js"></script> -->
			
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="./../top/footer.jsp" />

</body>

<!-- JavaScript -->


</html>