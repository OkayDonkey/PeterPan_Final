<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" id="main-styles"
	href="resources/css/comunity/albumMain.css" />
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
				<div>
					<span class="title_header_total">전체</span> <span>(${list.size()})</span>
				</div>
				<span class="title_header_a"> <a>인기순</a> <a
					style="margin-left: 10px;">최신순</a>
				</span>
			</div>


			<!-- test -->
			<div>
			
			
			<div class="total_cont">
				<c:if test="${!empty list }">
					<c:forEach items="${list}" var="dto" varStatus="status">
					<input class="albumNo" type="hidden" value="${dto.albumNo }">
				<div class="total_cont_D">
					<ul class="total_ul">	
						<li>
							<div class="musicPDAlbumInfo">
								<div class="thumbnails">
									<a href="#" target="_self">
									<!-- 	<div class="bg" type="NORMAL"></div>
										<div class="mask"></div> -->
											
										<div class="albumArt">
											<!-- <div class="cover"></div> -->
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
										<a href="#"
											class="title hyrend" title="달짝지근 기분 좋아지는 Daily Pop 19" target="_self">${dto.albumTitle}</a>
										<div class="subInfo">
											<a href="#"
												class="mPD hyrend" title="세렌디피티" target="_self">${dto.memberName}</a>
											<div date="">${dto.albumSysDate}</div>
										</div>
										<div class="theme">
											<em>태그</em> 
												<a href="#"
													class="hyrend"><span>#해외</span></a>
												<a href="#"
													class="hyrend"><span>#팝송</span></a>
												<a href="#"
													class="hyrend"><span>#데일리 팝</span></a>
										</div>
										<a href="javascript:;"
											onclick="bugs.wiselog.area('list_mab_06');bugs.layermenu.esAlbumMoreAction(this,
								{id:$(this).attr('sns_id'), title:$(this).attr('sns_title'), name:$(this).attr('sns_name')}, 'N', 'Y');"
											sns_from="ESALBUM" sns_id="58058"
											sns_title="달짝지근 기분 좋아지는 Daily Pop 19" sns_name="세렌디피티"
											esalbum_id="58058" esalbum_title="달짝지근 기분 좋아지는 Daily Pop 19"
											pd_nickname="세렌디피티" layerpositiontarget="figure"
											class="btnActions" album_title="달짝지근 기분 좋아지는 Daily Pop 19">기타
											기능</a>
									</div>
								</div>	
							</div>
						</li>
					</ul>
				</div>	
				</c:forEach>
				</c:if>
			</div>
		</div>
				<!--  -->
				<script type="text/javascript">
				
					$(function() {
						var albumArt = $(".albumArt");
						var albumFrontImg = albumArt.find(".album.front img");
						var albumMiddleImg = albumArt.find(".album.middle img");
						var albumBackImg = albumArt.find(".album.back img");
						var albumNoValue = document.querySelector(".albumNo").value;

						$.ajax({
							url: 'getCover.go',
							type: 'GET',
							data: {
								albumNo: albumNoValue
							},
							success: function(result) {
								if (result.length >= 1) {
									var imgSrc1 = result[0].bookCover;
									albumFrontImg.attr('src', imgSrc1);
									console.log("imgSrc1: " + imgSrc1);
								}

								if (result.length >= 2) {
									var imgSrc2 = result[1].bookCover;
									albumMiddleImg.attr('src', imgSrc2);
									console.log("imgSrc2: " + imgSrc2);
								}

								if (result.length >= 3) {
									var imgSrc3 = result[2].bookCover;
									albumBackImg.attr('src', imgSrc3);
									console.log("imgSrc3: " + imgSrc3);
								}
							},
							error: function(error) {
								console.log('에러 발생:', error);
							}
						});
					});

				</script>

					
			
				
				<c:if test="${empty list }">
						<div>
							<div colspan="3">현재 등록된 앨범이 없네요</div>
						</div>
					</c:if>
				</div>
				<button onclick="location.href='insertalbum.go'">앨범 만들기</button>
			
			

			</div>



			<%-- <div>
				<h2>앨범 등록 게시판 리스트(임시)</h2>
				
				<div>
					<c:if test="${!empty list }">
						<c:forEach items="${list}" var="dto" varStatus="status">
							<div class="album-item">
								<div class="cover"></div>
								<input class="albumNo" type="hidden" value="${dto.albumNo }">
								<div>${dto.albumTitle }</div>
								<div>${dto.albumCont }리스트</div>
								<div>${dto.albumSysdate }</div>
							</div>
						</c:forEach>
					</c:if>

					<c:if test="${empty list }">
						<div>
							<div colspan="3">현재 등록된 앨범이 없네요</div>
						</div>
					</c:if>
				</div>
				<button onclick="location.href='insertalbum.go'">앨범 만들기</button>
			</div>
		</div>
	</div>
 --%>
 
 <!-- 
	$(document)
				.ready(
						function() {
							var albumItems = document
									.getElementsByClassName("album-item");

							for (var i = 0; i < albumItems.length; i++) {
								var albumItem = albumItems[i];
								var albumNoValue = albumItem
										.querySelector(".albumNo").value;
								var coverDiv = albumItem
										.querySelector(".cover");

								/*	        $.ajax({
								 url: 'getCover.go',
								 type: 'GET',
								 data: { albumNo: albumNoValue },
								 success: function(result) {
								 for (var j = 0; j < result.length; j++) {
								 var imgSrc = result[j].bookCover;
								 var imgElement = document.createElement('img');
								 imgElement.src = imgSrc;
								 imgElement.classList.add('cover3');
								 imgElement.style.position = 'relative';
								 imgElement.style.top = (j * 10) + 'px'; // 이미지 간격 조절
								 imgElement.style.left = (j * 10) + 'px'; // 이미지 간격 조절
								 imgElement.style.zIndex = result.length - j; // 겹치는 순서 조절
								 coverDiv.appendChild(imgElement);
								 console.log("imgSrc" + imgSrc);
								 }
								 },
								 error: function(error) {
								 console.log('에러 발생:', error);
								 }
								 });
								 */

							$
										.ajax({
											url : 'getCover.go',
											type : 'GET',
											data : {
												albumNo : albumNoValue
											},
											success : function(result) {
												for (var j = 0; j < result.length; j++) {
													var imgSrc = result[j].bookCover;
													coverDiv.innerHTML += '<img class="cover3" src="' + imgSrc + '">';
													console.log("imgSrc"
															+ imgSrc)
												}
											},
											error : function(error) {
												console.log('에러 발생:', error);
											}
										});
							}
						});
 -->
	<!-- footer -->
	<jsp:include page="./../top/footer.jsp" />

</body>
</html>