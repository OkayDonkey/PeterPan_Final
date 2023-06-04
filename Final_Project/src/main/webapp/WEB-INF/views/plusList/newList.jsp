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
	     <c:set var="list" value="${List }" />
	     <c:set var="paging" value="${Paging }" />
	     <c:set var="totalR" value="${totalR }" />
		
		<div class="table_cont">
		
			<div class="cate_kind">
				<!-- 좌측 카테고리바 -->
				<br>
				<br>
				<div id="nav">
				 <ul class="menu">
				  <li><a href="#">국내서적</a>
				   <ul class="sub">
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=문학">문학</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=취미">취미</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=역사">역사</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=외국어">외국어</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=참고서">참고서</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=국내도서 &bookGenre=자기개발">자기개발</a></li>
				   </ul>
				  </li>
				  <li><a href="#">일본서적</a>
				   <ul class="sub">
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=문학">문학</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=공포/호러">공포/호러</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=취미">취미</a></li>
				    <li><a href ="<%=request.getContextPath()%>/genreList.go?bookCategory=일본도서 &bookGenre=자기개발">자기개발</a></li>
				   </ul>
				  </li>
				  <li><a href="#">해외서적</a>
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
				<div class="Bcountg">
					<span>전체</span> 
					<span style="color: green;">(${totalR })</span>
					<span>건</span> 
				</div>
			<table class="table_list">
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
								<span>${dto.bookRelDate }</span>
							</td>
							<td>
									<span class="bookpri">${dto.bookPrice } 원</span>
							</td>
						<td>
								
							<!-- 장바구니 버튼 -->
							<c:if test="${empty session.memberId}">
							    <!-- 세션의 memberId가 비어있을 때 실행되는 부분 -->
							        <input type="button" value="장바구니" onclick="needLogin();" class="inputA">							
							    <br>	
							    	
							</c:if>
							
							<c:if test="${!empty session.memberId}">
							    <!-- 세션의 memberId가 비어있지 않을 때 실행되는 부분 -->
							    <input type="button" value="장바구니" onclick="cartGo(${dto.bookNo}, '${session.memberId}',${dto.bookPrice }, 1);" class="inputA">
							    
							    <br>
							</c:if>


							<!-- 구매 버튼 -->
							<c:if test="${empty session.memberId}">
							    <!-- 세션의 memberId가 비어있을 때 실행되는 부분 -->
							        <input type="button" value="바로구매" onclick="needLogin();" class="inputB">						    	
							</c:if>
							
							<c:if test="${!empty session.memberId}">
							    <!-- 세션의 memberId가 비어있지 않을 때 실행되는 부분 -->
							    <input type="button" value="바로구매" onclick="buyGo(${dto.bookNo}, '${session.memberId}',${dto.bookPrice }, 1);" class="inputB"> 
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>	      
	
		</div>
	 	   <%-- 페이징 처리 출력 부분 --%>
	 	 <div class="pagingout">
	   <c:if test="${paging.page > paging.block }">
	      <a href="newbook.go?page=1">[처음으로]</a>
	      <a href="newbook.go?page=${paging.startBlock - 1 }">◀</a>
	   </c:if>
	   
	   <c:forEach begin="${paging.startBlock }"
	   				end="${paging.endBlock }" var="i">
	   
	      <c:if test="${i == paging.page }">
	         <b><a href="newbook.go?page=${i }">[${i }]</a></b>
	      </c:if>
	      
	      <c:if test="${i != paging.page }">
	         <a href="newbook.go?page=${i }">[${i }]</a>
	      </c:if>
	      
	   </c:forEach>
	   
	   <c:if test="${paging.endBlock < paging.allPage }">
	      <a href="newbook.go?page=${paging.endBlock + 1 }">▶</a>
	      <a href="newbook.go?page=${paging.allPage }">[마지막으로]</a>
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

	<script>
    function cartGo(bookNo, memberId,bookPrice,cartCount) {
        // bookNo와 memberId를 활용한 원하는 동작 수행
        // 예: 링크로 페이지 이동
        window.location.href = 'cart.go?bookNo=' + bookNo + '&memberId=' + memberId+'&bookPrice'+bookPrice + '&cartCount=' + cartCount;
    }
    function buyGo(bookNo, memberId,bookPrice,cartCount) {
        // bookNo와 memberId를 활용한 원하는 동작 수행
        // 예: 링크로 페이지 이동
        window.location.href = 'buy.go?bookNo=' + bookNo + '&memberId=' + memberId+'&bookPrice'+bookPrice + '&cartCount=' + cartCount;
    }
</script>

</body>
</html>