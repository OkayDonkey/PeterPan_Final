<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" />
<meta charset="UTF-8">
</head>
<body>

	<div class="snb_wrap">
		<ul id="LeftNavList" class="snb_list category">
			<li class="snb_item" data-id="1">
				<a class="snb_link depth_title" href="<%=request.getContextPath() %>/orderHistory.go">
					쇼핑내역
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="8">
						<a class="snb_link" href="<%=request.getContextPath() %>/orderHistory.go">
							주문/배송목록
						</a>
					</li>
					<li class="snb_item" data-id="9">
						<a class="snb_link" href="#">
							선물함
						</a>
					</li>
					<li class="snb_item" data-id="10">
						<a class="snb_link" href="<%=request.getContextPath() %>/orderHistory.go">
							매장 구매 내역
						</a>
					</li>
					<li class="snb_item" data-id="11">
						<a class="snb_link" href="<%=request.getContextPath() %>/orderHistory.go">
							영수증 조회 / 후 적립
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="2">
				<a class="snb_link depth_title" href="#">
					라이브러리
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="15">
						<a class="snb_link" href="#">
							메인
						</a>
					</li>
					<li class="snb_item" data-id="16">
						<a class="snb_link" href="#">
							리스트
						</a>
					</li>
					<li class="snb_item" data-id="17">
						<a class="snb_link" href="#">
							e-라이브러리
						</a>
					</li>
					<li class="snb_item" data-id="18">
						<a class="snb_link" href="#">
							코멘트
						</a>
					</li>
					<li class="snb_item" data-id="19">
						<a class="snb_link" href="#">
							문장수집
						</a>
					</li>
					<li class="snb_item" data-id="20">
						<a class="snb_link" href="#">
							찜
						</a>
					</li>
					<li class="snb_item" data-id="21">
						<a class="snb_link" href="#">
							구독
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="3">
				<a class="snb_link depth_title" href="#">
					활동내역
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="22">
						<a class="snb_link" href="#">
							커뮤니티 활동 내역
						</a>
					</li>
					<li class="snb_item" data-id="23">
						<a class="snb_link" href="#">
							이벤트 참여 내역
						</a>
					</li>
					<li class="snb_item" data-id="24">
						<a class="snb_link" href="#">
							문화공간 이용 내역
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="4">
				<a class="snb_link depth_title" href="#">
					혜택/포인트
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="25">
						<a href="javascript:void(0)" class="snb_link" onclick="couponModal()">
							쿠폰
						</a>
					</li>
					<li class="snb_item" data-id="26">
						<a class="snb_link" href="#">
							통합포인트
						</a>
					</li>
					<li class="snb_item" data-id="27">
						<a class="snb_link" href="#">
							예치금
						</a>
					</li>
					<li class="snb_item" data-id="28">
						<a class="snb_link" href="#">
							e교환권
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="5">
				<a class="snb_link depth_title" href="<%=request.getContextPath() %>/qnaList.go">
					문의내역
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="29">
						<a class="snb_link" href="<%=request.getContextPath() %>/qnaList.go">
							1:1 문의
						</a>
					</li>
					<li class="snb_item" data-id="30">
						<a class="snb_link" href="<%=request.getContextPath() %>/qnaList.go">
							상품문의
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="6">
				<a class="snb_link depth_title" href="<%=request.getContextPath() %>/member_info_midify_pwdcheck.go">
					회원정보
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="31">
						<a class="snb_link" href="#">
							배송주소록
						</a>
					</li>
					<li class="snb_item" data-id="32">
						<a class="snb_link" href="#">
							MY매장
						</a>
					</li>
					<li class="snb_item" data-id="33">
						<a class="snb_link" href="<%=request.getContextPath() %>/member_info_midify_pwdcheck.go">
							회원정보관리
						</a>
					</li>
					<li class="snb_item" data-id="34">
						<a class="snb_link" href="#">
							나의 회원등급
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="7">
				<a class="snb_link depth_title" href="#">
					알림센터
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="35">
						<a class="snb_link" href="#">
							알림함
						</a>
					</li>
					<li class="snb_item" data-id="36">
						<a class="snb_link" href="#">
							알림신청내역
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	
	<!-- 쿠폰 모달창 -->
	<c:set value="${couponList }" var="clist" />
		<div id="couponInsertPopup" class="couponInsertPopup"  hidden>
	      <div class="couponInsertPopupBox">
	      	<div class="couponModalTop">
	         <span class="coupon_first_write">쿠폰 내역</span>
		     <div class="closeModal">
			  	<a href="javascript:void(0)" class="closeModalbtn" onclick="couponCloseModal()">x</a>
			 </div>
	        </div>
	         <br>
	         <div class="couponWrap">
	         	<div class="couponHead">
	         		<div class="couponNo head">
	         			<span>번호</span>	
	         		</div>
	         		<div class="couponSale head">
	         			<span>쿠폰 할인</span>	
	         		</div>
	         		<div class="couponName head">
	         			<span>쿠폰 명</span>	
	         		</div>
	         	</div>
	         	<div class="couponContentWrap">
	         	<c:if test="${!empty clist }">
	         	<c:set value="${clist.size() + 1 }" var="size" />	
	         		<c:forEach items="${clist }" var="dto">
	         			<div class="couponContent">
	         				<div class="couponNo content">
			         			<span class="couponNoInfo">${size - 3}</span>	
			         		</div>
			         		<div class="couponSale content">
			         			<span class="couponSaleInfo">${dto.couponSale } 원</span>	
			         		</div>
			         		<div class="couponName content">
			         			<c:if test="${dto.couponSale == 1000 }">
			         				<span class="couponNameInfo">피터팬 회원가입 증정 할인 쿠폰</span>
			         			</c:if>
			         			<c:if test="${dto.couponSale == 2000 }">
			         				<span class="couponNameInfo">피터팬 회원가입 증정 할인 쿠폰</span>
			         			</c:if>
			         			<c:if test="${dto.couponSale == 3000 }">
			         				<span class="couponNameInfo">피터팬 회원가입 증정 할인 쿠폰</span>
			         			</c:if>	
			         		</div>
	         			</div>
	         			<c:set value="${size + 1}" var="size" />
	         		</c:forEach>
	         	</c:if>
	         	</div>
	         </div>
			<span style="font-size: 12px; margin-top: 8px;">* 쿠폰 관련 문의는 자주묻는 질문 게시판이나 1:1문의로 주시기 바랍니다.</span>
	      </div>
	    </div>
	    
		<script type="text/javascript" src="resources/js/member/myPageMainModal.js"></script>
		<!-- 쿠폰 모달창 end -->

</body>
</html>