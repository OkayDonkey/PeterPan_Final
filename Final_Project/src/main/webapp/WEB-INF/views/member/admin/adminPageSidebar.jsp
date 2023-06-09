<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" />
<meta charset="UTF-8">
</head>
<body>

	<div class="snb_wrap">
		<ul id="LeftNavList" class="snb_list category">
			<li class="snb_item" data-id="1">
				<a class="snb_link depth_title" href="<%=request.getContextPath() %>/member_management.go">
					회원 관리
				</a>
			</li>
			<li class="snb_item" data-id="2">
				<a class="snb_link depth_title" href="<%=request.getContextPath() %>/book_management.go">
					책 관리
				</a>
			</li>
			<li class="snb_item" data-id="3">
				<a class="snb_link depth_title" href="<%=request.getContextPath() %>/qna_management.go">
					1:1 문의 내역
				</a>
			</li>
		</ul>
	</div>

</body>
</html>