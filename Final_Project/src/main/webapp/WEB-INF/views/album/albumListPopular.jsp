<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/comunity/albumMain.css" />
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" /><!-- 파비 -->

<title>Insert title here</title>
</head>
<body>
	<!-- 상단 네비바  -->
	<jsp:include page="./../top/top.jsp" />
	
	<c:set value="${list }" var="list" />
	<c:set var="paging" value="${Paging }" />

	<div class="total">
		<div class="total_title">
			<div class="title_header">
				<div><span class="title_header_total">전체</span> <span>(${totalRecord})</span></div>
				<div style="margin-right: 11px;">
					<span class="title_header_a"> 
						<a href="<%=request.getContextPath() %>/albumPop.go"><span style="color: #FF564C;">● </span>
							<span style="color: black; font-weight: bolder;"> 인기순</span></a> 
						<a href="<%=request.getContextPath() %>/album.go" style="margin-left: 10px;">최신순</a>
					</span>
				</div>	
			</div>
			<!-- test -->
			<div>
				<div class="total_cont">
					<c:if test="${!empty list }">
						<c:forEach items="${list}" var="dto" varStatus="status">
					<div class="total_cont_D">
						<ul class="total_ul">	
							<li>
								<div class="musicPDAlbumInfo">
									<div class="thumbnails">
										<a href="#" target="_self">
											<div class="albumArt">
											<input class="albumNo" type="hidden" value="${dto.albumNo }">
												<div class="album_back">
													<div class="album front" id="albumFront">
														<img src="#">
													</div>
													<div class="album middle" id="albumMiddle">
														<img src="#">
													</div>
													<div class="album back" id="albumBack">
														<img src="#">
													</div>
												</div>	
											</div>
										</a>
									</div>
									<div class="info_box">
										<div class="info">
											<a href="<%=request.getContextPath() %>/album_detail.go?albumNo=${dto.albumNo}" class="title hyrend" title="달짝지근 기분 좋아지는 Daily Pop 19" target="_self">${dto.albumTitle}</a>
											<div class="subInfo">
												<a href="#" class="mPD hyrend" title="세렌디피티" target="_self">${dto.memberName}</a>
												<div class="date" date="">${dto.albumSysDate.substring(0, 10)}</div>
											</div>
											<div class="theme">
													<a href="#" class="hyrend"><span>#해외</span></a>
													<a href="#" class="hyrend"><span>#팝송</span></a>
													<a href="#" class="hyrend"><span>#데일리 팝</span></a>
											</div>
										</div>
									</div>	
								</div>
							</li>
						</ul>
					</div>	
					</c:forEach>
					</c:if>
					<c:if test="${empty list }">
						<div>
							<div colspan="3">현재 등록된 앨범이 없네요</div>
						</div>
					</c:if>
				</div>
			</div>
		
			<script type="text/javascript">
			  $(function() {
			    $(".albumNo").each(function(index, element) {
			      var albumNoValue = $(element).val();
			      var albumArt = $(element).closest(".albumArt");
			      console.log("albumNoValue >>> " + albumNoValue);
			      console.log("element >>> " + element);
			      console.log("index >>> " + index);
			      
			
			      var albumFrontImg = albumArt.find(".album.front img");
			      var albumMiddleImg = albumArt.find(".album.middle img");
			      var albumBackImg = albumArt.find(".album.back img");
			
			      $.ajax({
			        url: 'getCover.go',
			        type: 'GET',
			        data: {
			          albumNo: albumNoValue
			        },
			        success: function(result) {
			        	console.log("result >>> " + result);
			        	console.log("result.length >>> " + result.length);
			        	
			          if (result.length >= 1) {
			            var imgSrc1 = result[0].bookCover;
			            albumFrontImg.attr('src', imgSrc1).show(); // 이미지 표시
			            console.log("imgSrc1: " + imgSrc1);
			          } else {
			            albumFrontImg.attr('src', '').hide(); // 이미지 없음
			          }
			
			          if (result.length >= 2) {
			            var imgSrc2 = result[1].bookCover;
			            albumMiddleImg.attr('src', imgSrc2).show(); // 이미지 표시
			            console.log("imgSrc2: " + imgSrc2);
			          } else {
			            albumMiddleImg.attr('src', '').hide(); // 이미지 없음
			          }
			
			          if (result.length >= 3) {
			            var imgSrc3 = result[2].bookCover;
			            albumBackImg.attr('src', imgSrc3).show(); // 이미지 표시
			            console.log("imgSrc3: " + imgSrc3);
			          } else {
			            albumBackImg.attr('src', '').hide(); // 이미지 없음
			          }
			        },
			        error: function(error) {
			          console.log('에러 발생:', error);
			        }
			      });
			    });
			  });
			</script>
		</div>
		<div style="display: flex; width: 1200px;">
			<div class="pagingout" style="width: 92%;">
				 <c:if test="${paging.page > paging.block }">
				      <a href="albumPop.go?page=${paging.startBlock - 1 }&field=${paging.field}&keyword=&${paging.keyword}">
				      	<img class="pagingout_btn_l" src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_pagination_prev@2x.png">
				      </a>
				 </c:if>
				   
				<c:forEach begin="${paging.startBlock }" end="${paging.endBlock }" var="i">
				
				  <c:if test="${i == paging.page }">
				     <b><a style="margin-left: 12px" class="pagingout_num" href="albumPop.go?page=${i }&field=${paging.field}&keyword=&${paging.keyword}&boardArea=NOTICE">${i }</a></b>
				  </c:if>
				  
				  <c:if test="${i != paging.page }">
				     <a style="margin-left: 12px" class="pagingout_num" href="albumPop.go?page=${i }&field=${paging.field}&keyword=&${paging.keyword}&boardArea=NOTICE">${i }</a>
				  </c:if>
				  
				</c:forEach>
				   
				<c:if test="${paging.endBlock < paging.allPage }">
				  <a href="albumPop.go?page=${paging.endBlock + 1 }&field=${paging.field}&keyword=&${paging.keyword}&boardArea=NOTICE">
				  	<img class="pagingout_btn_r" src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_pagination_next@2x.png"></a>
				</c:if>
				
		   	</div>
			
			<c:if test="${!empty session.memberId }">
				<div style="display: flex; align-items: flex-end;">
					<button onclick="location.href='insertalbum.go'">앨범 만들기</button>
				</div>
			</c:if>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="./../top/footer.jsp" />

</body>
</html>