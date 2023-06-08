<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/hatLogo1.png" />
<meta charset="UTF-8">
<title>고객센터 - 피터팬</title>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/theme.min.css" />
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/vendor.min.css" />
</head>
<body>
	
	<!-- 상단 네비바  -->
	<jsp:include page="./../top/top.jsp" />

	<!-- 화면 나누기 구성 -->
	<div class="container align-content-center" style="min-width: 1200px;" id="totalBoard">
	<div class="row justify-content-sm-between" style="width: 1200px; padding-bottom: 100px;">

		<!-- 왼쪽 메뉴바 -->
		<jsp:include page="../boardInclude/boardLeft.jsp" />
			
			<!-- 오른쪽 메뉴바 -->
			<!-- 창마다 바뀜 -->
			<div class="main" style="width: 900px;">
				<div class="main_heading">
					<span class="main_heading_1">무엇을 도와드릴까요?</span><br>
					<span class="main_heading_2">피터팬 고객센터</span>
					<span class="main_heading_1">입니다.</span>
			</div>
				
				<div>
					<div>
						<h2 class="title_heading">자주 묻는 질문</h2>
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
						<ul>
							<li><a href="<%=request.getContextPath() %>/boardFAQ.go?category=BEST 10">BEST 10</a></li>

							<li><a href="<%=request.getContextPath() %>/boardFAQ.go?category=회원">회원</a></li>

							<li><a href="<%=request.getContextPath() %>/boardFAQ.go?category=도서/상품정보/교과서">도서/상품정보/교과서</a></li>

							<li><a href="<%=request.getContextPath() %>/boardFAQ.go?category=주문/결제">주문/결제</a></li>

							<li><a href="<%=request.getContextPath() %>/boardFAQ.go?category=배송/수령일 안내">배송/수령일 안내</a></li>

							<li><a href="<%=request.getContextPath() %>/boardFAQ.go?category=반품/교환/환불">반품/교환/환불</a></li>

							<li><a href="<%=request.getContextPath() %>/boardFAQ.go?category=서비스">서비스</a></li>

							<li><a href="<%=request.getContextPath() %>/boardFAQ.go?category=eBook">eBook</a></li>
						</ul>
					</div>
		
				</div>

				
				<div>
					<h2 class="title_heading">1:1 문의</h2>
				</div>
				<div class="customer_wrap">
					<div class="boxbg">
						<a href="<%=request.getContextPath() %>/boardQna.go" class="inquiry"><span class="ico_inquiry01"></span>
							<p class="name">1:1 문의 접수</p>
						</a> 
						<a href="<%=request.getContextPath() %>/myPage.go" class="inquiry" style="border-left: 1px solid #eaeaea;"> 
							<span class="ico_inquiry02"></span>
							<p class="name">1:1 문의 내역</p>
						</a>
					</div>

					<div class="box_1">
						<p class="text">전화 상담</p>
						<a href="#" class="box_num">1544-1900</a>
						<p class="desc">평일 09:00~18:00 <br> (주말 및 공휴일 휴무)</p>
					</div>

					<div class="box_2">
						<p class="title">보이는 ARS</p>
						<p class="desc">
							평일 09:00~18:00 <br> (주말 및 공휴일 휴무)
						</p>
						<a href="<%=request.getContextPath() %>/boardArs.go"><span class="tel_text_1">전화상담서비스 안내도
						<img src="resources/img/icons-tel-text.png" width="10px">
						</span>
						</a>
					</div>
				</div>
				<!-- end. customer_wrap -->

 				<div class="notice_wrap">
					<div class="notice_head">
						<h2 class="title_heading">공지사항</h2>
							<div class="notice_heading">
								<a href="<%=request.getContextPath() %>/board_notice.go"> 
									<span style="color: black;" class="notice_head_more">더보기</span> 
									<span class="notice_head_icon">
										<img src="resources/img/icons-tel-text.png" width="13px">
									</span>
								</a>
							</div>
					</div>
					
					<table class="tbl_col_line">
						<colgroup>
							<col style="width: 125px;">
							<col style="width: 500px;">
							<col style="width: 180px;">
							<col style="width: 174px;">
						</colgroup>
						
						<c:set value="${mainNotice}" var="List"/>
						<c:set value="${mainNotice.size() + 1 }" var="size" />	
						<c:forEach items="${List }"  var="dto"  varStatus="state">
							<tbody class="notice_tbody">
								<tr>
									<td class="fc_light_gray">${size - 3}</td>
									<td class="align_left">
										<a href="<%=request.getContextPath() %>/noticeDetail.go?no=${dto.boardNO }">
										<span class="align_left_text" style="text-decoration: none; padding-left: 10px;">${dto.boardTitle }</span>
										</a></td>
									<td class="fc_light_gray">고객센터</td>
									<td class="fc_light_gray">${dto.boardRegdate }</td>
								</tr>
							</tbody>
								<c:set value="${size + 1}" var="size" />	
						</c:forEach>
					</table>
				</div>


			</div>
			<!-- 오른쪽 끝 -->
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="./../top/footer.jsp" />

</body>

<!-- 부트스트랩 JS -->
<script src="resources/js/vendor.min.js"></script>
<script src="resources/js/theme.min.js"></script>

<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/board/mainboard.css"/>
</html>