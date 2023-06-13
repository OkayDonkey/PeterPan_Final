<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/theme.min.css" />
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/vendor.min.css" />
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/board/mainboard.css"/>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" /><!-- 파비 -->

<meta charset="UTF-8">
<title>고객센터 - 피터팬</title>
</head>
<body>
	<input type="hidden" id="category" value="${category }">

	<jsp:include page="./../top/top.jsp" />

	<div class="container align-content-center" style="min-width: 1200px;">
		<div class="row justify-content-sm-between" style="width: 1200px; padding-bottom: 100px; padding-top: 40px;">
	
			<jsp:include page="../boardInclude/boardLeft.jsp" />
				<div>
					<div>
						<div style="margin-top: 3.5px;">
							<h2 class="title_heading">공지사항</h2>
						</div>
						<form method="post" action="<%=request.getContextPath()%>/board_search.go?boardArea=NOTICE">
							<div class="input_text_box">
								<div class="input_btn_box">
									<div class="form_ip_search">
										<input type="search" name="keyword" class="form_ip"  title="자주 묻는 질문" placeholder="질문을 검색해 보세요.">
									</div>
									<div class="form_btn">
										<button type="submit" class="btn">
											<span class="text">검색</span>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					
					<c:set value="${noticeList}" var="List"/>		
						
						<div class="notice_titleOk">
							
							<c:if test="${empty List }">
								<div id="title_category">
									<p class="category_title" style="padding-top: 50px; padding-bottom: 10px;">검색결과 <span class="number" style="color: #3c9a17;">0</span>건</p>
								</div></c:if>
							
							<c:if test="${!empty List }">
								<div id="title_category">
									<p class="category_title" style="padding-top: 50px; padding-bottom: 10px;">검색결과 <span class="number" style="color: #3c9a17;">${count}</span>건</p>
								</div></c:if>
							
							<c:if test="${session.memberTier == 2 }">
								<button onclick="location.href='notice_write.go'" style="margin-bottom: 15px;">공지사항 작성</button>
							</c:if>
								
							<table class="tbl_col_line" style="text-align: center;">
								<colgroup>
									<col style="width: 125px;">
									<col style="width: 500px;">
									<col style="width: 180px;">
									<col style="width: 174px;">
								</colgroup>
		
								<tbody class="notice_tbody">
										<tr class="notice_top">
											<th>NO</th>
											<th>공지제목</th>
											<th>유형</th>
											<th>날짜</th>
										</tr>
										<c:forEach items="${List }"  var="dto"  varStatus="state">
										<tr>
										<c:set var="endNo" value="${endNo -1 }" />
											<td class="fc_light_gray">${endNo + 1}</td>
											<td class="align_left" style="text-align: left;">
												<a href="<%=request.getContextPath() %>/noticeDetail.go?no=${dto.boardNO }">
													<span class="align_left_text" style="text-decoration: none; padding-left: 50px">${dto.boardTitle }</span>
												</a></td>
											<td class="fc_light_gray">공지사항</td>
											<td class="fc_light_gray">${dto.boardRegdate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
			 	   <%-- 페이징 처리 출력 부분 --%>
			 	   <div class="pagingout">
					 <c:if test="${paging.page > paging.block }">
					      <a href="board_notice.go?page=${paging.startBlock - 1 }&field=${paging.field}&keyword=&${paging.keyword}&boardArea=NOTICE">
					      	<img class="pagingout_btn_l" src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_pagination_prev@2x.png"></a>
					   </c:if>
					   
					   <c:forEach begin="${paging.startBlock }" end="${paging.endBlock }" var="i">
					   
					      <c:if test="${i == paging.page }">
					         <b><a style="margin-left: 12px" class="pagingout_num" href="board_notice.go?page=${i }&field=${paging.field}&keyword=&${paging.keyword}">${i }</a></b>
					      </c:if>
					      
					      <c:if test="${i != paging.page }">
					         <a style="margin-left: 12px" class="pagingout_num" href="board_notice.go?page=${i }&field=${paging.field}&keyword=&${paging.keyword}">${i }</a>
					      </c:if>
					   </c:forEach>
					   
					   <c:if test="${paging.endBlock < paging.allPage }">
					      <a href="board_notice.go?page=${paging.endBlock + 1 }&field=${paging.field}&keyword=&${paging.keyword}">
					      	<img class="pagingout_btn_r" src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_pagination_next@2x.png"></a>
					   </c:if>
			   		</div>
				</div>			
			</div>
		</div>
	
	<!-- footer -->
	<jsp:include page="./../top/footer.jsp" />
</body>
</html>