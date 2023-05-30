<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<div class="snb_wrap">
		<ul id="LeftNavList" class="snb_list category">
			<li class="snb_item" data-id="1">
				<a class="snb_link depth_title" href="https://order.kyobobook.co.kr/myroom/member/order-list" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '쇼핑내역', '');">
					쇼핑내역
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="8">
						<a class="snb_link" href="<%=request.getContextPath() %>/orderHistory.go" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '쇼핑내역_주문/배송목록', '');">
							주문/배송목록
						</a>
					</li>
					<li class="snb_item" data-id="9">
						<a class="snb_link" href="https://order.kyobobook.co.kr/myroom/member/order-list" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '쇼핑내역_주문/배송목록', '');">
							선물함
						</a>
					</li>
					<li class="snb_item" data-id="10">
						<a class="snb_link" href="https://order.kyobobook.co.kr/myroom/member/order-list" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '쇼핑내역_주문/배송목록', '');">
							매장 구매 내역
						</a>
					</li>
					<li class="snb_item" data-id="11">
						<a class="snb_link" href="https://order.kyobobook.co.kr/myroom/member/order-list" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '쇼핑내역_주문/배송목록', '');">
							영수증 조회 / 후 적립
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="2">
				<a class="snb_link depth_title" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리', '');">
					라이브러리
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="15">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							메인
						</a>
					</li>
					<li class="snb_item" data-id="16">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							리스트
						</a>
					</li>
					<li class="snb_item" data-id="17">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							e-라이브러리
						</a>
					</li>
					<li class="snb_item" data-id="18">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							코멘트
						</a>
					</li>
					<li class="snb_item" data-id="19">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							문장수집
						</a>
					</li>
					<li class="snb_item" data-id="20">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							찜
						</a>
					</li>
					<li class="snb_item" data-id="21">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							구독
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="3">
				<a class="snb_link depth_title" href="https://order.kyobobook.co.kr/myroom/member/order-list" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '쇼핑내역', '');">
					활동내역
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="22">
						<a class="snb_link" href="https://order.kyobobook.co.kr/myroom/member/order-list" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '쇼핑내역_주문/배송목록', '');">
							커뮤니티 활동 내역
						</a>
					</li>
					<li class="snb_item" data-id="23">
						<a class="snb_link" href="https://order.kyobobook.co.kr/myroom/member/order-list" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '쇼핑내역_주문/배송목록', '');">
							이벤트 참여 내역
						</a>
					</li>
					<li class="snb_item" data-id="24">
						<a class="snb_link" href="https://order.kyobobook.co.kr/myroom/member/order-list" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '쇼핑내역_주문/배송목록', '');">
							문화공간 이용 내역
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="4">
				<a class="snb_link depth_title" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리', '');">
					혜택/포인트
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="25">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							쿠폰
						</a>
					</li>
					<li class="snb_item" data-id="26">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							통합포인트
						</a>
					</li>
					<li class="snb_item" data-id="27">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							예치금
						</a>
					</li>
					<li class="snb_item" data-id="28">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							e교환권
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="5">
				<a class="snb_link depth_title" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리', '');">
					문의내역
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="29">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							1:1 문의
						</a>
					</li>
					<li class="snb_item" data-id="30">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							상품문의
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="6">
				<a class="snb_link depth_title" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리', '');">
					회원정보
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="31">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							배송주소록
						</a>
					</li>
					<li class="snb_item" data-id="32">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							MY매장
						</a>
					</li>
					<li class="snb_item" data-id="33">
						<a class="snb_link" href="<%=request.getContextPath() %>/member_info_midify_pwdcheck.go">
							회원정보관리
						</a>
					</li>
					<li class="snb_item" data-id="34">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							나의 회원등급
						</a>
					</li>
				</ul>
			</li>
			<li class="snb_item" data-id="7">
				<a class="snb_link depth_title" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리', '');">
					알림센터
				</a>
				<ul class="snb_list">
					<li class="snb_item" data-id="35">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							알림함
						</a>
					</li>
					<li class="snb_item" data-id="36">
						<a class="snb_link" href="https://my.kyobobook.co.kr/library" onclick="ga360.GA_Event('click_마이룸_PC', 'SNB', '', '라이브러리_메인', '');">
							알림신청내역
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>

</body>
</html>