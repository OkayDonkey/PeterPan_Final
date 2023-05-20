<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="UTF-8" %>

<html>
<head>
	<title>Home</title>
</head>



<body>

<a href="<%=request.getContextPath()%>/boardPage.go">[게시판]</a>
<h1><a href="<%=request.getContextPath() %>/bookDetail.go?bookNo=1">1번 책 상세정보</a></h1>

                                                                                                                                                            
<h1>Hello world!</h1>

<c:set var="session" value="${session }" />
<c:if test="${session.memberNo == null }">
	<input type="button" value="로그인" onclick="location.href='login.go'">
</c:if>

<c:if test="${session.memberNo != null }">
	<input type="button" value="로그아웃" onclick="location.href='logout.go'">
</c:if>

<P>The time on the server is ${serverTime}. </P>

<jsp:include page="./top/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="resources/js/vendor.min.js"></script>
<script type="resources/js/theme.min.js"></script>
</body>
</html>
