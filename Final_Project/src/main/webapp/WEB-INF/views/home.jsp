<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="UTF-8" %>


<html>
<head>
	<title>Home</title>
</head>
<body>


<a href="<%=request.getContextPath()%>/boardPage.go">[게시판]</a>


                                                                                                                                                            
<h1>Hello world!</h1>

<c:if test="${sessionScope.Id == null }">
	<input type="button" value="로그인" onclick="location.href='login.go'">
</c:if>

<c:if test="${sessionScope.Id != null }">
	<input type="button" value="로그아웃" onclick="location.href='logout.go'">
</c:if>

<P>The time on the server is ${serverTime}. </P>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="resources/js/vendor.min.js"></script>
<script type="resources/js/theme.min.js"></script>
</body>
</html>
