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
		alert("이메일 인증이 완료되었습니다! \n 로그인 후 다양한 책들을 만나보세요!")
		location.href = "<%=request.getContextPath() %>/login.go";
	</script>

</body>
</html>