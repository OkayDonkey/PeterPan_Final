<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h2>앨범 등록 게시판  리스트(임시)</h2>

	<c:set value="${list }" var="list" />
	<c:set var="paging" value="${Paging }" />
	
	<table>
		<c:if test="${!empty list }">
			<c:forEach items="${list}" var="dto">
				<tr>	
					<td>
						<a href="<%=request.getContextPath() %>/album_detail.go">${dto.albumTitle }</a>
					</td>
					<td>						
						${dto.albumCont }리스트
					</td>
					<td>
						${dto.albumSysdate }
					</td>			
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty list }">
				<tr>	
					<th colspan="3">
						현재 등록된 앨범이 없네요
					</th>		
				</tr>
		
		</c:if>
	</table>
		<button onclick="location.href='insertalbum.go'">앨범 만들기</button> 
	
</div>


</body>
</html>