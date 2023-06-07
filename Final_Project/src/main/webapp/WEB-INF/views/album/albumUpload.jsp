<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬</title>
<link rel="stylesheet" href="resources/css/comunity/albumUpload.css" />
</head>
<body>

	<jsp:include page="../top/top.jsp" />

	<div class="container">
		<h2>게시물 등록</h2>
		<c:set value="${albumlist }" var="alist" />	
	<form action="<%=request.getContextPath() %>/insertOk.go?" method="post">
		  <div id="searchResults">
    <!-- 검색 결과를 동적으로 표시하는 부분 -->
		
	  
		  </div>
		
			<input type="text" name="albumTitle" placeholder="앨범의 제목을 입력해주세요">
			<input type="text" name="albumCont" placeholder="앨범에 대한 가벼운 소개를 적어주세요">
			<input type ="hidden" name ="bookNo" id ="bookNo"> 
			<br>
			<br>
		
			 <table>
				<tr>
					<td>책 사진</td>
					<td>제목</td>
				</tr>
			
				<tr>
				
				<tr>
					  <th>
					  	<img id="bookCover1"  style="width: 200px;">
					  	<br>
					  	<input type="button" value="책 검색" onclick="bookSearchModal(1)">
					  </th>
					  <td><span id="bookTitle1"></span></td>
				</tr>
				<tr>
					  <th>
					  	<img id="bookCover2"  style="width: 200px;">
					  	<br>
					  	<input type="button" value="책 검색" onclick="bookSearchModal(2)">
					  </th>
					  <td><span id="bookTitle2"></span></td>
				</tr>
				<tr>
					  <th>
					  	<img id="bookCover3"  style="width: 200px;">
					  	<br>
					  	<input type="button" value="책 검색" onclick="bookSearchModal(3)">
					  </th>
					  <td><span id="bookTitle3"></span></td>
				</tr>
				<tr>
					  <th>
					  	<img id="bookCover4"  style="width: 200px;">
					  	<br>
					  	<input type="button" value="책 검색" onclick="bookSearchModal(4)">
					  </th>
					  <td><span id="bookTitle4"></span></td>
				</tr>
			</table>
			
			<input type ="submit" value ="등록하기">
			
		</form>
		
	</div>
	
	<!-- 모달 검색 시작 -->
	<div class="insertPopup" id="insertPopup" hidden>
	<input type="hidden" id="idNo">
	  <div class="insertPopupBox">
		<%-- <form method="post"	action="<%=request.getContextPath()%>/modal_search.go"> --%>																																						
				<!--서치 링크-->
				<div class="flex-grow-1 my-1 order-sm-2" id="keyboard">
					<div class="input-group flex-nowrap keywordlist">
						<div class="input-group-prepend" style="align-content: center;">
	
							<!-- 서치 옵션 -->
	
							<select name="field"
								style="height: 47px; border-top-left-radius: 15px; border-bottom-right-radius: 15px; width: 100px; border: none; text-align: center;">
								<option value="title" class="opitem">제목</option>
								<option value="writer" class="opitem">작가</option>
								<option value="genre" class="opitem">장르</option>
							</select>
							
							<!-- 서치 옵션 end -->
							<input name="keyword" id="keyword"
								style="width: 400px; height: 30px; border: none; margin-left: 1px; margin-top: 10px;">
							<input type="button" alt="제출버튼" onclick="serchalbum()"
								style="border-bottom-right-radius: 20px; bg-coloer: white; width: 34px; height: 30px; margin-top: 10px;">
						</div>
					</div>
				</div>
			<!-- </form> -->
			
			<div class="bookWrap">

			</div>
			
			
			<div class="qnaInsertBox_btn"  style="display: flex; margin-top: 40px;">
            <div class="RoundBox1"  onclick="closeModal()"><span>취소</span></div>
            <div class="RoundBox2"><span class="qnaAnswer">등록</span></div>
         </div>
		  </div>		
		</div>
		<!-- 모달 검색 끝 -->
		
		<script type="text/javascript" src="resources/js/comunity/albumUpload.js"></script>
	
		<jsp:include page="../top/footer.jsp" />
	

</body>
</html> 