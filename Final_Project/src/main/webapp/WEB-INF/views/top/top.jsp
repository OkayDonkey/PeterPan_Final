<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>피터팬</title>
</head>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

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
<link rel="stylesheet" href="resources/css/top/top.css">

<body>
	<div id="HOME"></div>
	<header class="navbar navbar-expand-lg navbar-light bg-light header topHeader">
		<div class="header_wrap">
		 <div class="container-fluid navbar-inner">
			<div class="login">
				<a href="<%=request.getContextPath()%>/boardPage.go">고객센터</a>
				
				<c:if test="${empty session.memberId }">
				<a href="join.go">회원가입</a>					
				</c:if>
				
				<c:set var="session" value="${session }" />
				<c:if test="${session.memberId == null }">
					<input type="button" value="로그인" onclick="location.href='login.go'" style="margin: 0; padding: 0;">
				</c:if>
				
				<c:if test="${session.memberId != null }">
				    <input type="button" value="로그아웃" onclick="location.href='logout.go'" style="margin: 0; padding: 0;">
				</c:if>
						
			</div>
			<div class="top_middle">
				<div>
					<a	href="<%=request.getContextPath()%>/"> 
						<img src="resources/img/peterPanLogo.png" style="width: 162px;" />
					</a>
				</div>
				
				<!-- navbar buttons-->
				<div class="navbar-btns">
					<div class="navbar-btns-inner">
						<form method="post"
							action="<%=request.getContextPath()%>/total_main_search.go">
							<!--서치 링크-->
							<div class="flex-grow-1 my-1 order-sm-2" id="keyboard">
								<div class="input-group flex-nowrap keywordlist">
									<div class="input-group-prepend">
	
										<!-- 서치 옵션 -->
	
										<select name="field"
											style="height: 47px; border-top-left-radius: 15px; border-bottom-right-radius: 15px; width: 100px; border: none; text-align: center;">
											<option value="title" class="opitem">제목</option>
											<option value="writer" class="opitem">작가</option>
											<option value="genre" class="opitem">장르</option>
										</select>
	
										<!-- 서치 옵션 end -->
										<input name="keyword"
											style="width: 400px; height: 30px; border: none; margin-left: 1px; margin-top: 10px;">
										<input type="image" src="resources\css\s_img\ser_img.png"
											alt="제출버튼"
											style="border-bottom-right-radius: 20px; bg-coloer: white; width: 34px; height: 30px; margin-top: 10px;">
									</div>
								</div>
							</div>
						</form>
						<div class="navbar-toggler navbar-btn collapsed"
							data-toggle="collapse" data-target="#menu">
							<i class="mx-auto mb-1" data-feather="menu"></i>
						</div>
					</div>
				</div>
				
				<div class="my_info">
					<c:choose>
						<c:when test="${empty session.memberId }">
							<div onclick="needLogin();">
								<img src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_header_cart@2x.png" style="width:35px;">
							</div>
						</c:when>
						<c:when test="${!empty session.memberId }">
							<a href="cartList.go">
								<img src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_header_cart@2x.png" style="width:35px;">
							</a>
						</c:when>
					</c:choose>
					<c:if test="${session.memberTier == 1 || empty session.memberTier }">
						<div class="myPagebtnWrap">
							<a href="<%=request.getContextPath() %>/myPage.go">
								<img src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_header_my@2x.png">
							</a>
						</div>
					</c:if>
						
					<c:if test="${session.memberTier == 2 }">
						<a href="<%=request.getContextPath() %>/adminPage.go">
							<img src="resources\css\images\logo\managerIcon.png">
						</a>
					</c:if>
				</div>
			</div>
			<div class="collapse navbar-collapse" id="menu">
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
										<a
											href="<%=request.getContextPath()%>/tolist.go?bookCategory=국내도서 ">
											<h3 class="h5 text-shadow my-3">국내</h3>
										</a>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=문학"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">문학</span></a></li>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=취미"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">취미</span></a></li>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=역사"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">역사</span></a></li>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=외국어"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">외국어</span></a></li>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=참고서"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">참고서</span></a></li>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=자기개발"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">자기개발</span></a></li>
										</ul>
									</div>
								</div>

								<div class="dropdown-column">
									<div
										class="bg-position-center bg-	no-repeat bg-size-cover text-center px-3 py-4 mb-3">
										<a
											href="<%=request.getContextPath()%>/tolist.go?bookCategory=일본도서 ">
											<h3 class="h5 text-shadow my-3">일본</h3>
										</a>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=문학"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">문학</span></a></li>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서&bookGenre=공포/호러"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">공포/호러</span></a></li>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=취미"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">취미</span></a></li>
											<li>
												<a href="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=자기개발">
													<i class="widget-categories-indicator" data-feather="chevron-right"></i>
													<span class="font-size-sm">자기개발</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div
										class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3">
										<a
											href="<%=request.getContextPath()%>/tolist.go?bookCategory=해외도서 ">
											<h3 class="h5 text-shadow my-3">해외</h3>
										</a>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=문학"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">문학</span></a></li>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=공포/호러"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">공포/호러</span></a></li>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=취미"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">취미</span></a></li>
											<li><a
												href="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=자기개발"><i
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
											<li>
												<a href="<%=request.getContextPath()%>/boardPage.go">
													<i class="widget-categories-indicator"
													data-feather="chevron-right"> </i><span
													class="font-size-sm">자유 게시판</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div class="widget widget-links">
										<h3 class="widget-title">커뮤니티</h3>
										<ul>
										
									    	<li>
												<c:if test="${session.memberTier == 999 }">
													<a href="#" onclick="alert('커뮤니티가 차단된 아이디입니다');">
														<i class="widget-categories-indicator"	data-feather="chevron-right"></i>
														<span class="font-size-sm">앨범</span>
													</a>
												</c:if>
												<c:if test="${session.memberTier != 999 }">
													<a href="album.go"> 
														<i class="widget-categories-indicator"	data-feather="chevron-right"></i>
														<span class="font-size-sm">앨범</span>
													</a>
												</c:if>
											</li>
										
										</ul>
									</div>
								</div>
							</div>
						</div></li>

					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" style="padding: 1em;"
						href="bestListbook.go"><i class="mr-1"></i>베스트</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" style="padding: 1em;"
						href="newbook.go"><i class="mr-1"></i>신작</a></li>
				</ul>
			</div>
		</div>
	</div>


			<div id="needLoginPopup" class="needLoginPopup" hidden>
				<div class="LoginPopupBox">
					<p>로그인 후 이용가능합니다.</p>
					<p style="margin-bottom: 40px; font-weight: 100;">로그인 페이지로
						이동하시겠습니까?</p>
					<div class="row">
						<div class="RoundBox1" onclick="needLogin();">취소</div>
						<div class="RoundBox2" onclick="location.href='login.go'">확인</div>
					</div>
				</div>
			</div>


			<script type="text/javascript">
				function needLogin() {
					var popupElement = document
							.getElementById("needLoginPopup");

					// 팝업 토글
					if (popupElement.hidden === false) {
						popupElement.hidden = true;
					} else {
						popupElement.hidden = false;
					}
				}
			</script>
	</header>
	<div style="margin-bottom: 200px;"></div>