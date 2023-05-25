<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬 /본인인증</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/member/memberMain.css" />
<link rel="stylesheet" href="resources/css/member/passPhone.css" />
</head>
<body>
	<div class="wrap">
		<header id="header" class="step1header">
			<h1>
				<a href="#">
					<img alt="PASS" src="https://img4.kmcert.com/kmcis/new_web/img/logo_pass.png">
				</a>
			</h1>
			<h4 id="smsh4">문자(SMS)로 인증</h4>
		</header>
		<section id="ct" class="certify_user2 certifyWrap certifyWrap_02">
			  <form id="cplogn" onsubmit="return check()" name="cplogn" method="post" action="<%=request.getContextPath() %>/general_join_form.go">
				<div class="">
				  <fieldset>
					<ul class="frm_type">
					  <li class="name">
						<h3><label for="username">이름</label></h3>
						<div class="input input_del">
						  <input type="text" autocomplete="name" name="memberName" id="memberName" placeholder="성명입력" title="이름" value="">
						</div>
					  </li>
					  
					  <li>
						<h3><label for="mobileno">휴대폰번호</label></h3>
						<div class="inputBtn">
						  <div class="input input_del_btn" style="width: 65%;">
						    <input type="text" name="memberPhone" id="memberPhone" placeholder="숫자만 입력" title="휴대폰번호" maxlength="11" value="">
						  </div>
						  <div style="width: 34%">
						    <button type="button" class="okNobtn" onclick="sendPhone()">인증</button>
						  </div>
						</div>
					  </li>
					  <li>
						<h3><label for="mobileno">인증번호</label></h3>
						<div class="input input_del_btn">
						  <input type="text" name="OkNo" id="OkNo" placeholder="숫자만 입력" title="인증번호" maxlength="6" value="">
						</div>
					  </li>
					</ul>
				  </fieldset>
				  
				  <div class="certi_btn_area">
					<ul class="btn_area2 bt2">
				  	  <li><button type="button" id="btnCancel" class="btn_r btn_type6" onclick="top.window.close();">취소</button></li>
					  <li><button type="submit" id="btnSubmit" class="btn_r btn_type btn_type3">확인</button></li>
					</ul>
				  </div>
				</div>
			  </form>
			</section>
			
			<script type="text/javascript" src="resources/js/member/sendSMS.js"></script>
			
			<div class="footer_kmc">
			<a href="javascript:goAgreePop('/kmcis/comm/kmcisHpUse_popUpBox.html','personal','all');" title="이용약관 전문보기-새창" style="color:#4F4F4F;">이용약관</a> | 
			<a href="#" onclick="javascript:goAgreePop('/kmcis/comm/kmcisHpPersonalPop_popUpBox.html?ver=20201210','personal','all');" title="개인정보처리방침 전문보기-새창" style="color:#4F4F4F;">
			개인정보처리방침</a> | <span style="color:#4F4F4F;">GlobalSign 256 SSL 암호화 적용</span>
			<span class="kmc_logo"></span>
			<div style="float:right; margin-top:50% color:#4F4F4F; width:72px; height:23px; overflow:hidden; line-height:0; text-indent:-9999px" title="한국모바일인증 로고">한국모바일인증 로고</div>
		</div>
	</div>
</body>
</html>