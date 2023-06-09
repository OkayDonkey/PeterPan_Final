<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
		alert("회원가입이 완료되었습니다. 이메일을 인증 후 이용가능합니다.")
		location.href = "<%=request.getContextPath() %>/login.go";
	</script>

</body>
</html>