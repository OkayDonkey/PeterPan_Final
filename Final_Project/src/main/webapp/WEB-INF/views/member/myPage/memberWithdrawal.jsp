<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" />
<meta charset="UTF-8">
<title>피터팬/회원 탈퇴</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<link rel="stylesheet" href="resources/css/member/memberMain.css" />
<link rel="stylesheet" href="resources/css/member/memberInfoModify.css" />
<link rel="stylesheet" href="resources/css/member/memberWithdrawal.css" />

</head>
<body>
	<div class="wrapper member_info" id="main">
		<header class="header_wrapper">
			<div class="header_inner">
				<div class="logo_box">
					<a class="logo_link" href="<%=request.getContextPath() %>/">
						<img src="resources/img/peterPanLogo.png" width="162px" style="height: fit-content; width: -webkit-fill-available;">
					</a>
				</div>
				<div class="member_gnb_wrap">
					<div class="btn_wrap">
						<a href="<%=request.getContextPath() %>/logout.go" class="btn_xxs btn_pill btn_lighten_gray">
				            <span style="font-size: 12px;" class="text">로그아웃</span>
				            <span class="ico_arw"></span>
				        </a>
					</div>
					<ul class="member_gnb_list">
						<li class="member_gnb_item active">
			                <a href="<%=request.getContextPath() %>/member_info_midify_pwdcheck.go" class="member_gnb_link">회원정보 관리</a>
			            </li>
					</ul>
				</div>
			</div>
		</header>
		
		<main class="container_wrapper">
			<section class="breadcrumb_wrap">
			    <div class="breadcrumb_inner">
			        <ol class="breadcrumb_list">
			        
			            <!--홈 메뉴 (고정) -->
			            <li class="breadcrumb_item"><a class="home_link" href="<%=request.getContextPath() %>/">home</a></li>
			            <li class="breadcrumb_item no_sub"><a class="btn_sub_depth" href="<%=request.getContextPath() %>/myPage.go">마이</a></li>
			            
			            <!-- 0차 메뉴 (고정) -->
			            <li class="breadcrumb_item">
			                <a class="btn_sub_depth" href="<%=request.getContextPath() %>/member_info_midify_pwdcheck.go">
			                  	  회원정보
			                </a>
			                <div class="sub_depth_grid">
			                    <div class="sub_depth_box">
			                        <ul class="sub_depth_list">
			                            <li class="depth_item">
			                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/member/order-list">
			                                   	 쇼핑내역
			                                </a>
			                            </li>
			                            <li class="depth_item">
			                                <a class="depth_link" href="https://my.kyobobook.co.kr/library">
			                                   	 라이브러리
			                                </a>
			                            </li>
			                            <li class="depth_item">
			                                <a class="depth_link" href="https://my.kyobobook.co.kr/activity/community">
			                                  	  활동내역
			                                </a>
			                            </li>
			                            <li class="depth_item">
			                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/benefit/coupon-list">
			                                   	 혜택/포인트
			                                </a>
			                            </li>
			                            <li class="depth_item">
			                                <a class="depth_link" href="https://my.kyobobook.co.kr/consult">
			                                    	문의내역
			                                </a>
			                            </li>
			                            <li class="depth_item active">
			                                <a class="depth_link" href="https://order.kyobobook.co.kr/myroom/member/address">
			                                    	회원정보
			                                </a>
			                            </li>
			                            <li class="depth_item">
			                                <a class="depth_link" href="https://my.kyobobook.co.kr/notice">
			                                    	알림센터
			                                </a>
			                            </li>
			                        </ul>
			                    </div>
			                </div>
			            </li>
			            
			            
			            <li class="breadcrumb_item">
			                <a class="btn_sub_depth" href="#">
			                    	회원정보 관리
			                </a>
			                <div class="sub_depth_grid">
			                    <div class="sub_depth_box">
			                        
			                        <ul class="sub_depth_list">
			                            <li class="depth_item active">
			                                <a class="depth_link" href="https://mmbr.kyobobook.co.kr/member-info">
			                                   	 회원정보 관리
			                                </a>
			                            </li>
			                            <li class="depth_item">
			                                <a class="depth_link" href="https://mmbr.kyobobook.co.kr/member-info/card">
			                                    	피터팬북클럽 카드 관리
			                                </a>
			                            </li>
			                            <li class="depth_item">
			                                <a class="depth_link" href="https://mmbr.kyobobook.co.kr/member-info/benefit">
			                                    	나의 회원등급 혜택
			                                </a>
			                            </li>
			                            <li class="depth_item">
			                                <a class="depth_link" href="https://mmbr.kyobobook.co.kr/benefit">
			                                   	 회원 혜택
			                                </a>
			                            </li>
			                        </ul>
			                    </div>
			                </div>
			            </li>
			
			            
			            <li class="breadcrumb_item">
			                <a class="btn_sub_depth" href="#">
			                    	회원정보 수정
			                </a>
			                <div class="sub_depth_grid">
			                    <div class="sub_depth_box">
			                        <ul class="sub_depth_list">
			                            <li class="depth_item active">
			                                <a class="depth_link" href="https://mmbr.kyobobook.co.kr/member-info">
			                                    	회원정보 수정
			                                </a>
			                            </li>
			                            <li class="depth_item">
			                                <a class="depth_link" href="https://mmbr.kyobobook.co.kr/member-info/sns">
			                                   	 로그인 설정
			                                </a>
			                            </li>
			                            <li class="depth_item">
			                                <a class="depth_link" href="https://mmbr.kyobobook.co.kr/member-info/subscribe">
			                                   	 마케팅 수신 및 정보 제공 동의 관리
			                                </a>
			                            </li>
			                        </ul>
			                    </div>
			                </div>
			            </li>
			
			            <li class="breadcrumb_item">
			                <a class="btn_sub_depth" href="#">
			                    	회원탈퇴
			                </a>
			                <div class="sub_depth_grid">
			                    <div class="sub_depth_box">
			                        <ul class="sub_depth_list">
			                            <li class="depth_item active">
			                                <a class="depth_link" href="https://mmbr.kyobobook.co.kr/member-info/withdrawal">
			                                   	 회원탈퇴
			                                </a>
			                            </li>
			                        </ul>
			                    </div>
			                </div>
			            </li>
			        </ol>
			    </div>
			</section>
			<section id="contents" class="contents_wrap">
			   <div class="contents_inner" style="margin-bottom: 100px;">
			        <div class="title_wrap title_size_lg">
			            <h1 class="title_heading">회원탈퇴</h1>
			        </div>
			        <div class="member_usage_status">
			            <div class="title_wrap title_size_md">
			                <h2 class="title_heading fw_regular"><span class="fw_bold">${session.memberName }</span> 님의 보유 이용정보</h2>
			            </div>
			            <div class="usage_status_group">
			                <div class="usage_status_box">
			                    <ul class="usage_status_list">
			                        
			                        <li class="usage_status_item">
			    <span class="usage_title">진행 중 주문</span>
			        <div class="tooltip_wrap type_sm">
			            <button type="button" class="btn_tooltip" style="border: none;">
			                <span class="ico_info"></span>
			                <span class="hidden">툴팁열기</span>
			            </button>
			            <div class="tooltip_inner">
							<div class="tooltip_header">
							    <h1 class="tooltip_title">진행 중 주문</h1>
							</div>
							<div class="tooltip_contents">
							    <div class="tooltip_info_list">
							        <div class="tooltip_info_item">
							            <div class="info_cont">
							                <ul class="bul_list">
							                    <li class="bul_item_dot font_size_xxs">
							                        <span class="cont_title">피터팬문고 주문 건</span>
							                        <span class="cont_desc"><span class="fw_medium fc_black">0</span>건</span>
							                    </li>
							                    <li class="bul_item_dot font_size_xxs">
							                        <span class="cont_title">피터팬핫트랙스 주문 건</span>
							                        <span class="cont_desc"><span class="fw_medium fc_black">0</span>건</span>
							                    </li>
							                </ul>
							            </div>
							        </div>
							    </div>
							</div>
			                <button type="button" class="btn_tooltip_close">
			                    <span class="hidden">툴팁닫기</span>
			                </button>
			            </div>
			        </div>
			    <div class="right_box">
			        <a href="https://order.kyobobook.co.kr/myroom/member/order-list" class="btn_text_link fc_black">
			            <span class="fw_bold">0</span>건
			        </a>
			    </div>
			</li>
           </ul>
       </div>
       <div class="usage_status_box">
           <ul class="usage_status_list">
               <li class="usage_status_item">
			    <span class="usage_title">예치금</span>
			    <div class="right_box">
			        <a href="https://order.kyobobook.co.kr/myroom/benefit/deposit" class="btn_text_link fc_black">
			            <span class="fw_bold" data-bnbl-blce="0" data-form="bnblBlce">0</span>원
			        </a>
			    </div>
			</li>
			<li class="usage_status_item">
			    <span class="usage_title">피터팬캐시</span>
			    <div class="right_box">
			        <a href="https://order.kyobobook.co.kr/myroom/benefit/kyobocash" class="btn_text_link fc_black">
			            <span class="fw_bold">0</span>원
			        </a>
			    </div>
			</li>
			<li class="usage_status_item">
			    <span class="usage_title">피터팬e캐시</span>
			    <div class="right_box">
			        <a href="https://order.kyobobook.co.kr/myroom/benefit/ecash" class="btn_text_link fc_black">
			            <span class="fw_bold">0</span>원
			        </a>
			    </div>
			</li>
		</ul>
        </div>
        <div class="usage_status_box">
            <ul class="usage_status_list">
              <li class="usage_status_item">
			    <span class="usage_title">교환권</span>
			    <div class="right_box">
			        <a href="https://order.kyobobook.co.kr/myroom/benefit/ecoupon" class="btn_text_link fc_black">
			            <span class="fw_bold">0</span>원
			        </a>
			    </div>
			</li>
			<li class="usage_status_item">
			    <span class="usage_title">통합포인트</span>
			    <div class="right_box">
			        <a href="https://order.kyobobook.co.kr/myroom/benefit/point" class="btn_text_link fc_black">
			            <span class="fw_bold">${session.point }</span>P
			        </a>
			    </div>
			</li>
			<li class="usage_status_item">
			    <span class="usage_title">마일리지</span>
			    <div class="right_box">
			        <a href="https://order.kyobobook.co.kr/myroom/benefit/mileage" class="btn_text_link fc_black">
			            <span class="fw_bold" data-mlg-blce="0" data-form="mlgBlce">0</span>원
			        </a>
			    </div>
			</li>
           </ul>
       </div>
   </div>

   <div class="secession_fail_desc hidden">
       <div class="secession_fail_inner">
           <span class="desc">회원님은 즉시 탈퇴가 <span class="fw_bold">불가</span>합니다.</span>
           <div class="tooltip_wrap type_xs">
               <button type="button" class="btn_tooltip"><span class="ico_info"></span><span class="hidden">툴팁열기</span></button>
               <div class="tooltip_inner">
			                            
			<div class="tooltip_header">
			    <h1 class="tooltip_head_title">회원탈퇴 보류 사유</h1>
			</div>
			<div class="tooltip_contents">
			    <h2 class="tooltip_sub_title">주문 진행 중/발송완료</h2>
			    <ul class="bul_list">
			        <li class="bul_item_dot font_size_xxs">진행 중인 거래(구매) 내역이 있는 경우</li>
			        <li class="bul_item_dot font_size_xxs">일반/예약주문/해외발주 진행 중</li>
			        <li class="bul_item_dot font_size_xxs">발송완료 후 15일이 경과되지 않은 경우</li>
			    </ul>
			
			    <h2 class="tooltip_sub_title">중고장터 판매자/구매자</h2>
			    <ul class="bul_list">
			        <li class="bul_item_dot font_size_xxs">진행 중인 거래 (판매/구매) 내역이 있는 경우</li>
			    </ul>
			
			    <h2 class="tooltip_sub_title">sam 이용권</h2>
			    <ul class="bul_list">
			        <li class="bul_item_dot font_size_xxs">정기 결제 진행 중인 경우</li>
			    </ul>
			
			    <h2 class="tooltip_sub_title">톡소다</h2>
			    <ul class="bul_list">
			        <li class="bul_item_dot font_size_xxs">서비스 이용 중인 경우</li>
			    </ul>
			
			    <h2 class="tooltip_sub_title">통장 내역</h2>
			    <ul class="bul_list">
			        <li class="bul_item_dot font_size_xxs">통장내역 중 마이너스 예치금이 있는 경우</li>
			        <li class="bul_item_dot font_size_xxs">통장내역 중 1,000원 이상의 예치금이 남아 있는 경우</li>
			    </ul>
			</div>

                            <button type="button" class="btn_tooltip_close"><span class="hidden">툴팁닫기</span></button>
                        </div>
                    </div>
                </div>
            </div>

            
            <div class="round_gray_box type_sub">
				<div class="title_wrap title_size_sm">
				    <div class="title_heading">회원탈퇴 시 유의사항</div>
				</div>
				<ul class="bul_list">
				    <li class="bul_item_dot font_size_xs">회원탈퇴 시 모든 회원정보와 <span class="fc_red fw_medium">할인쿠폰, 통합포인트, 마일리지, 교환권, 피터팬캐시, 피터팬 e캐시, 구매내역</span>이 자동으로 삭제 처리되며, 복구가 불가합니다.</li>
				    <li class="bul_item_dot font_size_xs">자동 삭제 항목(복구 불가능) : 회원정보, 상품구매, eBook 콘텐츠, 할인쿠폰, 마일리지, 통합포인트, 예치금, 피터팬e캐시 등의 모든 내역</li>
				    <li class="bul_item_dot font_size_xs">회원가입 유형에 따라 피터팬문고 또는 피터팬핫트랙스 통합멤버십 회원탈퇴가 동시에 됩니다.</li>
				    <li class="bul_item_dot font_size_xs">회원 아이디에 대해서는 서비스 이용의 혼선 방지, 법령에서 규정하는 회원 거래 정보의 보존 기간 동안의 보관 의무의 이행, 기타 안정적인 서비스 제공을 위하여 필요한 정보이므로 탈퇴 후 동일 아이디로의 재가입은 허용되지 않습니다.</li>
				</ul>
				</div>
		        </div>
		
		        
		        <div class="title_wrap has_sub_title title_size_md">
				    <h2 class="title_heading">탈퇴사유</h2>
				    <p class="info_text">피터팬을 이용하면서 느꼈던 불편사항을 선택해 주세요.<br>향후 보다 나은 서비스 제공을 위한 소중한 자료로 반영하겠습니다.</p>
				</div>
				        <div class="tbl_col_wrap type_td_line">
				            <table class="tbl_col_line">
				                <caption>탈퇴사유 테이블로 상품, 서비스, 시스템/기타을(를) 나타낸 표입니다.</caption>
				                <colgroup>
				                    <col style="width: 130px;">
				                    <col style="width: auto">
				                </colgroup>
				                <tbody>
				                    <tr>
				                        <th scope="row">상품</th>
				                        <td class="align_left">
				                            <ul class="chk_row_list">
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode101" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="101">
				                                        <label for="mmbrWdrlRsnCode101">찾는상품 없음</label>
				                                    </span>
				                                </li>
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode102" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="102">
				                                        <label for="mmbrWdrlRsnCode102">상품정보 부족</label>
				                                    </span>
				                                </li>
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode103" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="103">
				                                        <label for="mmbrWdrlRsnCode103">상품품질 불만</label>
				                                    </span>
				                                </li>
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode104" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="104">
				                                        <label for="mmbrWdrlRsnCode104">가격 불만</label>
				                                    </span>
				                                </li>
				                            </ul>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row">서비스</th>
				                        <td class="align_left">
				                            <ul class="chk_row_list">
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode105" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="105">
				                                        <label for="mmbrWdrlRsnCode105">배송 불만</label>
				                                    </span>
				                                </li>
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode106" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="106">
				                                        <label for="mmbrWdrlRsnCode106">사이트 이용 불편</label>
				                                    </span>
				                                </li>
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode107" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="107">
				                                        <label for="mmbrWdrlRsnCode107">결제 불편</label>
				                                    </span>
				                                </li>
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode108" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="108">
				                                        <label for="mmbrWdrlRsnCode108">반품/교환/환불 불만</label>
				                                    </span>
				                                </li>
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode109" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="109">
				                                        <label for="mmbrWdrlRsnCode109">회원혜택 부족</label>
				                                    </span>
				                                </li>
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode110" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="110">
				                                        <label for="mmbrWdrlRsnCode110">불친절</label>
				                                    </span>
				                                </li>
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode111" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="111">
				                                        <label for="mmbrWdrlRsnCode111">매장이용 불편</label>
				                                    </span>
				                                </li>
				                            </ul>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row">시스템/기타</th>
				                        <td class="align_left">
				                            <ul class="chk_row_list">
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode112" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="112">
				                                        <label for="mmbrWdrlRsnCode112">상품검색 불편</label>
				                                    </span>
				                                </li>
				                                <li class="chk_row_item">
				                                    <span class="form_rdo">
				                                        <input id="mmbrWdrlRsnCode113" type="radio" name="mmbrWdrlRsnCode" required="" data-form="mmbrWdrlRsnCode" value="113">
				                                        <label for="mmbrWdrlRsnCode113">개인정보/보안 우려</label>
				                                    </span>
				                                </li>
				                            </ul>
				                        </td>
				                    </tr>
				                </tbody>
				            </table>
				        </div>
						<div class="round_gray_box type_sub">
						    <ul class="chk_col_list" style="list-style: none; padding-inline-start: 0px;">
						        <li class="chk_col_item">
						            <span class="form_chk">
						                <input id="agreeWithdrawal" type="checkbox" value="Y" required="" data-form="agreeWithdrawal">
						                <label for="agreeWithdrawal">회원탈퇴 안내 사항을 확인했으며 탈퇴에 동의합니다. <span class="fc_green">(필수)</span></label>
						            </span>
						        </li>
						        <li class="chk_col_item">
						            <span class="form_chk">
						                <input id="agreeExpire" type="checkbox" value="Y" required="" data-form="agreeExpire">
						                <label for="agreeExpire">모든 금권 혜택 자동소멸에 동의합니다. <span class="fc_green">(필수)</span></label>
						            </span>
						        </li>
						    </ul>
						</div>
					    <div class="btn_wrap page_bottom">
					        <button type="button" onclick="location.href='<%=request.getContextPath() %>/myPage.go'" class="btn_lg btn_light_gray" data-handler="cancel">
					            <span class="text">취소</span>
					        </button>
					        <button style="background: #474c98; color: white; }" type="button" id="withdrawalBtn" class="btn_lg btn_primary" data-withdrawal-usage="true" data-exist-usage="true" data-cancel-tocsoda="true" data-handler="withdrawal">
					            <span class="text">회원탈퇴</span>
					        </button>
					    </div>
                   </div>
           </section>
       </main>
       
       <script type="text/javascript" src="resources/js/member/memberWithdrawal.js"></script>
       
       <footer class="footer_wrapper">
			<div class="footer_inner">
				<div class="copyright">
					© PeterPan BOOK CENTREs
				</div>
			</div>
		</footer>
    </div>
</body>
</html>