<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/member/mypage.css" />
<link rel="stylesheet" href="resources/css/member/orderHistory.css" />
<link rel="stylesheet" href="resources/css/member/qnaList.css" />
<title>피터팬</title>
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
		                <a href="<%=request.getContextPath() %>/myPage.go" class="btn_sub_depth">마이</a>
		            </li>
		            <li class="breadcrumb_item">
		                <a href="#" class="btn_sub_depth">문의내역</a>
		                <div class="sub_depth_grid">
		                    <div class="sub_depth_box">
		                        <ul class="sub_depth_list">
		                            <li class="depth_item active">
		                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/member/order-list">쇼핑내역</a>
		                            </li>
		                            <li class="depth_item">
		                                <a class="depth_link" href="https://my.kyobobook.co.kr/library">라이브러리</a>
		                            </li>
		                            <li class="depth_item">
		                                <a class="depth_link" href="https://my.kyobobook.co.kr/activity/community">활동내역</a>
		                            </li>
		                            <li class="depth_item">
		                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/benefit/coupon-list">혜택/포인트</a>
		                            </li>
		                            <li class="depth_item">
		                                <a class="depth_link" href="https://my.kyobobook.co.kr/consult">문의내역</a>
		                            </li>
		                            <li class="depth_item">
		                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/member/address">회원정보</a>
		                            </li>
		                            <li class="depth_item">
		                                <a class="depth_link" href="https://my.kyobobook.co.kr/notice">알림센터</a>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </li>
		            <li class="breadcrumb_item">
		                <a href="<%=request.getContextPath() %>/qnaList.go" class="btn_sub_depth">1:1 문의</a>
		                <div class="sub_depth_grid col2">
		                    <div class="sub_depth_box">
		                        <ul class="sub_depth_list">
		                            <li class="depth_item active">
		                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/member/order-list">1:1 문의</a>
		                            </li>
		                            <li class="depth_item">
		                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/member/order-list">상품 문의</a>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
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
            								<span class="text">프렌즈</span>
        								</a>
        								<a data-role="prestige" class="badge_lg badge_pill badge_grade_prestige hidden" href="https://mmbr.kyobobook.co.kr/benefit/prestige">
            								<span class="text"></span>
        								</a>
    								</span>
								</div>
								<ul class="profile_info_list">
       								<li class="info_item" data-role="wish">
            							<a href="https://my.kyobobook.co.kr/library/wish" class="info_link">
							                <span class="title" onclick="">찜</span>
							                <span class="val" onclick="">0</span>
            							</a>
							        </li>
							        <li class="info_item" data-role="list">
							            <a href="https://my.kyobobook.co.kr/library/list" class="info_link">
							                <span class="title" onclick="">리스트</span>
							                <span class="val" onclick="">12</span>
							            </a>
							        </li>
    							</ul>
							</div>
						</div>
						<jsp:include page="myPageSidebar.jsp" />
					</div>
				</aside>
				<c:set var="totallist" value="${TotalList }" />
				<c:set var="noanswerlist" value="${noAnswerList }" />
				<c:set var="answeroklist" value="${answerOkList }" />
				<section id="contents" class="section_wrap">
					<h1 class="hidden">마이 메인</h1>
					<div class="title_wrap title_size_md">
					    <p class="title_heading">1:1문의</p>
					</div>
					<div class="tab_wrap type_line">
					    <div class="tab_list_wrap">
					        <ul id="FilterList" class="tabs">
					            <li class="tab_item ui-state-active">
					                <button class="tab_link" id="all">
					                    <span class="tab_text">
					                        <span>전체</span>
					                        <span class="count">(${totallist.size() })</span>
					                    </span>
					                </button>
					            </li>
					            <li class="tab_item">
					                <button class="tab_link" id="noanswer">
					                    <span class="tab_text">
					                        <span>처리중</span>
					                        <span class="count">(${noanswerlist.size() })</span>
					                    </span>
					                </button>
					            </li>
					            <li class="tab_item">
					                <button class="tab_link" id="answerok">
					                    <span class="tab_text">
					                        <span>답변완료</span>
					                        <span class="count">(${answeroklist.size() })</span>
					                    </span>
					                </button>
					            </li>
					        </ul>
					    </div>
					</div>
					
					<script type="text/javascript" src="resources/js/member/qnaListTab.js"></script>
					
					<div class="list_result_wrap" style="align-items: baseline;">
					    <div class="right_area">
						    <a class="btn_sm btn_primary" href="">
						        <span class="ico_comment_white"></span>
						        <span class="text">1:1문의하기</span>
						    </a>
						</div>
					</div>
					
					<!-- '전체' 탭이 눌렸을 떄 -->
					<div id="total" class="tab_content">
						<c:if test="${!empty totallist }" >
						<c:forEach items="${totallist }" var="dto">
							<div id="ListWrap" class="fold_box_wrap type_inquiry">
							    <ul class="fold_box_list" style="">
							    	<li class="fold_box expanded" data-id="3220845">
							    		<div class="fold_box_header">
							    			<div class="inquiry_info">
							    				<span class="badge_lighten_gray badge_sm badge_pill badge_primary">
							    					<span class="text">
							    						<c:if test="${empty dto.content }">
							    						 	처리중
							    						</c:if>
							    						<c:if test="${!empty dto.content }">
							    						 	답변완료
							    						</c:if>
							    					</span>
							    				</span>
							    				<span class="gap">
							    					<span class="hidden">/</span>
							    				</span>
							    				<span class="category">
							    					<span class="category_item">${dto.boardCategory }</span>
							    				</span>
							    			</div>
							    			<div class="inquiry_title">
							    				<div class="faq_q">
							    					<span class="faq_circle" aria-hidden="true">Q</span>
							    					<span class="hidden">질문</span>
							    				</div>
							    				<span class="title">${dto.boardTitle }</span>
							    				<span class="right_area">
							    					<span class="date">${dto.boardRegdate }</span>
							    				</span>
							    			</div>
							    			<button class="btn_fold" type="button">
							    				<span class="hidden">컨텐츠 열기</span>
							    			</button>
							    		</div>
							    		<div class="fold_box_contents">
							    			<div class="inquiry_content">
							    				<div class="inquiry_content_area">
							    					<p>${dto.boardContent }</p>
							    					<ul class="img_list"></ul>
							    				</div>
							    				<div class="inquiry_content_footer">
							    					<div class="func_group">
							    					<c:if test="${empty dto.content }">
							    						<button class="btn_text_link" type="button" onclick="location.href='<%=request.getContextPath() %>/qna_modify.go?boardNo=${dto.boardNO}'">
							    							<span class="text">수정</span>
							    						</button>
							    					</c:if>
							    						<span class="gap"></span>
							    						<button class="btn_text_link" type="button" onclick="location.href='<%=request.getContextPath() %>/qna_delete.go?boardNo=${dto.boardNO}'">
							    							<span class="text">삭제</span>
							    						</button>
							    					</div>
							    				</div>
							    			</div>
							    		</div>
							    		<c:if test="${!empty dto.content }">
							    			<div class="reply_content">
								    			<div class="reply_content_area">
								    				${dto.content }
								    			</div>
								    			<div class="reply_content_footer">
									    			<div class="info_group">
									    				<span class="info_item">
									    					<span class="text">${dto.regdate }</span>
									    				</span>
									    			</div>
								    			</div>
								    		</div>
							    		</c:if>
							    	</li>
							    </ul>
							</div>
						</c:forEach>
						</c:if>
					</div>
					<!-- '처리중' 탭이 눌렸을 떄 -->
					<div id="progress" class="tab_content" style="display: none;">
						<c:if test="${!empty noanswerlist }" >
						<c:forEach items="${noanswerlist }" var="dto">
							<div id="ListWrap" class="fold_box_wrap type_inquiry">
							    <ul class="fold_box_list" style="">
							    	<li class="fold_box expanded" data-id="3220845">
							    		<div class="fold_box_header">
							    			<div class="inquiry_info">
							    				<span class="badge_lighten_gray badge_sm badge_pill badge_primary">
							    					<span class="text">
							    						<c:if test="${empty dto.content }">
							    						 	처리중
							    						</c:if>
							    						<c:if test="${!empty dto.content }">
							    						 	답변완료
							    						</c:if>
							    					</span>
							    				</span>
							    				<span class="gap">
							    					<span class="hidden">/</span>
							    				</span>
							    				<span class="category">
							    					<span class="category_item">${dto.boardCategory }</span>
							    				</span>
							    			</div>
							    			<div class="inquiry_title">
							    				<div class="faq_q">
							    					<span class="faq_circle" aria-hidden="true">Q</span>
							    					<span class="hidden">질문</span>
							    				</div>
							    				<span class="title">${dto.boardTitle }</span>
							    				<span class="right_area">
							    					<span class="date">${dto.boardRegdate }</span>
							    				</span>
							    			</div>
							    			<button class="btn_fold" type="button">
							    				<span class="hidden">컨텐츠 열기</span>
							    			</button>
							    		</div>
							    		<div class="fold_box_contents">
							    			<div class="inquiry_content">
							    				<div class="inquiry_content_area">
							    					<p>${dto.boardContent }</p>
							    					<ul class="img_list"></ul>
							    				</div>
							    				<div class="inquiry_content_footer">
							    					<div class="func_group">
							    						<button class="btn_text_link" type="button">
							    							<span class="text">수정</span>
							    						</button>
							    						<span class="gap"></span>
							    						<button class="btn_text_link" type="button">
							    							<span class="text">삭제</span>
							    						</button>
							    					</div>
							    				</div>
							    			</div>
							    		</div>
							    		<c:if test="${!empty dto.content }">
							    			<div class="reply_content">
								    			<div class="reply_content_area">
								    				${dto.content }
								    			</div>
								    			<div class="reply_content_footer">
									    			<div class="info_group">
									    				<span class="info_item">
									    					<span class="text">${dto.regdate }</span>
									    				</span>
									    			</div>
								    			</div>
								    		</div>
							    		</c:if>
							    	</li>
							    </ul>
							</div>
						</c:forEach>
						</c:if>
					</div>
					<!-- '답변완료' 탭이 눌렸을 떄 -->
					<div id="answercomplete" class="tab_content" style="display: none;">
						<c:if test="${!empty answeroklist }" >
						<c:forEach items="${answeroklist }" var="dto">
							<div id="ListWrap" class="fold_box_wrap type_inquiry">
							    <ul class="fold_box_list" style="">
							    	<li class="fold_box expanded" data-id="3220845">
							    		<div class="fold_box_header">
							    			<div class="inquiry_info">
							    				<span class="badge_lighten_gray badge_sm badge_pill badge_primary">
							    					<span class="text">
							    						<c:if test="${empty dto.content }">
							    						 	처리중
							    						</c:if>
							    						<c:if test="${!empty dto.content }">
							    						 	답변완료
							    						</c:if>
							    					</span>
							    				</span>
							    				<span class="gap">
							    					<span class="hidden">/</span>
							    				</span>
							    				<span class="category">
							    					<span class="category_item">${dto.boardCategory }</span>
							    				</span>
							    			</div>
							    			<div class="inquiry_title">
							    				<div class="faq_q">
							    					<span class="faq_circle" aria-hidden="true">Q</span>
							    					<span class="hidden">질문</span>
							    				</div>
							    				<span class="title">${dto.boardTitle }</span>
							    				<span class="right_area">
							    					<span class="date">${dto.boardRegdate }</span>
							    				</span>
							    			</div>
							    			<button class="btn_fold" type="button">
							    				<span class="hidden">컨텐츠 열기</span>
							    			</button>
							    		</div>
							    		<div class="fold_box_contents">
							    			<div class="inquiry_content">
							    				<div class="inquiry_content_area">
							    					<p>${dto.boardContent }</p>
							    					<ul class="img_list"></ul>
							    				</div>
							    				<div class="inquiry_content_footer">
							    					<div class="func_group">
							    						<button class="btn_text_link" type="button">
							    							<span class="text">수정</span>
							    						</button>
							    						<span class="gap"></span>
							    						<button class="btn_text_link" type="button">
							    							<span class="text">삭제</span>
							    						</button>
							    					</div>
							    				</div>
							    			</div>
							    		</div>
							    		<c:if test="${!empty dto.content }">
							    			<div class="reply_content">
								    			<div class="reply_content_area">
								    				${dto.content }
								    			</div>
								    			<div class="reply_content_footer">
									    			<div class="info_group">
									    				<span class="info_item">
									    					<span class="text">${dto.regdate }</span>
									    				</span>
									    			</div>
								    			</div>
								    		</div>
							    		</c:if>
							    	</li>
							    </ul>
							</div>
						</c:forEach>
						</c:if>
					</div>
				</section>
			</div>
		</section>
		</main>
	</div>
	
	<jsp:include page="../../top/footer.jsp" />

</body>
</html>