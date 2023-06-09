<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" />
<meta charset="UTF-8">
<title>피터팬/주문내역</title>
<link rel="stylesheet" href="resources/css/member/mypage.css" />
<link rel="stylesheet" href="resources/css/member/orderHistory.css" />
<link rel="stylesheet" href="resources/css/member/orderHistoryDetail.css" />
</head>
<body>

<c:set var="session" value="${session }" /> 
<c:set var="list" value="${pList }" />
<c:set var ="cartTotalPrice" value="0" />
<c:set var="totalPrice" value="0" />
<c:forEach items="${list}" var="product">
  <c:set var="totalPrice" value="${totalPrice + ( product.bookPrice - ( product.bookPrice * 0.1 ))}" />
</c:forEach>
<c:forEach items="${list}" var="dto" varStatus="status">
  <c:if test="${status.index == 0 || dto.usedPoint ne list[status.index - 1].usedPoint}">
  		<c:set value="${dto.usedPoint }" var="usedPoint" />
  </c:if>
  <c:if test="${status.index == 0 || dto.paymentCost ne list[status.index - 1].paymentCost}">
  		<c:set value="${dto.paymentCost }" var="pCost" />
  </c:if>
  <c:if test="${status.index == 0 || dto.usedCouponCost ne list[status.index - 1].usedCouponCost}">
  		<c:set value="${dto.usedCouponCost }" var="cCost" />
  </c:if>
</c:forEach>

<input type="hidden" id="memberId" value="${session.memberId }">
	
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
		                <a href="#" class="btn_sub_depth">쇼핑내역</a>
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
		                <a href="<%=request.getContextPath() %>/orderHistory.go" class="btn_sub_depth">주문/배송목록</a>
		                <div class="sub_depth_grid col2">
		                    <div class="sub_depth_box">
		                        <ul class="sub_depth_list">
		                            <li class="depth_item active">
		                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/member/order-list">주문/배송목록</a>
		                            </li>
		                            <li class="depth_item">
		                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/member/gift-detail">선물함</a>
		                            </li>
		                            <li class="depth_item">
		                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/member/offline-list">매장 구매 내역</a>
		                            </li>
		                            <li class="depth_item">
		                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/member/receipt">영수증 조회 / 후 적립</a>
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
				<section id="contents" class="section_wrap" style="margin-bottom: 85px;">
			        <div  class="detail_info_main mb-5" style="width: 100%;"><!-- 메인 좌측 컨테이너 -->
						<span class="detailTitle mb-4 ml-1">주문/배송 상세 조회</span>
						<div class="flex_column p-1">
							<c:if test="${!empty list}">
							    <c:forEach items="${list}" var="dto" varStatus="status">
							        <c:if test="${status.index == 0 || dto.purchaseNo ne list[status.index - 1].purchaseNo}">
									            <!-- Grouping logic -->
									   <div class="purchaseNoBox">
								           <div>
								           		<span class="order_date">${dto.purchaseNo.substring(0, 4)}.${dto.purchaseNo.substring(4, 6)}.${dto.purchaseNo.substring(6, 8)} | 주문번호  ${dto.purchaseNo } </span>
								           </div> 
								       </div>
									       <div class="DeliverTopBox">배송</div>    
						           </c:if>
							<div class="purchaseFlexWrap p-0 m-0 my-2">
						           <div class="">
							           <a href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}" class="prod_link">
				                           <span class="CoverBox">
				                               <img src="${dto.bookCover}" alt="${dto.bookName}">
				                           </span>
				                       </a>
				                   </div>
				                   
						           <div class="bookNameWrap">
						           		<div class="ml-4"><p><a class="bookName" href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}" class="prod_link">${dto.bookName }</a></p></div>
						           		<div class="ml-4 small"><b>수량 : ${dto.bookEA }</b></div>
						           </div>		
						           	
								   <div class="bookPriceWrap">
								   		<fmt:formatNumber value="${(dto.bookPrice - (dto.bookPrice * 0.1)) * dto.bookEA}" pattern="#,##0" var="formattedPrice" />
			                            <span class="price">
			                                <span class="val">${formattedPrice}</span>
			                                <span class="unit">원</span>
			                            </span>
								   </div>			
								   
								   <div class="bookDeliverWrap">
									   	<div class="blueText" style="color: #474c9f !important; font-weight: 800; font-size: 14px;">배송완료</div>
									   	<div style="font-size: 14px;">${dto.purchaseNo.substring(0, 4)}.${dto.purchaseNo.substring(4, 6)}.${dto.purchaseNo.substring(6, 8)}</div>
								   </div>	
				           </div>
				           			
					           </c:forEach>
				           </c:if>
				           	<h5 class="mt-5">배송정보</h5>
				            <div class="DeliverTopBox1 row">
								<div class="mr-5 size14"><b>기본정보</b></div>
								<div class="ml-5">
									<div class="size14"><b>${session.memberName }</b>  /  ${session.memberPhone }</div>
									<div class="size14"><b>[ ${session.addrPost } ]</b>  ${session.addrMain } ${session.addrDetail }</div>
								</div>
							</div>    
				           	
				           <h5 class="mt-5">결제정보</h5>
				            <div class="DeliverTopBox1 row" style="display: flex; justify-content: space-between;">
								<div class="PayWrapBox mr-3" >
									<div class="row-between"><div class="size14"><b>주문금액</b></div> <div><b><fmt:formatNumber >${totalPrice}</fmt:formatNumber>원</b></div></div>
									<div class="row-between detail"><div>상품금액</div> <div><fmt:formatNumber >${totalPrice}</fmt:formatNumber>원</div></div>
								</div>
								<div  class="PayWrapBox ml-5 mr-3" >
									<div class="row-between"><div class="size14"><b>할인/포인트 금액</b></div> <div><b>-<fmt:formatNumber >${usedPoint }</fmt:formatNumber>원</b></div></div>
									<div class="row-between detail"><div>쿠폰 할인액</div>
									 	<c:if test="${cCost > 0}">
										 	<div><fmt:formatNumber >${cCost}</fmt:formatNumber>원</div>
										</c:if> 
										<c:if test="${cCost == 0 }">
										 	<div><fmt:formatNumber >0</fmt:formatNumber>원</div>
										</c:if>
									 </div>
								</div>
								<div  class="PayWrapBox ml-5" >
									<div class="row-between"><div class="size14"><b>총 결제금액</b></div> <div><b><fmt:formatNumber >${pCost }</fmt:formatNumber>원</b></div></div>
									<div class="row-between detail"><div>신용카드</div> <div><fmt:formatNumber >${pCost }</fmt:formatNumber>원</div></div>
								</div>
							</div>
							<ul class="bul_list">
					            <li class="bul_item_dot font_size_xxs fc_light_gray">적립금은 결제이후 예상적립금이 안내됩니다. 결제 사용금액과 적립시점에 따라 최종적립이 완료 되면 [적립완료]로 안내가 변경됩니다.</li>
					            <li class="bul_item_dot font_size_xxs fc_light_gray">제휴포인트의 경우 적립완료 금액은 각 제휴사페이지에서 확인 가능합니다.</li>
					        </ul>
							
							<h5 class="mt-5">적립정보</h5>
				            <div class="DeliverTopBox1 row" style="display: flex; justify-content: space-between;">
								<div class="PayWrapBox1 mr-3" >
									<div class="row-between"><div class="size14"><b>통합포인트 적립</b></div> 
										<c:if test="${totalPrice > 50000 }">
										 	<div><b><fmt:formatNumber >${( totalPrice * 0.05 ) + 2000 }</fmt:formatNumber>원</b></div>
										</c:if> 
										<c:if test="${totalPrice <= 50000 }">
										 	<div><b><fmt:formatNumber >${ totalPrice * 0.05 }</fmt:formatNumber>원</b></div>
										</c:if>
									</div>
								</div>
								<div  class="PayWrapBox1 ml-5 mr-3" >
									<div class="row-between"><div class="size14"><b>잔여 포인트</b></div> 			
										<div><b><fmt:formatNumber >${session.point }</fmt:formatNumber>원</b></div>
									</div>
								</div>
							</div>
							<div class="btn_wrap page_bottom">
					            <a href="<%=request.getContextPath() %>/orderHistory.go" class="btn_lg btn_primary">
					            	<span class="text">주문/배송 목록</span>
					            </a>
					        </div> 
						</div>			
					</div><!-- 메인 좌측 컨테이너 -->
			    </section>
			</div>
		</section>
	</main>
	</div>
	
	<jsp:include page="../../top/footer.jsp" />
	
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	
	<script src="resources/js/book/bookDetail.js"></script>	
	<script src="resources/js/book/orderPriceCalculator.js"></script>
	
</body>
</html>