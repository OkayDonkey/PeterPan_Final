<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/주문내역</title>
<link rel="stylesheet" href="resources/css/member/mypage.css" />
<link rel="stylesheet" href="resources/css/member/orderHistory.css" />
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
			        <div class="title_wrap title_size_md has_btn">
			            <p class="title_heading">주문/배송 목록</p>
			            <div class="right_area">
			                <p class="bul_item_asterisk font_size_xxs">최근 1개월 주문내역 입니다.</p>
			                <div class="prod_filter_wrap">
			                    <button type="button" class="btn_sm btn_line_gray">
			                    	<span class="ico_calendar"></span>
			                    	<span class="text">상세조회</span>
			                    </button>
			                    <div class="filter_area">
			                        <div class="filter_header">
			                            <p class="filter_title">상세조회</p>
			
			                            <div class="right_area">
			                                <button type="button" class="btn_close_filter">
			                                	<span class="ico_filter_close"></span>
			                                	<span class="hidden">닫기</span>
			                                </button>
			                            </div>
			                        </div>
			                        <div class="filter_contents">
			                            <div class="info_text_box">
			                                <ul class="bul_list">
			                                    <li class="bul_item_dot font_size_xxs">조회기간 설정은 6개월 단위이며, 주문정보 조회는 최대 5년까지 가능합니다.
			                                    </li>
			                                    <li class="bul_item_dot font_size_xxs">필터 이용 시 선택한 주문정보만 조회 가능합니다.</li>
			                                </ul>
			                            </div>
			                            <div class="form_wrap type_lg">
			                                <form name="orderListFilterForm">
				                                <!-- form_box -->
				                                <div class="form_box">
				                                    <div class="form_title has_btn">
				                                        <label for="prodFilterInput01" class="form_label">기간조회</label>
				                                    </div>
				                                    <div class="form_cont">
				                                        <div class="date_picker_box">
				                                            <!-- form_sel -->
				                                            <div class="form_sel">
				                                                <select id="ui-id-28" style="display: none;">
				                                                    <option value="1">최근 1개월</option>
				                                                    <option value="2">최근 2개월</option>
				                                                    <option value="3">최근 3개월</option>
				                                                    <option value="6">최근 6개월</option>
				                                                    <option value="0">직접입력</option>
				                                                </select>
				                                                <span tabindex="0" id="ui-id-28-button" role="combobox" style="position: relative;">
					                                                <span class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span>
					                                                <span class="ui-selectmenu-text">최근 1개월</span>
					                                                <div dir="ltr" class="resize-sensor" style="position: absolute; inset: -10px 0px 0px -10px; overflow: hidden; z-index: -1; visibility: hidden;">
					                                                	<div class="resize-sensor-expand" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
					                                                		<div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;"></div>
					                                                	</div>
					                                                	<div class="resize-sensor-shrink" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
					                                                		<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
					                                                	</div>
					                                                </div>
				                                                </span>
				                                            </div>
				                                            <!-- //form_sel -->
				                                            <div class="date_box">
				                                                <input type="text" class="ui_date hasDatepicker" title="시작일 선택" placeholder="2022.04.12" data-start-date="temp" data-order-startdate="" id="dp1685412530060" maxlength="10" disabled="">
				                                                <img class="ui-datepicker-trigger" src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/datepicker_icon_button@2x.png" alt="날짜 선택" title="날짜 선택">
				                                            </div>
				                                            <span class="gap">~</span>
				                                            <div class="date_box">
				                                                <input type="text" class="ui_date hasDatepicker" title="종료일 선택" placeholder="2022.04.12" data-order-enddate="" id="dp1685412530061" maxlength="10" disabled="">
				                                                <img class="ui-datepicker-trigger" src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/datepicker_icon_button@2x.png" alt="날짜 선택" title="날짜 선택">
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
		
				                                <!-- //form_box -->
				                                <!-- form_box -->
				                                <div class="form_box">
				                                    <div class="form_title has_btn">
				                                        <label for="prodFilterInput03" class="form_label">주문배송 상태</label>
				                                    </div>
				                                    <div class="form_cont">
				                                        <!-- form_sel -->
				                                        <div class="form_sel w_full">
				                                            <select data-order-delivery-condition-code="" id="ui-id-34" style="display: none;">
				                                            	<option value="">전체</option>
				                                            	<option value="110">주문접수</option>
				                                            	<option value="111">결제완료</option>
				                                            	<option value="112">상품준비중</option>
				                                            	<option value="114">배송중</option>
				                                            	<option value="115">배송완료</option>
				                                            	<option value="132">대기중</option>
				                                            	<option value="133">보기</option>
				                                            	<option value="190">취소완료</option>
				                                            	<option value="194">품절</option>
				                                            	<option value="210">반품신청</option>
				                                            	<option value="260">반품완료</option>
				                                            	<option value="310">교환신청</option>
				                                            	<option value="319">교환완료</option>
				                                            </select>
				                                            <span tabindex="0" id="ui-id-34-button" role="combobox" style="position: relative;">
				                                            	<span class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span>
					                                            <span class="ui-selectmenu-text">전체</span>
					                                            <div dir="ltr" class="resize-sensor" style="position: absolute; inset: -10px 0px 0px -10px; overflow: hidden; z-index: -1; visibility: hidden;">
					                                            	<div class="resize-sensor-expand" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
					                                            		<div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;"></div>
					                                            	</div>
					                                            	<div class="resize-sensor-shrink" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
					                                            		<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
					                                            	</div>
					                                            </div>
				                                            </span>
				                                        </div>
				                                        <!-- //form_sel -->
				                                    </div>
				                                </div>
				                                <!-- //form_box -->
				                                <!-- form_box -->
				                                <div class="form_box">
				                                    <div class="form_title has_btn">
				                                        <label for="prodFilterInput04" class="form_label">검색</label>
				                                    </div>
				                                    <div class="form_cont">
				                                        <!-- form_sort_search -->
				                                        <div class="form_sort_search">
				                                            <div class="form_sel">
				                                                <select id="search_code" style="display: none;">
				                                                    <option value="1">상품명</option>
				                                                    <option value="2">주문번호</option>
				                                                </select>
				                                                <span tabindex="0" id="search_code-button" role="combobox" style="position: relative;">
				                                                	<span class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span>
				                                                	<span class="ui-selectmenu-text">상품명</span>
				                                                	<div dir="ltr" class="resize-sensor" style="position: absolute; inset: -10px 0px 0px -10px; overflow: hidden; z-index: -1; visibility: hidden;">
				                                                		<div class="resize-sensor-expand" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
				                                                			<div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;"></div>
				                                                		</div>
				                                                		<div class="resize-sensor-shrink" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
				                                                			<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
				                                                		</div>
				                                                	</div>
				                                                </span>
				                                            </div>
				                                            <input type="text" title="상품명을 입력하세요." id="searchContent" class="form_ip" placeholder="상품명을 입력해 주세요.">
				                                        </div>
				                                        <!-- //form_sort_search -->
				                                    </div>
				                                </div>
				                                <!-- //form_box -->
			                                </form>
			                            </div>
			                        </div>
			                        <div class="filter_bottom">
			                            <button type="button" class="btn_ip btn_line_gray">
			                            	<span class="ico_reset_lg"></span>
			                            	<span class="text">초기화</span>
			                            </button>
			                            <button type="button" class="btn_ip btn_primary">
			                            	<span class="text">적용</span>
			                            </button>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			        <!-- 주문 요약 정보 -->
			        <div class="order_history_group">
			            <!-- 주문내역 타이틀 영역 -->
			            <div class="order_history_box type_title">
			                <span class="history_val">주문내역</span>
			                <span class="history_desc">
			                    	주문/배송안내
			                    <button type="button" class="btn_info_popup" data-role="btn-dialog" data-target="#popOrderdeliveryinfo">
			                    	<span class="ico_question"></span>
			                    	<span class="hidden"></span>
			                    </button>
			                </span>
			            </div>
			            <c:set var="list" value="${List}" />
			            <!-- //주문내역 타이틀 영역 -->
			            <div class="order_history_box">
			                <button type="button" class="btn_filter_history">
			                    <span class="history_val">0</span>
			                    <span class="history_desc">준비중</span>
			                </button>
			            </div>
			            <div class="order_history_box">
			                <button type="button" class="btn_filter_history">
			                    <span class="history_val">0</span>
			                    <span class="history_desc">배송중</span>
			                </button>
			            </div>
			            <div class="order_history_box">
			                <button type="button" class="btn_filter_history">
			                    <span class="history_val">${list.size() }</span>
			                    <span class="history_desc">배송완료</span>
			                </button>
			            </div>
			            <div class="order_history_box">
			                <button type="button" class="btn_filter_history">
			                    <span class="history_val">0</span>
			                    <span class="history_desc">취소</span>
			                </button>
			            </div>
			            <div class="order_history_box">
			                <button type="button" class="btn_filter_history">
			                    <span class="history_val">0</span>
			                    <span class="history_desc">교환/반품</span>
			                </button>
			            </div>
			        </div>
			        <!-- 주문 배송 내역 -->
			        <!-- 주문 목록 있는 경우 -->
			        <div class="tbl_prod_wrap type_myroom">
					    <!-- repeat -->
						<c:if test="${!empty list}">
						    <c:forEach items="${list}" var="dto" varStatus="status">
						        <c:if test="${status.index == 0 || dto.purchaseNo ne list[status.index - 1].purchaseNo}">
						            <!-- Grouping logic -->
						            <div class="group">
						                <div class="tbl_myorder_inner">
									        <div class="tbl_order_info">
									            <span class="order_date">${dto.purchaseNo.substring(0, 4)}.${dto.purchaseNo.substring(4, 6)}.${dto.purchaseNo.substring(6, 8)}(${dto.purchaseNo })</span>
									            <a href="<%=request.getContextPath() %>/order_history_detail.go?purchasNo=${dto.purchaseNo}" class="btn_more_view">
									            	<span class="text">상세보기</span>
									            	<span class="ico_arw"></span>
									            </a>
									            <div class="right_area">
									                <button type="button" class="btn_delete_text size_xxs">
									                	<span class="ico_delete"></span>
									                	<span class="text">주문내역에서 삭제</span>
									                </button>
												</div>
											</div>
										</div>
						            </div>
						        </c:if>
						        <div class="tbl_prod_inner">
						            <table class="tbl_prod">
						                <caption>주문상품</caption>
						                <colgroup>
						                    <col>
						                    <col style="width: 164px;">
						                    <col style="width: 180px;">
						                    <col style="width: 130px;">
						                </colgroup>
						                <thead class="hidden">
						                    <tr>
						                        <th scope="col">상품정보</th>
						                        <th scope="col">금액</th>
						                        <th scope="col">배송정보</th>
						                        <th scope="col"></th>
						                    </tr>
						                </thead>
						                <tbody>
						                    <!-- Rest of the code specific to each item -->
						                    <tr>
						                        <td class="prod">
						                            <div class="prod_area horizontal">
						                                <div class="prod_thumb_box size_sm">
						                                    <a href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}" class="prod_link">
						                                        <span class="img_box">
						                                            <img src="${dto.bookCover}" alt="뉴턴의 아틀리에">
						                                        </span>
						                                    </a>
						                                </div>
						                                <div class="prod_info_box size_sm">
						                                    <a href="<%=request.getContextPath() %>/bookDetail.go?bookNo=${dto.bookNo}" class="prod_info">
						                                        <span class="prod_name">${dto.bookName}</span>
						                                    </a>
						                                    <ul class="prod_option_list">
						                                        <li class="option_item">
						                                            <span class="text">수량 : </span><span class="val">${dto.bookEA}</span>
						                                        </li>
						                                    </ul>
						                                </div>
						                            </div>
						                        </td>
						                        <td>
						                            <c:set var="discountedPrice" value="${dto.bookPrice * dto.bookEA * 0.9}" />
						                            <fmt:formatNumber value="${discountedPrice}" pattern="#,##0" var="formattedPrice" />
						                            <span class="price">
						                                <span class="val">${formattedPrice}</span>
						                                <span class="unit">원</span>
						                            </span>
						                        </td>
						                        <td>
						                            <div class="delivery_info">
						                                <span class="delivery_state green">배송완료</span>
						                                <p class="delivery_desc">
						                                    <span>2023.05.30</span>
						                                </p>
						                                <div class="btn_wrap auto">
						                                    <button type="button" class="btn_xxs btn_line_gray">
						                                        <span class="text">e-라이브러리</span>
						                                        <span class="ico_arw"></span>
						                                    </button>
						                                </div>
						                            </div>
						                        </td>
						                        <td>
						                            <div class="btn_wrap full">
						                                <button type="button" data-role="btn-dialog" class="btn_sm btn_line_primary">
						                                    <span class="text">리뷰 작성</span>
						                                    <span class="badge_sm badge_pill badge_primary_speech">
						                                        <span class="text">리워드</span>
						                                    </span>
						                                </button>
						                                <button type="button" class="btn_sm btn_line_primary">
						                                    <span class="text">문장수집</span>
						                                    <span class="badge_sm badge_pill badge_primary_speech">
						                                        <span class="text">리워드</span>
						                                    </span>
						                                </button>
						                            </div>
						                        </td>
						                    </tr>
						                    <!-- End of item-specific code -->
						                </tbody>
						            </table>
						        </div>
						    </c:forEach>
						</c:if>
		
					    
		  					<!-- // repeat -->
					</div>
			        <div class="pagination" style="display: none;">
			        	<button class="btn_page prev" disabled="disabled">
			        		<span class="hidden">이전</span>
			        	</button>
			        	<div class="page_num">
			        		<a href="#" class="btn_page_num active" data-index="0" data-role="first" title="현재페이지">1</a>
			        		<span class="text_ellipsis hidden">...</span>
			        		<a href="#" class="btn_page_num hidden" data-index="2" data-role="middle">0</a>
			        		<a href="#" class="btn_page_num hidden" data-index="3" data-role="middle">0</a>
			        		<a href="#" class="btn_page_num hidden" data-index="4" data-role="middle">0</a>
			        		<a href="#" class="btn_page_num hidden" data-index="5" data-role="middle">0</a>
			        		<a href="#" class="btn_page_num hidden" data-index="6" data-role="middle">0</a>
			        		<a href="#" class="btn_page_num hidden" data-index="7" data-role="middle">0</a>
			        		<span class="text_ellipsis hidden">...</span>
			        		<a href="#" class="btn_page_num hidden" data-index="9" data-role="last">0</a>
			        	</div>
			        	<button class="btn_page next" disabled="disabled">
			        		<span class="hidden">다음</span>
			        	</button>
			        </div>
			        <!-- //주문 목록 있는 경우 -->
			
			        <!-- 주문 목록 없는 경우 -->
			        <div class="no_data has_black_line" style="display: none;">
			            <div class="no_data_desc">해당 기간에 주문한 상품이 없습니다.</div>
			        </div>
			        <!-- //주문 목록 없는 경우 -->
		
			        <div class="info_text_box size_lg">
			            <div class="title_wrap title_size_xs">
			                <p class="title_heading">유의사항</p>
			            </div>
			            <ul class="bul_list">
			                <li class="bul_item_dot font_size_xxs">배송조회는 택배사로 상품전달 후 조회 가능합니다.</li>
			                <li class="bul_item_dot font_size_xxs">eBook은 구매 후 다운로드 시 이용할 수 있습니다.</li>
			                <li class="bul_item_dot font_size_xxs">eBook ‘sam’ 이용내역 조회 및 서비스 해지는 마이룸 &gt; sam이용내역 &gt; my이용권 페이지에서 가능합니다.</li>
			                <li class="bul_item_dot font_size_xxs">주문한 상품이 품절될 경우 해당 상품은 자동 취소 신청되며, 취소금액은 승인 취소 또는 예치금으로 반환됩니다.</li>
			                <li class="bul_item_dot font_size_xxs">반환된 예치금은 혜택/포인트 &gt; 예치금에서 환불신청시, 신청계좌로 환불해 드립니다.</li>
			            </ul>
			        </div>
			        <!-- //주문 요약 정보 -->
			        <div class="info_text_box">
			            <div class="title_wrap title_size_sm">
			                <p class="title_heading">카드결제(간편결제,법인카드 포함) 취소 안내</p>
			            </div>
			            <ul class="bul_list">
			                <li class="bul_item_dot font_size_xxs">카드결제 취소 기간 안내
			                    <ul class="bul_list type_sub_sm">
			                        <li class="bul_item_dash font_size_xxs">전체취소 : 당일 취소/환불 처리</li>
			                        <li class="bul_item_dash font_size_xxs">부분취소 : 영업일 기준 3~5일 소요(당일 취소 포함)</li>
			                    </ul>
			                </li>
			                <li class="bul_item_dot font_size_xxs">카드사 정책에 따라 주문당일 부분취소한 경우 당일 취소 및 환불 불가합니다.</li>
			                <li class="bul_item_dot font_size_xxs">부분취소한 경우 카드사 승인 취소는 약 3~5일 소요됩니다.</li>
			                <li class="bul_item_dot font_size_xxs">카드사에서 부분취소를 지원하지 않는 카드의 경우 승인취소가 아닌 예치금으로 환불됩니다.</li>
			                <li class="bul_item_dot font_size_xxs">주문취소시 오류가 발생하거나 환불이 정상 처리되지 않을 경우 1:1로 문의 주시기 바랍니다.</li>
			            </ul>
			        </div>
			    </section>
			</div>
		</section>
	</main>
	</div>
	
	<jsp:include page="../../top/footer.jsp" />
	

</body>
</html>