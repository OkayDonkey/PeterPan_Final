<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Boolean modalOpen = (Boolean) request.getAttribute("modalOpen"); %>

<script>
$(document).ready(function(){
    <% if (modalOpen != null && modalOpen) { %>
        // 모달을 열어야 하는 경우
        $("#myBtn").modal("show");
        history.back();
    <% } else { %>
        // 모달을 열지 않는 경우
        history.back();
    <% } %>
});
</script>
</body>
</html>