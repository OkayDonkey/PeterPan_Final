<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/관리자페이지</title>
<link rel="stylesheet" href="resources/css/member/mypage.css" />
<link rel="stylesheet" href="resources/css/member/orderHistory.css" />
<link rel="stylesheet" href="resources/css/member/adminMainPage.css" />
</head>
<body>

	<jsp:include page="../../top/top.jsp" />
	
	<div class="wrapper">
		<main class="container_wrapper">
			<section class="breadcrumb_wrap">
				<div class="breadcrumb_inner">
					<ol id="TopBreadcrumb" class="breadcrumb_list">
						<li class="breadcrumb_item">
			                <a href="/" class="home_link">HOME</a>
			            </li>
			             <li class="breadcrumb_item no_sub">
			                <a href="<%=request.getContextPath() %>/myPage.go" class="btn_sub_depth">관리자</a>
			            </li>
					</ol>
				</div>
			</section>
			<section class="contents_wrap aside">
				<div class="contents_inner">
					<aside class="aside_wrap">
						<div class="aside_body">
							<div id="AsideMyProfile" class="my_profile_area">
							    <div class="blur_img_box"></div>
							    <div class="profile_inner">
	    							<div class="profile_thumb_box no_img">
	    								<a href="https://my.kyobobook.co.kr/main/profile" class="btn_setting" onclick="">
	    									<div class="thumb_box"></div>
	    									<span class="hidden">프로필 설정 바로가기</span>
	    								</a>
	    							</div>
	    							<div class="profile_name_box">
	    								<span class="name" data-role="nickname">${session.memberName }</span>
										<span data-role="badge" class="badge">
	        								<a data-role="grade" class="badge_lg badge_pill badge_grade_friends" href="https://mmbr.kyobobook.co.kr/benefit/grade">
	            								<span class="text">관리자</span>
	        								</a>
	        								<a data-role="prestige" class="badge_lg badge_pill badge_grade_prestige hidden" href="https://mmbr.kyobobook.co.kr/benefit/prestige">
	            								<span class="text"></span>
	        								</a>
	    								</span>
									</div>
								</div>
							</div>
							<jsp:include page="adminPageSidebar.jsp" />
						</div>
					</aside>
					
					<c:set var="mList" value="${memberList }" />
					<c:set var="bList" value="${bookList }" />
					<c:set var="qnaList" value="${qnaList }" />
					
					<section id="contents" class="section_wrap" style="margin-bottom: 85px;">
						<div class="title_wrap title_size_md has_btn">
							<!-- 회원 관리 -->
							<div class="memberwrap">
								<div class="title_wrap title_size_md">
								    <p class="title_heading">회원관리</p>
								</div>
								<span class="pluscontents" onclick="location.href='<%=request.getContextPath() %>/member_management.go'">+더보기</span>
								<c:if test="${!empty mList }">
								<c:forEach items="${mList}" var="mdto" varStatus="loop">
								    <c:if test="${loop.index < 3}">
								        <div class="order_history_group">
								        	<div class="order_history_box" style="flex: 0.1 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${mdto.memberNo}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 0.6 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${mdto.memberId}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 0.4 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${mdto.memberName}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 0.8 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${mdto.memberPhone}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 1.3 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${mdto.memberEmail}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 1.3 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${mdto.addrMain} ${mdto.addrDetail}</span>
								                </button>
								            </div>
								            <c:if test="${mdto.memberTier == 1 }">
											    <div class="order_history_box" style="flex: 0.4 0;">
									                <button type="button" class="btn_filter_history">
									                    <span class="history_desc" onclick="blockMembershipModal('${mdto.memberId}', '${mdto.memberName}')" style="text-align: center;"> 커뮤니티 <br>차단</span>
									                </button>
									            </div>
								            </c:if>
								            <c:if test="${mdto.memberTier == 999 }">
											    <div class="order_history_box" style="flex: 0.4 0;">
									                <button type="button" class="btn_filter_history">
									                    <span class="history_desc" onclick="unblockMembershipModal('${mdto.memberId}', '${mdto.memberName}')" style="text-align: center; color: red;"> 커뮤니티 <br>차단해제</span>
									                </button>
									            </div>
								            </c:if>
								        </div>
								    </c:if>
								</c:forEach>
								</c:if>
							</div>
							<!-- 책 관리 -->
							<div class="bookrwrap">
								<div class="title_wrap title_size_md">
								    <p class="title_heading">책 관리</p>
								</div>
								<span class="pluscontents" onclick="location.href='<%=request.getContextPath() %>/book_management.go'">+더보기</span>
								<c:if test="${!empty bList }">
								<c:forEach items="${bList}" var="bdto" varStatus="loop">
								    <c:if test="${loop.index < 3}">
								        <div class="order_history_group">
								            <div class="order_history_box" style="flex: 0.1 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${bdto.bookNo}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 0.8 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc"><img src="${bdto.bookCover}" onclick="location.href='<%=request.getContextPath() %>/bookDetail.go?bookNo=${bdto.bookNo}'"></span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 1.8 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc" onclick="location.href='<%=request.getContextPath() %>/bookDetail.go?bookNo=${bdto.bookNo}'">${bdto.bookName}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 1.0 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${bdto.bookWriter}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 0.5 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${bdto.bookPrice} 원</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 0.6 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${bdto.bookGenre}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 0.3 0;">
								                <c:if test="${bdto.bookWeekBest != 999 }">
									                <button type="button" class="btn_filter_history">
									                    <span class="history_desc" onclick="outOfPrintModal('${bdto.bookNo}', '${bdto.bookName }')">절판 처리</span>
									                </button>
									            </c:if>
									            <c:if test="${bdto.bookWeekBest == 999 }">
									                <button type="button" class="btn_filter_history">
									                    <span class="history_desc" style="color: red;" onclick="cancelOutOfPrintModal('${bdto.bookNo}', '${bdto.bookName }')">절판 취소</span>
									                </button>
									            </c:if>
								            </div>
								        </div>
								    </c:if>
								</c:forEach>

								</c:if>
							</div>
							<!-- 1:1 문의 내역 관리 -->
							<div class="qnarwrap">
								<div class="title_wrap title_size_md">
								    <p class="title_heading">1:1 문의 내역 관리</p>
								</div>
								<span class="pluscontents" onclick="location.href='<%=request.getContextPath() %>/qna_management.go'">+더보기</span>
								<c:if test="${!empty qnaList }">
								<c:forEach items="${qnaList }" var="qdto" varStatus="loop">
								    <c:if test="${loop.index < 3}">
								        <div class="order_history_group">
								            <div class="order_history_box" style="flex: 0.1 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${qdto.boardNO}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 0.6 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${qdto.boardCategory}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 1 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${qdto.boardTitle}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 1.8 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${qdto.boardContent}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 0.8 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${qdto.boardRegdate}</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 0.6 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc">${qdto.memberName }</span>
								                </button>
								            </div>
								            <div class="order_history_box" style="flex: 0.3 0;">
								                <button type="button" class="btn_filter_history">
								                    <span class="history_desc"  onclick="qnaAnswerModal('${qdto.boardNO}', '${qdto.boardContent }')">답변 작성</span>
								                </button>
								            </div>
								        </div>
								    </c:if>
								</c:forEach>
								</c:if>
							</div> 
						</div>
					</section>
				</div>
			</section>
		</main>
	</div>
	
	<div id="insertPopup" class="insertPopup"  hidden>
      <div class="insertPopupBox">
         <p class="first_write" style="margin-top: 14px;"></p>
         <div class="insertBox_btn"  style="display: flex; margin-top: 40px;">
            <div class="RoundBox1"  onclick="closeModal()"><span>취소</span></div>
            <div class="RoundBox2"><span class="allBlock"></span></div>
         </div>
      </div>
   </div>
   
   <!-- qna 모달 -->
   <div id="qnaInsertPopup" class="qnaInsertPopup"  hidden>
      <div class="qnaInsertPopupBox">
      	 <p>문의 내용</p>
         <span class="qna_first_write">문의 내용</span>
         <br>
         <p>답변 작성</p>
         <textarea name="content" rows="7" cols="62" class="answerContent" style="font-size: 13px; padding: 10px;">
고객님의 문의에 대한 답변입니다.
안녕하세요. //이름// 고객님
피터팬1:1상담 담당자입니다.
먼저, 피터팬을 이용해주셔서 감사드립니다.
고객님의 문의 내용 ~~~
기타 문의사항이 있으시면 언제든지 고객센터(1544-0000)나 1:1상담을 통해 문의주시길 바랍니다. 감사합니다.
		</textarea>
		<span style="font-size: 12px; margin-top: 8px;">* 소중한 고객님께 예쁜말로 문의를 해결해드립니다.</span>
         <div class="qnaInsertBox_btn"  style="display: flex; margin-top: 40px;">
            <div class="RoundBox1"  onclick="qnaCloseModal()"><span>취소</span></div>
            <div class="RoundBox2"><span class="qnaAnswer">답변 등록</span></div>
         </div>
      </div>
   </div>
   <!-- // qna 모달 -->
	
	<script type="text/javascript" src="resources/js/member/admin.js"></script>
	
	<jsp:include page="../../top/footer.jsp" />

</body>
</html>