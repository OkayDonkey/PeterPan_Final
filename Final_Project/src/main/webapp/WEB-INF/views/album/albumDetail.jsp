<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/comunity/albumDetail.css" />

<title>피터팬</title>
</head>
<body>
<c:set value="${albumList }" var="list" />
<c:set value="${commentList }" var="cList" />
<c:set var="session" value="${session }" /> 

   <jsp:include page="../top/top.jsp" />
   
   <div class="container">
      <section>
      	<div class="flex_column_center">
      		<div class="p-3 pt-4 pb-4 boderTopLine boderBottomLine" style="font-size: 1.5em; font-weight: 400; width:1200px;">${list[0].albumTitle }</div>
      		
      		<div class="row pl-3 boderBottomLine" style="width:1200px;">
      			<div class="row p-3 " >
      				<div><img width="200" src="${list[0].bookCover }"></div>
      				<div class="flex_column" style="width: 580px;">
      					<div class="ml-2 mt-2"><b>앨범 PD</b><span class="ml-3">${list[0].memberName}</span></div>
      					<div class="ml-2 mt-2"><b>등록일</b><span class="ml-3">${list[0].albumSysDate}</span></div>
      				</div>
      			</div>
      			<div class="flex_column p-4 boderLeftLine" style="width: 400px;">
      				<div class="borderGrayBox flex_center">
      					
      					<c:choose>
							<c:when test="${empty session.memberId }">
				  					<img id="heartIcon" src="resources/img/heart.png" width="23px;" onclick="needLogin();" class="mr-2">
							</c:when>
							<c:when test="${!empty session.memberId }">
				  					<img id="heartIcon" src="resources/img/heart.png" width="23px;"  onclick="toggleLike();" class="mr-2">
							</c:when>
						</c:choose>
      					
      				좋아요 &nbsp;<span id="likeDisplay">${likeCount }</span></div>
      				<div class="mt-3"><b>댓글</b><span class="ml-5 pl-2" id="commentDisplay1">${cList.size()}</span> 개
      				<a style="color: black;"href="#commentA" class="float-right borderGrayBoxSmall">쓰기</a></div>
      				<div class="mt-2"><b>공유</b>
      				<span class="ml-5"><img width="30" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Facebook_Home_logo_old.svg/2048px-Facebook_Home_logo_old.svg.png"></span>
      				<span><img width="30" src="https://cdn.imweb.me/thumbnail/20220403/a8e484f2dfe39.png"></span>
      				<span><img width="30" src="https://icon-library.com/images/share-button-icon-png/share-button-icon-png-23.jpg"></span>
      				
      				</div>
      				<div class="mt-3 pt-3 boderTopLine"><b>시리즈</b>
      				<span class="ml-4"><a href="#" style="color:black;">목록 보기 ></a></span>
      				</div>
      			</div>
      		</div>
      	</div>
      
      
      
      		
      </section>
      
       <section class="sectionPadding contents">
         <div class="innerContainer">
            <header class="sectionTitle">
            <h1>수록책</h1>
            <p class="desc" id="totalTrackCnt">(${albumList.size() })</p>
         </header>
         </div>
         
         <div class="contens_list">
            <div class="listControls floatSubMenu" style="margin-left: 0px;">
            <div class="innerContainer">
               <div class="rightActions"></div>
               <label class="checkbox">
                  <input type="checkbox" name="checkAll" title="곡 목록 전체">
               </label>
               <span class="btns">
                  <a href="#" class="btnNormal addAlbum" aria-label="새창">장바구니 담기</a>
               </span>
               <span class="btns play">
                  <span class="leftBar"></span>
               </span>
            </div>
         </div>
         </div>
         <table class="list trackList">
            <thead>
            <tr>
               <th scope="col" class="check"></th>
               <th scope="col" class="albumArt"></th>
               <th scope="col" class="title"><span style="margin-left: 16px;">책</span></th>
               <th scope="col" class="artist" style="width: 170px;"><span>저자</span></th>
               <th scope="col" class="action play"><span>상세정보</span></th>
               <th scope="col" class="action add01"><span style="margin-left: 18px;">장바구니</span></th>
               <th scope="col" class="action etc" style="width: 50px;"><span>기타</span></th>
            </tr>
         </thead>
         <tbody>
            <c:set var="list" value="${albumList }" />
            <c:if test="${!empty list }">
            <c:forEach items="${list }" var="dto">
               <tr>
                  <td class="check">
                     <input type="checkbox" name="check" onclick="bookCheckCart()" data-bookNo="${dto.bookNo}" data-memberId="${session.memberId }">
                  </td>
                  <td>
                     <a href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}" class="thumbnail">
                        <span class="mask"></span>
                        <img src="${dto.bookCover }" alt="${dto.bookCover } 대표이미지">
                     </a>
                  </td>
                  <th scope="row">
                     <p class="title" style="margin-top: 15px;">
                        <a href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}" title="${dto.bookName }" aria-label="새창">${dto.bookName }</a>
                     </p>
                  </th>
                  <td class="left">
                     <p class="artist">
                        <a href="#" title="${dto.bookWriter }">${dto.bookWriter }</a>
                     </p>
                  </td>
                  <td class="left">
                     <a href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}" class="album" title="${dto.bookCover }">상세정보</a>
                  </td>
                  <td>
                     <c:if test="${!empty session.memberId }">
                        <a href="cart.go?bookNo=${dto.bookNo }&memberId=${session.memberId }&totalPrice=${dto.bookPrice }&cartCount=1" class="btn addPlaylist" style="width: 72px; box-shadow: none;">
                           <img src="https://media.istockphoto.com/id/1179275901/ko/%EB%B2%A1%ED%84%B0/%EC%9E%A5%EB%B0%94%EA%B5%AC%EB%8B%88-%EC%95%84%EC%9D%B4%EC%BD%98%EC%97%90-%EC%B6%94%EA%B0%80%ED%95%A9%EB%8B%88%EB%8B%A4-%EC%87%BC%ED%95%91-%EC%B9%B4%ED%8A%B8-%EC%95%84%EC%9D%B4%EC%BD%98%EC%9E%85%EB%8B%88%EB%8B%A4-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8%EB%A0%88%EC%9D%B4%EC%85%98%EC%9D%84-%EC%B0%B8%EC%A1%B0%ED%95%98%EC%8B%AD%EC%8B%9C%EC%98%A4.jpg?s=170667a&w=0&k=20&c=WZlsR4XBw7-rxB6pz8VGR01hCd0shHqnPQJGOoa8XQ4=">
                        </a>
                     </c:if>
                     <c:if test="${empty session.memberId }">
                        <a href="login.go" class="btn addPlaylist" style="width: 72px; box-shadow: none;">
                           <img src="https://media.istockphoto.com/id/1179275901/ko/%EB%B2%A1%ED%84%B0/%EC%9E%A5%EB%B0%94%EA%B5%AC%EB%8B%88-%EC%95%84%EC%9D%B4%EC%BD%98%EC%97%90-%EC%B6%94%EA%B0%80%ED%95%A9%EB%8B%88%EB%8B%A4-%EC%87%BC%ED%95%91-%EC%B9%B4%ED%8A%B8-%EC%95%84%EC%9D%B4%EC%BD%98%EC%9E%85%EB%8B%88%EB%8B%A4-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8%EB%A0%88%EC%9D%B4%EC%85%98%EC%9D%84-%EC%B0%B8%EC%A1%B0%ED%95%98%EC%8B%AD%EC%8B%9C%EC%98%A4.jpg?s=170667a&w=0&k=20&c=WZlsR4XBw7-rxB6pz8VGR01hCd0shHqnPQJGOoa8XQ4=">
                        </a>
                     </c:if>
                  </td>
                  <td>
                     <a href="#" class="btnActions">
                        <img style="width: 20px;" src="resources/css/images/3onesero.png">
                     </a>
                  </td>
               </tr>
            </c:forEach>
            </c:if>
         </tbody>
         </table>
      </section>
      
      <section id="commentA">
   		<div class="p-5 boderTopLine">
      		<div class="flex_column boderBottomLine" style="height: 140px;">
				<h6 class="normal-text">댓글 ( <span id="commentDisplay2">${commentList.size() }</span> )</h6>
				<div class="row m-0 p-0" >
	      			<div><textarea id="commentInput" rows="10"></textarea></div>
      				  <c:choose>
		      			<c:when test="${empty session.memberId }">
							<div class="buyTextBoxBlue flex_center_center ml-3" style="width:88px; height: 66px; border-radius: 0;" onclick="needLogin()">등록</div>
						</c:when>
						<c:when test="${!empty session.memberId }">
							<div class="buyTextBoxBlue flex_center_center ml-3" style="width:88px; height: 66px; border-radius: 0;" onclick="comment()">등록</div>
						</c:when>
					 </c:choose>
      			</div>
      		</div>
      		
      		<div class="reviewBoxBottom" id="CommentInnerAjax">
					<c:if test="${empty commentList }">
						<div class="flex_center_center p-5">
							<img class="mb-2" width="36px" src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/ico_nodata@2x.png">
							<p class="flex_center_center">이 앨범에 첫 댓글을 달아주세요.</p>
						</div>
					</c:if>
					<div id="commentContainer"></div>
							<c:forEach  items="${commentList }" var="Cmt">
								<div class="reviewBlock pl-0">
										<p class="mb-3">${Cmt.memberId }</p>
										<p class="mb-2">${Cmt.comment }</p>
										<p class="mb-2 smallGrayText">${Cmt.commentDate }  |  신고  |  답글쓰기</p>
								</div>
							</c:forEach>
					</div>
      	</div>
      </section>

   </div>
   
   <input type="hidden" id="memberNo" value="${session.memberNo }">
   <input type="hidden" id="memberId" value="${session.memberId }">
   <input type="hidden" id="albumNo" value="${list[0].albumNo }">
   
   <jsp:include page="../top/footer.jsp" />
	<script src="resources/js/book/albumLike.js"></script>	
	<script src="resources/js/book/albumComment.js"></script>	
</body>
</html>