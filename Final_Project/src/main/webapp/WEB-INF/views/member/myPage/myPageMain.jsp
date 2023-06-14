<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" />
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/member/mypage.css" />
</head>
<body>

	<jsp:include page="../../top/top.jsp" />
	
	<div class="wrapper" id="mainDiv">
		<main class="container_wrapper my_home">
			<section class="breadcrumb_wrap type_white">
				<div class="breadcrumb_inner">
					<ol id="TopBreadcrumb" class="breadcrumb_list">
						<li class="breadcrumb_item">
							<a href="/" class="home_link">
								Home
							</a>
						</li>
						<li class="breadcrumb_item no_sub">
							<a href="/" class="btn_sub_depth" disabled="disabled">마이</a>
						</li>
					</ol>
				</div>
			</section>
			<section class="contents_wrap aside">
				<div class="contents_inner">
					<aside class="aside_wrap">
						<div class="aside_body">
							<div id="AsideMyProfile" class="my_profile_area">
								<div class="profile_thumb_box no_img">
									<a href="https://my.kyobobook.co.kr/main/profile">
										<div class="thumb_box" class="btn_setting"></div>
										<span class="hidden">프로필 설정 바로가기</span>
									</a>
								</div>
								<div class="profile_name_box">
									<span class="name" data-role="nickname">${session.memberName }님</span>
									<span class="badge" data-role="badge">
										<a data-role="grade" class="badge_lg badge_pill badge_grade_friends" href="https://mmbr.kyobobook.co.kr/benefit/grade">
											<span class="text">프렌즈</span>
										</a>
										<a data-role="prestige" class="badge_lg badge_pill badge_grade_prestige hidden" href="https://mmbr.kyobobook.co.kr/benefit/prestige">
											<span class="text"></span>
										</a>
									</span>
								</div>
								<ul class="profile_info_list" style="box-sizing: none; -webkit-box-sizing: none;">
									<li class="info_item" data-role="wish">
										<a href="https://my.kyobobook.co.kr/library/wish" class="info_link" onclick="ga360.GA_Event('click_마이룸_PC', '상단', '', '찜', '');">
											<span class="title">찜</span>
											<span class="val">26</span>
										</a>
									</li>
									<li class="info_item" data-role="wish">
										<a href="https://my.kyobobook.co.kr/library/list" class="info_link" onclick="ga360.GA_Event('click_마이룸_PC', '상단', '', '리스트', '');">
											<span class="title">리스트</span>
											<span class="val">1</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<jsp:include page="myPageSidebar.jsp" />
					</aside>
					<section id="contents" class="section_wrap">
						<h1 class="hidden">마이 메인</h1>
						<div id="MyNoticeArea" class="switch_toggle_wrap switch_my">
        					<div class="switch_toggle_header" data-active="recommend">
            					<div class="switch_toggle_box">
								    <button type="button" class="btn_switch" data-switch-tg="#myCustomAlarm" onclick="">
								        <span class="text">알림</span>
								    </button>
								    <button type="button" class="btn_switch active" data-switch-tg="#myCustomRecommend" onclick="">
								        <span class="text">추천</span>
								    </button>
								</div>
								<ul class="category_tag_list type_white" data-active="recommend">
    								<li class="category_item active">
    									<button class="btn_category" type="button" data-id="kyobobook">
    										<span class="text">피터팬</span>
    									</button>
    								</li>
    								<li class="category_item" style="display: none;">
    									<button class="btn_category" type="button" data-id="ebook">
    										<span class="text">eBook</span>
    									</button></li><li class="category_item">
    								</li>
    							</ul>
							</div>
							<!-- 알림 -->
							<!-- DESC : 활성화 컨텐츠 active class 추가 -->
							<div style="display: none;" id="myCustomAlarm" data-active="alarm" class="switch_toggle_content alarm active">
								<div class="no_data size_sm">
								    <div class="no_data_desc">지난 7일간 맞춤 소식이 없습니다.</div>
								    <div class="btn_wrap">
								        <button data-role="button" class="btn_sm btn_pill btn_white">
								            <span class="text">맞춤 추천 보기</span>
								        </button>
								    </div>
								</div>
							</div>
							<!-- 추천 -->
							<div id="myCustomRecommend" data-active="recommend" class="switch_toggle_content active">
						    	<div class="custom_swiper_wrap">
						    		<div class="swiper-container swiper-container-horizontal">
						    			<ul class="prod_blur_list swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);">
						    			
						    			<c:set var="rbooklist" value="${rbooklist }" />
						    				<c:if test="${!empty rbooklist }">
						    					<c:forEach items="${rbooklist}" var="dto">
						    						<li class="prod_blur_item swiper-slide swiper-slide-visible swiper-slide-active">
								    					<div class="prod_blur_wrap">
								    						<div class="blur_img_box">
								    							<img data-kbbfn="blurify" src="${dto.bookCover }" data-src="${dto.bookCover }" style="filter: blur(30px);">
								    						</div>
								    						<a class="prod_blur_inner" href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}">
									    						<div class="prod_area horizontal">
									    							<div class="prod_thumb_box size_sm">
									    								<span class="img_box">
									    									<img data-kbbfn="s3-image" alt="${dto.bookName }" src="${dto.bookCover }" data-src="${dto.bookCover }">
									    								</span>
									    							</div>
									    							<div class="prod_info_box">
									    								<span class="prod_name">${dto.bookName }</span>
										    							<div class="prod_price">
										    								<span class="percent">10%</span>
										    								<span class="price">
											    								<fmt:formatNumber value="${dto.bookPrice * 0.9}" pattern="#,##0" var="discountedPrice" />
																				<span class="val">${discountedPrice}</span>

											    								<span class="unit">원</span>
										    								</span>
										    							</div>
									    							</div>
									    						</div>
								    						</a>
								    					</div>
								    				</li>
						    					</c:forEach>
						    				</c:if>
						    			</ul>
						    		</div>
						    	</div>
						    </div>
						</div>
						<div id="VoucherStats" class="benefit_info_wrap">
							<div class="benefit_ico_group">
								<div class="benefit_item benefit_ico_box coupon" data-role="coupon">
								    <a href="javascript:void(0)" class="benefit_link" onclick="couponModal()">
								        <span class="benefit_title">쿠폰</span>
								        <div class="benefit_val">
								            <span class="val">${couponList.size() }</span>
								            <span class="unit">장</span>
								        </div>
								    </a>
								</div>
								<div class="benefit_item benefit_ico_box point" data-role="point">
								    <a href="#" class="benefit_link" onclick="">
								        <span class="benefit_title">통합포인트</span>
								        <div class="benefit_val">
								        	<fmt:formatNumber value="${session.point}" pattern="#,##0" var="formattedPoint" />
											<span class="val">${formattedPoint}</span>
								            <span class="unit">P</span>
								        </div>
								    </a>
								</div>
								<div class="benefit_item benefit_ico_box e_voucher" data-role="e_voucher">
								    <a href="https://order.kyobobook.co.kr/myroom/benefit/coupon-list" class="benefit_link">
								        <span class="benefit_title">e교환권</span>
								        <div class="benefit_val">
								            <span class="val">0</span>
								            <span class="unit">원</span>
								        </div>
								    </a>
								</div>
								<div class="benefit_item benefit_ico_box e_cash" data-role="e_cash">
								    <a href="https://order.kyobobook.co.kr/myroom/benefit/coupon-list" class="benefit_link">
								        <span class="benefit_title">피터팬e캐시</span>
								        <div class="benefit_val">
								            <span class="val">0</span>
								            <span class="unit">원</span>
								        </div>
								    </a>
								</div>
							</div>
							<div class="benefit_sub_group">
								<div class="benefit_item benefit_sub_box" data-role="deposit">
									<a href="https://order.kyobobook.co.kr/myroom/benefit/deposit" class="benefit_link">
										<span class="benefit_title">예치금</span>
										<div class="benefit_val">
											<span class="val">0</span>
											<span class="unit">원</span>
										</div>
									</a>
								</div>
								<div class="benefit_item benefit_sub_box" data-role="deposit">
									<a href="https://order.kyobobook.co.kr/myroom/benefit/deposit" class="benefit_link">
										<span class="benefit_title">피터팬캐시</span>
										<div class="benefit_val">
											<span class="val">0</span>
											<span class="unit">원</span>
										</div>
									</a>
								</div>
								<div class="benefit_item benefit_sub_box" data-role="deposit">
									<a href="https://order.kyobobook.co.kr/myroom/benefit/deposit" class="benefit_link">
										<span class="benefit_title">기프트카드</span>
										<div class="benefit_val">
											<span class="val">0</span>
											<span class="unit">장</span>
										</div>
									</a>
								</div>
								<div class="benefit_item benefit_sub_box" data-role="deposit">
									<a href="https://order.kyobobook.co.kr/myroom/benefit/deposit" class="benefit_link">
										<span class="benefit_title">마일리지</span>
										<div class="benefit_val">
											<span class="val">0</span>
											<span class="unit">원</span>
										</div>
									</a>
								</div>
							</div>
						</div>
						<div class="title_wrap title_size_md" style="margin-top: 40px;">
							<p class="title_heading">라이브러리 리스트</p>
							<div class="right_area">
								<a href="https://my.kyobobook.co.kr/library" class="btn_more_view">
									<span class="text">더보기</span>
									<span class="ico_arw"></span>
								</a>
							</div>
						</div>
						<ul id="MyLibList" class="my_library_list">
							<li class="my_library_item">
								<div class="my_library_box empty">
									<div class="my_library_box_inner">
										<a class="my_library_link">
											<div class="my_library_info">
												<span class="my_library_title">#나의 보관함</span>
												<span class="my_library_desc">담겨있는 상품/콘텐츠가 없습니다.</span>
												<div class="my_library_thumb_list">
													<span class="thumb add">
														<span class="text">+0</span>
													</span>
												</div>
											</div>
										</a>
									</div>
								</div>
							</li>
							<li class="my_library_item">
								<div class="my_library_box">
									<div class="my_library_bg">
										<img data-kbbfn="blurify" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788970127248.jpg" data-src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788970127248.jpg" style="filter: blur(30px);">
									</div>
									<div class="my_library_box_inner">
										<a class="my_library_link" href="/library/list/collection/4476046">
											<div class="my_library_img_box">
												<div class="img_box">
													<img data-kbbfn="s3-image" alt="S000001068676" src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788970127248.jpg" data-src="https://contents.kyobobook.co.kr/sih/fit-in/200x0/pdt/9788970127248.jpg">
												</div>
											</div>
											<div class="my_library_info">
												<span class="my_library_title">#구매</span>
												<div class="my_library_thumb_list">
													<span class="thumb add">
														<span class="text">+11</span>
													</span>
												</div>
											</div>
										</a>
									</div>
								</div>
							</li>
							<li class="my_library_item" data-role="nodata">
								<div class="no_data_line">
									<p class="no_data_desc">나만의 리스트를 만들고<br>나의 기억을 기록해보세요.</p>
									<button type="button" class="btn_add_cont">
										<span class="ico_add_cont"></span>
										<span class="text">추가하기</span>
									</button>
								</div>
							</li>
						</ul>
						<div class="my_activity_wrap">
							<div class="continue_view_box">
								<div class="title_wrap title_size_md">
									<h2 class="title_heading">이어보기</h2>
								</div>
								<div id="ContinueView" class="continue_view_list">
									<div class="continue_view_item">
										<div class="continue_prod_wrap no_data">
											<p class="no_data_desc">독서/시청 중인 상품/콘텐츠가 없습니다.</p>
											<p class="no_data_sdesc">Picks추천과 함께 <br> 책 읽는 습관을 길러보세요.</p>
											<div class="continue_prod_swiper">
												<div class="swiper-container swiper-container-horizontal">
													<ul class="swiper-wrapper">
														<li class="swiper-slide swiper-slide-visible swiper-slide-active" style="width: 231px; margin-right: 30px;">
															<div class="prod_area horizontal">
																<div class="prod_thumb_box size_sm">
																	<a class="prod_link" href="https://product.kyobobook.co.kr/detail/S000001987855">
																		<span class="img_box" style="background-image: url(&quot;https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9791197672125.jpg&quot;);"><img data-kbbfn="s3-image" alt="똑게육아" src="https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9791197672125.jpg" data-src="https://contents.kyobobook.co.kr/sih/fit-in/280x0/pdt/9791197672125.jpg"></span>
																	</a>
																</div>
																<div class="prod_info_box size_xs">
																	<a class="prod_info" href="https://product.kyobobook.co.kr/detail/S000001987855">
																		<span class="prod_name">똑게육아</span>
																	</a>
																	<span class="prod_author">로리(김준희)·북로스트</span>
																	<button type="button" class="btn_line_gray btn_pill btn_xs">
																		<span class="ico_list_plus"></span>
																		<span class="text">리스트 추가</span>
																	</button>
																</div>
															</div>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="activity_more_box">
        						<div id="MyQuickLink" class="my_quick_link_box">
    								<div class="title_wrap title_size_md">
        								<p class="title_heading">바로가기</p>
       									<div class="right_area" style="display: none;">
           									<button type="button" class="btn_change">
               									<span class="ico_change"></span>
               									<span class="text">순서변경</span>
           									</button>
               								<button type="button" class="btn_link_control cancel"><span class="text">취소</span></button>
               								<button type="button" class="btn_link_control save"><span class="text">저장</span></button>    
           
        								</div>
    								</div>
        							<div data-role="no-data" class="no_data_line">
    									<p class="no_data_desc">자주 쓰는 메뉴, 꺼내 두고 사용해요!</p>
    									<button type="button" data-role="btn-dialog" data-target="#popShortcuts" class="btn_add_cont">
									        <span class="ico_add_cont"></span>
									        <span class="text">추가하기PCPC</span>
									    </button>
									</div>
								</div>
	        					<div class="sam_voucher_wrap">
	        						<div id="SamInfo" class="sam_info_box">
	        							<a class="sam_info_link" href="https://sam.kyobobook.co.kr/dig/sam/samintro">
	        								<span class="info_desc">eBook부터 종이책까지, <br>폭넓은 독서생활의 시작 <br>
	        									<span class="sam_logo">
	        										<img src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/img_my_sam_logo@2x.png">
	        									</span>
	        								</span>
	        								<span class="btn_more_view size_sm">
	        									<span class="text">이용안내</span>
	        									<span class="ico_arw"></span>
	        								</span>
	        							</a>
	        						</div>
	        						<div id="ReviewInfo" class="induce_box">
	        							<a class="sam_info_link" href="/library/review">
	        								<span class="info_desc">리뷰 작성하고 <br><span class="fw_bold">리워드</span>를 <br>받아보세요.</span>
	        								<span class="count_val">
	        									<span class="val">4</span>
	        									<span class="unit">개</span>
	        								</span>
	        							</a>
	        						</div>
								</div>
    						</div>
						</div>
					</section>
				</div>
			</section>
		</main>
	</div>
	
	
	<jsp:include page="../../top/footer.jsp" />

</body>
</html>