<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/로그인</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/member/memberMain.css" />
<link rel="stylesheet" href="resources/css/member/login.css" />
<link rel="stylesheet" href="resources/css/member/join.css" />
<link rel="stylesheet" href="resources/css/member/pwdReset.css" />

</head>
<body>

	<div class="wrapper member_login" id="main">
		<header class="header_wrapper">
			<div class="header_inner">
				<div class="logo_box">
					<a class="logo_link">
						<img src="resources/img/peterPanLogo.png" height="110px" width="180px">
					</a>
				</div>
			</div>
		</header>
		
		<main class="container_wrapper" style="margin-top: 15px;">
        	<section class="contents_wrap login">
		        <div class="ico_info_wrap">
		            <div class="ico_img_box">
		                <span class="ico_member_restore"></span>
		            </div>
		            <div class="ico_text_box">
		                <div class="ico_title">인증되었습니다.<br>새로운 비밀번호를 설정해 주세요.</div>
		            </div>
		        </div>
		        <div class="form_wrap">
		        	<form id="join_form" name="f" method="post" onsubmit="return check()" action="<%=request.getContextPath() %>/pwd_reset_ok.go">
						<div class="joinforminsert">
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin02" class="form_label">
										<span class="form_label_span">비밀번호</span>
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									</label>
								</div>
								<div class="form_cont">
									<div class="form_if_pwd">
										<input type="password" name="memberPwd" class="form_ip" id="formJoin02" onkeyup="checkInput(this, 'pwd')" placeholder="비밀번호를 입력해 주세요." maxlength="15">
									</div>
									<span id="pwdcheck" class="validcheck" style="display: none;"></span>
									<div class="pw_valid_wrap">
										<div class="valid_step_box">
											<ol class="valid_step_list">
												<li class="step_item" id="validStep1">
													<span class="hidden">안전도 낮음</span>
												</li>
												<li class="step_item" id="validStep2">
													<span class="hidden">안전도 보통</span>
												</li>
												<li class="step_item" id="validStep3">
													<span class="hidden">안전도 높음</span>
												</li>
											</ol>
											<div class="bubble_speech_box">
												<span class="valid_state">안전도</span>
											</div>
										</div>
										<ul class="pw_valid_list">
											<li class="pw_valid_item" id="pw_valid1">
												영문, 숫자, 특수문자 3가지 조합 8자리 이상 15자리 이하
											</li>
											<li class="pw_valid_item" id="pw_valid2">
												공백 및 3자 이상의 연속 또는 중복 문자는 사용 불가
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin03" class="form_label">
										<span class="form_label_span">비밀번호 확인</span>
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									</label>
								</div>
								<div class="form_cont">
									<input type="password" name="memberCheckPwd" class="form_ip" id="formJoin03" onkeyup="checkInput(this, 'chkpwd')" placeholder="비밀번호를 한 번 더 입력해 주세요." maxlength="15">
								</div>
								<span id="chkpwdcheck" class="validcheck" style="display: none;"></span>
							</div>
						</div>
						
						<!-- 비밀번호 재설정 유효성 검사 js -->
						<script type="text/javascript" src="resources/js/member/pwdReset.js"></script>
						
						<div class="join_form_wrap">
							<div class="login_btn_wrap">
								<button form="join_form" type="submit" id="submitBtn" class="login_button" style="width: 340px;">
									<span class="text">확인</span>
								</button>
							</div>
						</div>
					</form>
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

</body>
</html>