<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬</title>

<link rel="stylesheet" href="resources/css/comunity/albumUpload.css" />
<script type="text/javascript">
function check() {

	if (f.albumTitle.value == "") {
		alert("제목을 입력해주세요");
		f.albumTitle.focus();

		return false;
	}
 
	if (f.albumCont.value == "") {
		alert("앨범에 대한 내용을 입력해주세요");
		f.albumCont.focus();
		return false;
	} 
	if (f.bookname1.value == "") {
		alert("앨범은 4개 이상 등록해주세요");
		return false;
	} 

	if (f.bookname2.value == "") {
		alert("앨범은 4개 이상 등록해주세요");
		return false;
	} 

	if (f.bookname3.value == "") {
		alert("앨범은 4개 이상 등록해주세요");
		return false;
	} 

	if (f.bookname4.value == "") {
		alert("앨범은 4개 이상 등록해주세요");
		return false;
	} 

}
</script>
<style type="text/css">

.formcontainer{
}

.input_wrap{
text-align: center;
}
.table_class{
border-collapse:separate;
 border-spacing: 10px;
 margin: 0 auto;
width:600px; 
text-align: center;

}

.table_tr{
	border-bottom: 1px solid black;
	height: 200px;
	width: 150px;
	
}
.table_class td{
width: 150px;
}
.table_class img{
width: 120px;
}

.table_td_input{
border: none;

}

.from_inputA{
margin-bottom: 50px;
height:50px;
font-size: 20px;
border:none;
border-bottom:1px solid black;
width:300px;

}

.from_inputB{
height:35px;
font-size: 15px;
border:none;
border-bottom:1px solid black;
width:500px;

}
.modal_input{
	border: none;
	width: 100px;
	background-color:rgb(49, 47, 254);
	color: white;
	height:35px;
	border-radius: 10px;
	text-align: center;
	align-content: center;
}

.modal_input:hover{
	border:1px solid rgb(49, 47, 254);
	background-color:transparent;
	color:rgb(49, 47, 254) ;
}
.table_class {
	border: none;
}

</style>
</head>
<body>

	<jsp:include page="../top/top.jsp" />

	<div class="container">
		<%-- <c:set value="${albumlist }" var="alist" />	 --%>
	<div class="formcontainer">
		<form action="<%=request.getContextPath() %>/insertOk.go" method="post" name="f"
				onsubmit="return check()">
			  <div id="searchResults">
	    <!-- 검색 결과를 동적으로 표시하는 부분 -->
			
		  
			  </div>
				<div class="input_wrap">
					<input type="text" name="albumTitle" placeholder="앨범의 제목을 입력해주세요" class ="from_inputA">
					<br>
					<input type="text" name="albumCont" placeholder="앨범에 대한 가벼운 소개를 적어주세요" class ="from_inputB">
				</div>
					
				<br>
				<br>
			
				 <table class ="table_class">
					<tr>
						<td>책 사진</td>
						<td>제목</td>
						<td>작가</td>
						<td>장르</td>
						<td>가격</td>
					</tr>	
					<tr class="table_tr" style="border:1px solid black">
						  <th>
						  	<img name="bookImg1" id="bookCover1" >
						  	<br>
						  	<input type="button" value="책 검색" onclick="bookSearchModal(1)" class="modal_input">
						  </th>
						  <td><input id="bookTitle1" name="bookname1" readonly class="table_td_input"></td>
						  <td><span id="bookWriter1" name="bookWriter1"></span></td>
						  <td><span id="bookGenre1" name="bookGenre1"></span></td>
						  <td><span id="bookPrice1" name="bookPrice1"></span></td>
					</tr>
					<tr class="table_tr">
						  <th>
						  	<img name="bookImg2" id="bookCover2">
						  	<br>
						  	<input type="button" value="책 검색" onclick="bookSearchModal(2)" class="modal_input">
						  </th>
						  <td><input id="bookTitle2" name="bookname2" readonly class="table_td_input"></td>
						  <td><span id="bookWriter2" name="bookWriter2"></span></td>
						  <td><span id="bookGenre2" name="bookGenre2"></span></td>
						  <td><span id="bookPrice2" name="bookPrice2"></span></td>
					</tr>
					<tr class="table_tr">
						  <th>
						  	<img name="bookImg3" id="bookCover3">
						  	<br>
						  	<input type="button" value="책 검색" onclick="bookSearchModal(3)" class="modal_input">
						  </th>
						  <td><input id="bookTitle3" name="bookname3" readonly class="table_td_input"></td>
						  <td><span id="bookWriter3" name="bookWriter3"></span></td>
						  <td><span id="bookGenre3" name="bookGenre3"></span></td>
						  <td><span id="bookPrice3" name="bookPrice3"></span></td>
					</tr>
					<tr class="table_tr">
						  <th>
						  	<img name="bookImg4" id="bookCover4">
						  	<br>
						  	<input type="button" value="책 검색" onclick="bookSearchModal(4)" class="modal_input">
						  </th>
						  <td><input id="bookTitle4" name="bookname4" readonly class="table_td_input"></td>
						  <td><span id="bookWriter4" name="bookWriter4"></span></td>
						  <td><span id="bookGenre4" name="bookGenre4"></span></td>
						  <td><span id="bookPrice4" name="bookPrice4"></span></td>
					</tr>
				</table>
				
				<input type ="submit" value ="등록하기">
				
			</form>
		</div>
	</div>
	
	<!-- 모달 검색 시작 -->
	<div class="insertPopup" id="insertPopup" hidden>
	<input type="hidden" id="idNo">
	  <div class="insertPopupBox">
 		 	<form>																																						
				<!--서치 링크-->
				<div class="flex-grow-1 my-1 order-sm-2" id="keyboard">
					<div class="input-group flex-nowrap keywordlist">
						<div class="input-group-prepend" style="align-content: center;">
	
							<!-- 서치 옵션 -->
	
							<select name="field" id="field"
								style="height: 47px; border-top-left-radius: 15px; border-bottom-right-radius: 15px; width: 100px; border: none; text-align: center;">
								<option value="title" id="title">제목</option>
								<option value="writer" id="writer">작가</option>
								<option value="genre" id="genre">장르</option>
							</select>
							
							<!-- 서치 옵션 end -->
							<input name="keyword" id="keyword"
								style="width: 400px; height: 30px; border: none; margin-left: 1px; margin-top: 10px;">
							<input type="submit" alt="제출버튼"
								style="border-bottom-right-radius: 20px; width: 34px; height: 30px; margin-top: 10px;">
						</div>
					</div>
				</div>
 			</form>
			
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