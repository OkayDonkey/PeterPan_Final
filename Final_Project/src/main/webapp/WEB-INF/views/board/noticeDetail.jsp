<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" /><!-- 파비 -->
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/board/qnaForm.css" />
<title>고객센터 - 피터팬</title>
</head>
<body>
	<!-- 상단 네비바  -->
	<jsp:include page="./../top/top.jsp" />

	<!-- 화면 나누기 구성 -->
	<div class="container align-content-center" style="min-width: 1200px;" id="totalBoard">
		<div class="row justify-content-sm-between" style="width: 1200px; padding-bottom: 100px; padding-top: 40px;">

			<!-- 왼쪽 메뉴바 -->
			<jsp:include page="../boardInclude/boardLeft.jsp" />

			<!-- 문의 접수 내용 -->
			<div style="width: 955px;">
				<form enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/board_qna_ok.go">
					<div class="detail_head">
						<b>${dto.boardTitle }</b>
							<div class="detail_mhead">
								<span class="detail_desc">고객센터</span>
								<span class="detail_gap">|</span>
								<span class="detail_date">${dto.boardRegdate }</span>
							</div>
					</div>
					
					<div class="detail_cont">
						<div class="detailCont">${dto.boardContent }</div>
						<div class="detailFile"><img src="resources/upload/${dto.boardFile }"></div>
					</div>
				</form>
				
				<div class="detailBTN">
				    <a id="detailBTN" href="<%=request.getContextPath()%>/board_notice.go" class="btn_lg btn_line_primary"><span class="text">공지사항 목록</span></a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="./../top/footer.jsp" />
	
</body>
<script type="text/javascript" src="resources/js/board/boardFAQ.js"></script>
</html>