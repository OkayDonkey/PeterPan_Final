<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/member/memberMain.css" />
<link rel="stylesheet" href="resources/css/member/login.css" />
<link rel="stylesheet" href="resources/css/member/join.css" />
<link rel="stylesheet" href="resources/css/member/id_pwd_search.css" />
</head>
<body>
	<div class="wrapper member_login" id="main">
		<main class="container_wrapper" style="margin-top: 15px;">
        	<section class="contents_wrap login">
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
