<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/휴대폰 인증</title>
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
		</header>
		<section id="ct">
		<form id="myForm" action="phoneCheck_form.go" onsubmit="return check()" method="POST">
			<fieldset class="ui_cover agency_select">
				<p>이용중이신 통신사를 선택해주세요.</p>
				<ul class="agency_select__items">
					<li aria-label="SK telecom">
						<input type="radio" name="mobileco" id="agency-sk" value="SKT" title="SK telecom 선택" aria-label="SK telecom 선택">
						<label for="agency-sk" aria-hidden="true" onclick="checkTelecom('SKT')" class="ui_align_mid checked">
							<span class="ele">
								<img alt="SK telecom 선택" src="https://img4.kmcert.com/kmcis/new_web/img/logo_sk.png" class="active firstChild">
								<img alt="SK telecom 미선택" src="https://img4.kmcert.com/kmcis/new_web/img/logo_sk_gray.png" class="lastChild">
							</span>
						</label>
					</li>
					<li aria-label="KT">
						<input type="radio" name="mobileco" id="agency-kt" value="KT" title="KT 선택" aria-label="KT 선택">
						<label for="agency-kt" aria-hidden="true" onclick="checkTelecom('KT')" class="ui_align_mid checked">
							<span class="ele">
								<img alt="KT 선택" src="https://img4.kmcert.com/kmcis/new_web/img/logo_kt.png" class="active firstChild" style="width: 34px;">
								<img alt="KT 미선택" src="https://img4.kmcert.com/kmcis/new_web/img/logo_kt_gray.png" class="lastChild" style="width: 34px;">
							</span>
						</label>
					</li>
					<li aria-label="LG U+">
						<input type="radio" name="mobileco" id="agency-lg" value="LG" title="LG U+ 선택" aria-label="LG U+ 선택">
						<label for="agency-lg" aria-hidden="true" onclick="checkTelecom('LG')" class="ui_align_mid checked">
							<span class="ele">
								<img alt="LG U+ 선택" src="https://img4.kmcert.com/kmcis/new_web/img/logo_lgu.png" class="active firstChild">
								<img alt="LG U+ 미선택" src="	https://img4.kmcert.com/kmcis/new_web/img/logo_lgu_gray.png" class="lastChild">
							</span>
						</label>
					</li>
					<li aria-label="알뜰폰">
						<input type="radio" name="mobileco" id="agency-and" value="MVNO" title="알뜰폰 선택" aria-label="알뜰폰 선택">
						<label for="agency-and" aria-hidden="true" onclick="checkTelecom('알뜰폰')" class="ui_align_mid checked">
							<span class="ele">
								<img alt="알뜰폰 선택" src="https://img4.kmcert.com/kmcis/new_web/img/logo_and.png" class="active firstChild" style="width: 80px;">
								<img alt="알뜰폰 미선택" src="	https://img4.kmcert.com/kmcis/new_web/img/logo_and_gray.png" class="lastChild" style="width: 80px;">
							</span>
						</label>
					</li>
				</ul>
				
				<!-- 전체 동의 -->
				<ul class="agreelist all">
					<li>
						<span class="checkbox check2">
							<input type="checkbox" name="agree" id="agree_all">
							<label for="agree_all" class="">전체 동의하기</label>
							<label for="agree_all">전체 동의</label>
						</span>
					</li>
				</ul>
				<ul class="agreelist required">
					<li>
						<span class="checkbox check2">
							<input type="checkbox" name="agree1" id="agree1" value="Y">
							<label for="agree1" class="">개인정보이용 동의하기</label>
							<button type="button" class="btn_agree_popup" id="agree1Pop" title="개인정보이용동의 레이어 팝업 열기">개인정보이용동의</button>
						</span>
					</li>
					<li>
						<span class="checkbox check2">
							<input type="checkbox" name="agree2" id="agree2" value="Y">
							<label for="agree2" class="">고유식별정보처리 동의하기</label>
							<button type="button" class="btn_agree_popup" id="agree2Pop" title="고유식별정보처리동의 레이어 팝업 열기">고유식별정보처리동의</button>
						</span>
					</li>
					<li>
						<span class="checkbox check2">
						<input type="checkbox" name="agree3" id="agree3" value="Y">
							<label for="agree3" class="">서비스이용약관 동의하기</label>
							<button type="button" class="btn_agree_popup" id="agree3Pop" title="서비스이용약관동의 레이어 팝업 열기">서비스이용약관동의</button>
						</span>
					</li>
					<li>
						<span class="checkbox check2">
							<input type="checkbox" name="agree4" id="agree4" value="Y">
							<label for="agree4" class="">통신사이용약관 동의하기</label>
							<button type="button" class="btn_agree_popup" id="agree4Pop" title="통신사이용약관동의 레이어 팝업 열기">통신사이용약관동의</button>
						</span>
					</li>
				</ul>
				<button type="submit" id="btnSms" class="btn_r btn_type6 btn_r btn_skip2">문자(SMS)로 인증하기</button>
			</fieldset>
			
			<!-- 선택 js -->
			<script type="text/javascript" src="resources/js/member/phoneChk.js"></script>
		</form>
			
			
			
			
		</section>
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