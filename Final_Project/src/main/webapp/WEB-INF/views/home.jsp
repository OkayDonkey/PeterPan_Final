<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

	<input type="button" value="로그인" onclick="location.href='login.go'">

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
