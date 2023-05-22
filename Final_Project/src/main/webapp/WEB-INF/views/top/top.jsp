<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 부트스트랩 JS -->
<script src="resources/js/vendor.min.js"></script>
<script src="resources/js/theme.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" media="screen" id="main-styles"
	href="resources/css/theme.min.css" />
<link rel="stylesheet" media="screen" id="main-styles"
	href="resources/css/vendor.min.css" />
<style>
.header {
	width: 100%;
	
}
.login{
	display:inline-block;
	width:150px;
	z-index: 0;
	display: flex;
	position: absolute;
	top: 0;
	right: 10;
	
}
.login a{
	color:gray;
	text-decoration: none;
	width: 70px;
}
.login a :hover{
	border-bottom: 1px solid black;
}

.login input {
	border: none;
	color:gray;
	background: none;

}
.my_info{
	z-index:0;
	display: flex;
}

.my_info img{
margin-left:5px;
	width: 100px;
	height:50px;
}
.my_info img{
margin-right: 5px;
margin-left: 5px;
}
</style>

<body>

<%-- 

 	<c:if test="${sessionScope.Id == null }">
		<input type="button" value="로그인" onclick="location.href='login.go'">
	</c:if>

	<c:if test="${sessionScope.Id != null }">
		<input type="button" value="로그아웃" onclick="location.href='logout.go'">
	</c:if>

 --%>
	<header class="navbar navbar-expand-lg navbar-light bg-light header" style="position: fixed;top: 0;">


		<div class="container-fluid navbar-inner" style="height: 150px;">
			<!-- navbar brand-->
			<a class="navbar-brand" style="min-width: 100px"
				href="<%=request.getContextPath()%>/"> 
				<img src="resources/css/s_img/logo.png" style="margin-left:150px; width: 140px;
   																							 height: 150px;"alt="Fooding" />
			</a>
			<!-- navbar collapse area-->


			<!-- navbar buttons-->
			<div class="navbar-btns mt-3" style="left: 650px;margin-bottom: 25px;">
				<div class="navbar-btns-inner">
					<div class="navbar-toggler navbar-btn collapsed"
						data-toggle="collapse" data-target="#menu">
						<i class="mx-auto mb-1" data-feather="menu"></i>Menu
					</div>
					<form method="post"
						action="<%=request.getContextPath()%>/total_main_search.go">
						<!--서치 링크-->
						<div class="flex-grow-1 pb-3 my-1 pr-lg-4 order-sm-2" style="border: 1px solid black; border-radius: 40px;width:800px;padding-top: 16px;height: 70px;">
							<div class="input-group flex-nowrap">
								<div class="input-group-prepend" style="align-content: center;">
									
									<input type="text"
											style="width:700px;height: 45px;border: none;margin-left:20px;">
									<input type="image" src="resources\css\s_img\ser_img.png" alt="제출버튼" 
										style="border-top-left-radius: 20px;border-bottom-right-radius: 20px; bg-coloer:white;width:45px;height:37px;">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>


			<div class="collapse navbar-collapse" id="menu"
				style="top: 100px; margin-top: 100px;margin-left: 650px;">
				<!-- Site menu-->
				<ul class="navbar-nav">
					<li class="nav-item dropdown mega-dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
						style="padding: 1em;">카테고리</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<div class="dropdown-column">
									<div
										class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3"
										style="background-image: url(img/megamenu/cat_bg02.jpg)">
										<h3 class="h5 text-white text-shadow my-3">국내</h3>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href="SearchKeyRestaurant.do?keyword=서울"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">문학</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=경기"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">취미</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=인천"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">역사</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=대구"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">외국어</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=부산"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">참고서</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=제주"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">자기개발</span></a></li>
										</ul>
									</div>
								</div>

								<div class="dropdown-column">
									<div
										class="bg-position-center bg-	no-repeat bg-size-cover text-center px-3 py-4 mb-3"
										style="background-image: url(img/megamenu/cat_bg01.jpg)">
										<h3 class="h5 text-white text-shadow my-3">일본</h3>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href="SearchKeyRestaurant.do?keyword=데이트"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">문학</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=가족"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">공포/호러</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=뷰"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">취미</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=전통"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">자기개발</span></a></li>

										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div
										class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3"
										style="background-image: url(img/megamenu/cat_bg03.jpg)">
										<h3 class="h5 text-white text-shadow my-3">서양</h3>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href="SearchKeyRestaurant.do?keyword=고기"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">문학</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=한식"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">공</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=양식"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">취미</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=일식"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">자기개발</span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div></li>
					<li class="nav-item dropdown mega-dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
						style="padding: 1em;">게시판</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<div class="dropdown-column">
									<div class="widget widget-links">
										<h3 class="widget-title">게시판</h3>
										<ul>
											<li><a
												href="<%=request.getContextPath()%>/review_board.do"> <i
													class="widget-categories-indicator"
													data-feather="chevron-right"> </i><span
													class="font-size-sm">후기 게시판</span></a></li>
													
													
											<li><a href="<%=request.getContextPath()%>/boardPage.go"> <i				
													class="widget-categories-indicator"
													data-feather="chevron-right"> </i><span
													class="font-size-sm">자유 게시판-지영</span></a></li>
													
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div class="widget widget-links">
										<h3 class="widget-title">리뷰 남기기</h3>
										<ul>

											<li><a href="board_write.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">리뷰
														작성 </span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						</li>

					<%
						if (session.getAttribute("id") != null) {
					%>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle"
						href="<%=request.getContextPath()%>/member_profile.do"><i
							class="mr-1"></i>마이페이지</a></li>

					<%
						}
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" style="padding: 1em;"
						href="LoadRestaurantList.do"><i class="mr-1"></i>레스토랑</a></li>
				</ul>
			</div>
				<div class ="login">

						<a href="$">회원가입</a>					
					
					<%--  	<c:if test="${sessionScope.Id == null }">
							<input type="button" value="로그인" onclick="location.href='login.go'">
						</c:if>
				
						<c:if test="${sessionScope.Id != null }">
							<input type="button" value="로그아웃" onclick="location.href='logout.go'">
						</c:if> --%>
						
						<c:set var="session" value="${session }" />
						<c:if test="${session.memberNo == null }">
						    <input type="button" value="로그인" onclick="location.href='login.go'">
						</c:if>
						
						<c:if test="${session.memberNo != null }">
						    <input type="button" value="로그아웃" onclick="location.href='logout.go'">
						</c:if>
						
				</div>
				<div class="my_info">
					<a href="#">
					<img src="resources\css\s_img\us23.png">
					</a>
					<a href="#">
					<img src="resources\css\s_img\cart_b.png">
					</a>
				</div>

		</div>
		
	</header>
		<div style="margin:200px; ">
		
		</div>