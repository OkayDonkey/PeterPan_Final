<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" />
<meta charset="UTF-8">
<title>피터팬</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/member/memberMain.css" />
<link rel="stylesheet" href="resources/css/member/login.css" />
<link rel="stylesheet" href="resources/css/member/join.css" />
<link rel="stylesheet" href="resources/css/member/id_pwd_search.css" />
<link rel="stylesheet" href="resources/css/member/memberInfoModify.css" />
</head>
<body>
	<div class="wrapper member_join member_info" id="main">
		<header class="header_wrapper">
			<div class="header_inner">
				<div class="logo_box">
					<a class="logo_link">
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
		
		<main class="container_wrapper" style="margin-bottom: 140px;">
			<section class="breadcrumb_wrap">
			    <div class="breadcrumb_inner" style="margin-bottom: 75px;">
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
			                                    	교보북클럽 카드 관리
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
			        </ol>
			    </div>
        	<section class="contents_wrap login" style="width: 400px;">
		        <div class="ico_info_wrap" style="margin-bottom: 16px;">
		            <div class="ico_img_box">
		                <span class="ico_member_restore"></span>
		            </div>
		            <div class="ico_text_box">
		                <div class="ico_title">비밀번호 확인<br><span style="font-size: 14px;">안전한 개인정보보호를 위해 비밀번호를 입력해 주세요.</span></div>
		            </div>
		        </div>
		        
		        <div id="tabContentFindId" class="tab_content ui-tabs-panel ui-corner-bottom ui-widget-content" aria-labelledby="ui-id-1" role="tabpanel" aria-hidden="false">
					  <div class="fold_box_wrap">
					    <ul class="fold_box_list">
					      <li class="fold_box expanded" id="IdphoneFind">
					        <div class="fold_box_header">
					          <h2>비밀번호 확인</h2>
					          <button type="button" class="btn_fold">
					            <span class="hidden">컨텐츠 닫기</span>
					          </button>
					        </div>
					        <div class="fold_box_contents">
					          <div class="form_wrap">
					            <div class="form_box">
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="password" id="pwdCheck" class="form_ip" placeholder="비밀번호를 입력해 주세요." maxlength="40" data-autocomplete="false">
					                  <span class="valid_desc" id="pwdCheck_valid">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					          </div>
					          <div class="btn_wrap justify">
					            <a class="btn_lg btn_light_gray" id="phoneFormFindIdBtn" onclick="checkPassword()">
					              <span class="text">확인</span>
					            </a>
					          </div>
					        </div>
					      </li>
					    </ul>
					  </div>
					</div>
			</section>
		</section>
      </main>
      <footer class="footer_wrapper">
		<div class="footer_inner">
			<div class="copyright">
				© PeterPan BOOK CENTREs
			</div>
		</div>
	</footer>
	</div>
	
	<script type="text/javascript" src="resources/js/member/myPagepwdCheck.js"></script>
	
</body>
</html>
