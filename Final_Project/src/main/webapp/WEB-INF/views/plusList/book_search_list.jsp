<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type ="text/css" href ="resources/css/totalList/totalList.css">

</head>
<body>
<jsp:include page="../top/top.jsp" /> 

	<div class="list_container">
		  <c:set var="list" value="${searchPageList}" />
	     <c:set var="paging" value="${Paging }" />
	     <c:set var="stotal" value="${stotal }" />	     
			<div class="table_cont">
				<div class="cate_kind">
				<!-- 좌측 카테고리바 -->
				<h4>검색 결과 (${stotal })</h4> 
				<br>
				<br>
				<div id="nav">
				 <ul class="menu">
				  <li><a href ="<%=request.getContextPath()%>/tolist.go?bookCategory=국내도서 ">국내서적</a>
				   <ul class="sub">
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=문학">문학</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=취미">취미</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=역사">역사</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=외국어">외국어</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=참고서">참고서</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=자기개발">자기개발</a></li>
				   </ul>
				  </li>
				  <li><a href ="<%=request.getContextPath()%>/tolist.go?bookCategory=일본도서 ">일본서적</a>
				   <ul class="sub">
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=문학">문학</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=공포/호러">공포/호러</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=취미">취미</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=자기개발">자기개발</a></li>
				   </ul>
				  </li>
				  <li><a href ="<%=request.getContextPath()%>/tolist.go?bookCategory=해외도서 ">해외서적</a>
				   <ul class="sub">
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=문학">문학</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=공포/호러">공포/호러</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=취미">취미</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=해외도서 &bookGenre=자기개발">자기개발</a></li>
				   </ul>
				  </li>
				 </ul>
				</div>
				
				<!-- 좌측 바 end -->
			</div>

	<table class="table_list">
	     <c:if test="${!empty list }">
			<c:forEach var="dto" items="${list }">
				<tr>
					<th>
						<a href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}">			
							<img class ="table_img" src="${dto.bookCover }">
						</a> 
					</th>
					<td style="text-align: left;">
						<a href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}">
							<span class="bookname">${dto.bookName }</span>
							<br>
							<span class="bookwri">${dto.bookWriter }</span>
						</a> 
					</td>
					<td>
							<span class="bookpri">${dto.bookPrice } 원</span>
					</td>
					<td>
						<input type="button" value="장바구니" onclick ="location.href='cart.go'" class="inputA">
						<br>
						<input type="button" value="바로구매" onclick ="location.href='cart.go'" class="inputB">
					</td>
					
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty list }">
			<tr>
				<th colspan="3">
					상품이 없습니다
				</th>
			</tr>
		</c:if>
	</table>	      
		
	</div>
	
	<div class="pagingout">
	 	   <%-- 페이징 처리 출력 부분 --%>
		   <c:if test="${paging.page > paging.block }">
		      <a href="total_main_search.go?page=1&field=${paging.field}&keyword=&${paging.keyword}">[처음으로]</a>
		      <a href="total_main_search.go?page=${paging.startBlock - 1 }&field=${paging.field}&keyword=&${paging.keyword}">◀</a>
		   </c:if>
		   
		   <c:forEach begin="${paging.startBlock }"
		   				end="${paging.endBlock }" var="i">
		   
		      <c:if test="${i == paging.page }">
		         <b><a href="total_main_search.go?page=${i }&field=${paging.field}&keyword=&${paging.keyword}">[${i }]</a></b>
		      </c:if>
		      
		      <c:if test="${i != paging.page }">
		         <a href="total_main_search.go?page=${i }&field=${paging.field}&keyword=&${paging.keyword}">[${i }]</a>
		      </c:if>
		      
		   </c:forEach>
		   
		   <c:if test="${paging.endBlock < paging.allPage }">
		      <a href="total_main_search.go?page=${paging.endBlock + 1 }&field=${paging.field}&keyword=&${paging.keyword}">▶</a>
		      <a href="total_main_search.go?page=${paging.allPage }&field=${paging.field}&keyword=&${paging.keyword}">[마지막으로]</a>
		   </c:if>
	   </div>
	</div>
	   	<jsp:include page="../top/footer.jsp" />
	   	
	   	 <!-- 좌측 토글 버튼-->
	   <script type="text/javascript">
	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("fast");
		});
		
		
	});
</script>
</body>
</html>