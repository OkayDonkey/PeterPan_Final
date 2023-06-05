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
		<form action="<%=request.getContextPath() %>/insertOk.go" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>책 사진</th>
					<td>제목</td>
					<td>내용</td>
					
				</tr>
			
				<tr>
					<th>
					<input type="button" value="책 검색">
					${bookDTO.bookCover }
					<input type="button" value="책 검색" onclick="bookSearchModal()">
					
					</th>
					<td><input name="albumTitle"></td>
					<td><input name="albumCont"></td>
				</tr>
				<tr>
					<th><input type="button" value="책 검색"></th>
					<td><input name="albumTitle"></td>
					<td><input name="albumCont"></td>
				</tr>
				<tr>
					<th><input type="button" value="책 검색"></th>
					<td><input name="albumTitle"></td>
					<td><input name="albumCont"></td>
				</tr>
				<tr>
					<th><input type="button" value="책 검색"></th>
					<td><input name="albumTitle"></td>
					<td><input name="albumCont"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type ="submit" value ="등록하기">
					</td>
				</tr>
			</table>
		</form>
		
	</div>
	
	<!-- 모달 검색 시작 -->
	<div class="insertPopup" id="insertPopup" hidden>
	  <div class="insertPopupBox">
		<form method="post"	action="<%=request.getContextPath()%>/modal_search.go">
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
							<input name="keyword"
								style="width: 400px; height: 30px; border: none; margin-left: 1px; margin-top: 10px;">
							<input type="image" src="resources\css\s_img\ser_img.png"
								alt="제출버튼"
								style="border-bottom-right-radius: 20px; bg-coloer: white; width: 34px; height: 30px; margin-top: 10px;">
						</div>
					</div>
				</div>
			</form>
			
			<div class="bookWrap">
				<c:set value="${List }" var="list"/>
				<c:set value="${Paging }" var="page"/>
				
				<c:if test="${!empty list }">
					<c:forEach var="dto" items="${list }">
						<table>
							<tr>
								<th>
									<img src="${dto.bookCover }" width="55px">
								</th>
								<td>
								${dto.bookName }
								</td>
								
								<td>
									<input type="button" value="선택하기" onclick="<%=request.getContextPath()%>/albumInsert.go?bookNo=${bookNo}">
								</td>
							</tr>
						
						</table>
					</c:forEach>
				</c:if>
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
	
	
	<!-- -->
	
				        <!-- <a href="#this" onclick="addFile()">파일추가</a>
				        <a href='#this' name='file-delete'>삭제</a> -->
<!-- 	<script type="text/javascript">
    $(document).ready(function() {
        $("a[name='file-delete']").on("click", function(e) {
            e.preventDefault();
            deleteFile($(this));
        });
    })
 
    function addFile() {
        var str = "<div class='file-group'><input type='file' name='file'><a href='#this' name='file-delete'>삭제</a></div>";
        $("#file-list").append(str);
        $("a[name='file-delete']").on("click", function(e) {
            e.preventDefault();
            deleteFile($(this));
        });
    }
 
    function deleteFile(obj) {
        obj.parent().remove();
    }
</script>
	 -->
</body>
</html> 