<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 부트스트랩 JS -->
<script src="resources/js/vendor.min.js"></script>
<script src="resources/js/theme.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" media="screen" id="main-styles"
	href="resources/css/theme.min.css" />
<link rel="stylesheet" media="screen" id="main-styles"
	href="resources/css/vendor.min.css" />
	
	
	
<style>

@font-face {
    font-family: 'SUIT-Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Light.woff2') format('woff2');
    font-weight:Light;
    font-style: normal;
}

@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'SUIT-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Bold.woff2') format('woff2');
    font-weight: bold;
    font-style: normal;
}

p, span, button, a, h1, h2, h3, h4, h5, h6, input, label, textarea, td, tr, th, li, ul, ol {
	font-family: 'SUIT-Regular';
}

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
margin-right: 5px;
margin-left: 5px;
width: 60px;
}
</style>

	<script type="text/javascript">
	$(document).ready(funtion(){
		$("#keyboard .keywordlist").hide();
	});
	</script>

<body>

<%-- 

 	<c:if test="${sessionScope.Id == null }">
		<input type="button" value="로그인" onclick="location.href='login.go'">
	</c:if>

	<c:if test="${sessionScope.Id != null }">
		<input type="button" value="로그아웃" onclick="location.href='logout.go'">
	</c:if>

 --%>
	<header class="navbar navbar-expand-lg navbar-light bg-light header" style="position: fixed;top: 0;width: 1400px;margin-left: 13%; ">


		<div class="container-fluid navbar-inner" style="height: 150px;">
			<!-- navbar brand-->
			<div style="width:200px; margin-left: 30px;">
				<a	href="<%=request.getContextPath()%>/"> 
					<img src="resources/css/s_img/logo.png" style=" width: 150px; height: 150px;display: inline-block;" />
				</a>
			</div>
			<!-- navbar collapse area-->


			<!-- navbar buttons-->
			<div class="navbar-btns" style="left: 300px;margin-top: 25px;">
				<div class="navbar-btns-inner">
					<div class="navbar-toggler navbar-btn collapsed"
						data-toggle="collapse" data-target="#menu">
						<i class="mx-auto mb-1" data-feather="menu"></i>Menu
					</div>
					
					<!--  -->
					<form method="post"
						action="<%=request.getContextPath()%>/total_main_search.go">
						<!--서치 링크-->
						<div class="flex-grow-1 my-1 order-sm-2" id="keyboard" style="border: 1px solid black; border-radius: 40px;width:500px;padding-top: 10px;height: 50px;">
							<div class="input-group flex-nowrap keywordlist">
								<div class="input-group-prepend" style="align-content: center;">
									
									<!-- 서치 옵션 -->
									<select name="field">
										<option value="title">제목</option>
										<option value="writer">작가</option>
										<option value="genre">장르</option>
									</select>
									
									<!-- 서치 옵션 end -->
									<input name="keyword"
											style="width:400px;height: 30px;border: none;margin-left:20px;">
									<input type="image" src="resources\css\s_img\ser_img.png" alt="제출버튼" 
										style="border-top-left-radius: 20px;border-bottom-right-radius: 20px; bg-coloer:white;width:34px;height:33px;">
								</div>
							</div>
						</div>
					</form>
					
				</div>
			</div>


			<div class="collapse navbar-collapse" id="menu"
				style="top: 100px; margin-top: 100px;margin-left: 100px;">
				<!-- Site menu-->
				<ul class="navbar-nav">
					<li class="nav-item dropdown mega-dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
						style="padding: 1em;">카테고리</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<div class="dropdown-column">
									<div
										class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3">
										<a href ="<%=request.getContextPath()%>/tolist.go?bookCategory=국내도서 ">
										<h3 class="h5 text-shadow my-3">국내</h3></a>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=문학"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">문학</span></a></li>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=취미"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">취미</span></a></li>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=역사"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">역사</span></a></li>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=외국어"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">외국어</span></a></li>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=참고서"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">참고서</span></a></li>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=자기개발"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">자기개발</span></a></li>
										</ul>
									</div>
								</div>

								<div class="dropdown-column">
									<div
										class="bg-position-center bg-	no-repeat bg-size-cover text-center px-3 py-4 mb-3">
										<a href ="<%=request.getContextPath()%>/tolist.go?bookCategory=일본도서 ">
											<h3 class="h5 text-shadow my-3">일본</h3>
										</a>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=문학"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">문학</span></a></li>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서&bookGenre=공포/호러"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">공포/호러</span></a></li>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=취미"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">취미</span></a></li>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=자기개발"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">자기개발</span></a></li>
													
													
													
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3">
										<a href ="<%=request.getContextPath()%>/tolist.go?bookCategory=해외도서 ">
											<h3 class="h5 text-shadow my-3">해외</h3>
										</a>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=문학"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">문학</span></a></li>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=공포/호러"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">공포/호러</span></a></li>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=취미"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">취미</span></a></li>
											<li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=자기개발"><i
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
						href="LoadRestaurantList.do"><i class="mr-1"></i>몰까요~</a></li>
				</ul>
			</div>
				<div class ="login" style="right: 10PX;">

						<a href="$">회원가입</a>					
					
					<%--  	<c:if test="${sessionScope.Id == null }">
							<input type="button" value="로그인" onclick="location.href='login.go'">
						</c:if>
				
						<c:if test="${sessionScope.Id != null }">
							<input type="button" value="로그아웃" onclick="location.href='logout.go'">
						</c:if> --%>
						
						<c:set var="session" value="${session }" />
						<c:if test="${session.memberId == null }">
						    <input type="button" value="로그인" onclick="location.href='login.go'">
						</c:if>
						
						<c:if test="${session.memberId != null }">
						    <input type="button" value="로그아웃" onclick="location.href='logout.go'">
						</c:if>
						
				</div>
				<div class="my_info">
					
					<a href="<%=request.getContextPath() %>/myPage.go">
					<img src="resources\css\s_img\us23.png">
					</a>

				<c:choose>
					<c:when test="${empty session.memberId }">
						<div onclick="needLogin();">
							<img src="resources\css\s_img\cart_b.png">
						</div>
					</c:when>
					<c:when test="${!empty session.memberId }">
						<a href="cartList.go">
							<img src="resources\css\s_img\cart_b.png">
						</a>
					</c:when>
				</c:choose>
				<!-- 	<a href="cartList.go">
					<img src="resources\css\s_img\cart_b.png">
					</a>
				</div> -->

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
			
		
		<script type="text/javascript">
		  function needLogin() {
			    var popupElement = document.getElementById("needLoginPopup");

			    // 팝업 토글
			    if (popupElement.hidden === false) {
			      popupElement.hidden = true;
			    } else {
			      popupElement.hidden = false;
			    }
			  }
		</script>
	</header>
		<div style="margin:200px; ">
		
		</div>
		
		
