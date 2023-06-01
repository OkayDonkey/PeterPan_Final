<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/관리자/회원관리</title>
<link rel="stylesheet" href="resources/css/member/mypage.css" />
<link rel="stylesheet" href="resources/css/member/orderHistory.css" />
<link rel="stylesheet" href="resources/css/member/adminMainPage.css" />
</head>
<body>

	<jsp:include page="../../top/top.jsp" />
	
	<div class="wrapper">
		<main class="container_wrapper">
			<section class="breadcrumb_wrap">
				<div class="breadcrumb_inner">
					<ol id="TopBreadcrumb" class="breadcrumb_list">
						<li class="breadcrumb_item">
			                <a href="/" class="home_link">HOME</a>
			            </li>
			             <li class="breadcrumb_item no_sub">
			                <a href="<%=request.getContextPath() %>/myPage.go" class="btn_sub_depth">관리자</a>
			            </li>
					</ol>
				</div>
			</section>
			<section class="contents_wrap aside">
				<div class="contents_inner">
					<aside class="aside_wrap">
						<div class="aside_body">
							<div id="AsideMyProfile" class="my_profile_area">
							    <div class="blur_img_box"></div>
							    <div class="profile_inner">
	    							<div class="profile_thumb_box no_img">
	    								<a href="https://my.kyobobook.co.kr/main/profile" class="btn_setting" onclick="">
	    									<div class="thumb_box"></div>
	    									<span class="hidden">프로필 설정 바로가기</span>
	    								</a>
	    							</div>
	    							<div class="profile_name_box">
	    								<span class="name" data-role="nickname">${session.memberName }</span>
										<span data-role="badge" class="badge">
	        								<a data-role="grade" class="badge_lg badge_pill badge_grade_friends" href="https://mmbr.kyobobook.co.kr/benefit/grade">
	            								<span class="text">관리자</span>
	        								</a>
	        								<a data-role="prestige" class="badge_lg badge_pill badge_grade_prestige hidden" href="https://mmbr.kyobobook.co.kr/benefit/prestige">
	            								<span class="text"></span>
	        								</a>
	    								</span>
									</div>
								</div>
							</div>
							<jsp:include page="adminPageSidebar.jsp" />
						</div>
					</aside>
					
					<c:set var="bList" value="${bookList }" />
					
					<section id="contents" class="section_wrap" style="margin-bottom: 85px;">
						<div class="title_wrap title_size_md has_btn">
							<div class="memberwrap">
								<div class="title_wrap title_size_md">
								    <p class="title_heading">책 관리</p>
								</div>
								<c:if test="${!empty bList }">
								<c:forEach items="${bList }" var="bdto">
									<div class="order_history_group">
							            <div class="order_history_box" style="flex: 0.1 0;">
							                <button type="button" class="btn_filter_history">
							                    <span class="history_desc">${bdto.bookNo}</span>
							                </button>
							            </div>
							            <div class="order_history_box" style="flex: 0.8 0;">
							                <button type="button" class="btn_filter_history">
							                    <span class="history_desc"><img src="${bdto.bookCover}"></span>
							                </button>
							            </div>
							            <div class="order_history_box" style="flex: 1.8 0;">
							                <button type="button" class="btn_filter_history">
							                    <span class="history_desc">${bdto.bookName}</span>
							                </button>
							            </div>
							            <div class="order_history_box" style="flex: 1.0 0;">
							                <button type="button" class="btn_filter_history">
							                    <span class="history_desc">${bdto.bookWriter}</span>
							                </button>
							            </div>
							            <div class="order_history_box" style="flex: 0.5 0;">
							                <button type="button" class="btn_filter_history">
							                    <span class="history_desc">${bdto.bookPrice} 원</span>
							                </button>
							            </div>
							            <div class="order_history_box" style="flex: 0.6 0;">
							                <button type="button" class="btn_filter_history">
							                    <span class="history_desc">${bdto.bookGenre}</span>
							                </button>
							            </div>
							            <div class="order_history_box" style="flex: 0.3 0;">
							                <button type="button" class="btn_filter_history">
							                    <span class="history_desc">삭제</span>
							                </button>
							            </div>
							        </div>
								</c:forEach>
								</c:if>
							</div>
						</div>
					</section>
				</div>
			</section>
		</main>
	</div>
	
	<jsp:include page="../../top/footer.jsp" />

</body>
</html>