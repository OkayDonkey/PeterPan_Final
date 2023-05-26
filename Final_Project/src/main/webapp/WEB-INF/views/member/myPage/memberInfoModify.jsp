<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/회원정보수정</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<!-- 다음 주소 가져오는 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 다음 주소 가져오는 api end -->
<link rel="stylesheet" href="resources/css/member/memberMain.css" />
<link rel="stylesheet" href="resources/css/member/login.css" />
<link rel="stylesheet" href="resources/css/member/join.css" />
</head>
<body>

	<div class="wrapper member_join" id="main">
		<header class="header_wrapper">
			<div class="header_inner">
				<div class="logo_box">
					<a class="logo_link">
						<img src="resources/css/images/logo/peterpan_logo.png" height="90px" width="180px">
					</a>
				</div>
			</div>
		</header>
		
		<main class="container_wrapper">
			<div class="join_contents_wrap">
				<div class="title_wrap">
					<p class="title_heading">회원정보 수정</p>
				</div>
				
				<div class="title_wrap_def">
					<p class="title_heading" style="font-size: 16px;">회원정보 입력</p>
					<div class="right_area">
						<span class="required">
							필수 입력
						</span>
					</div>
				</div>
				
				<div class="form_wrap">
					<form id="join_form" name="f" method="post" onsubmit="return check()" action="<%=request.getContextPath() %>/general_join_ok.go">
						<div class="joinforminsert">
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin01" class="form_label">
										<span class="form_label_span">아이디</span>
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									</label>
								</div>
								<div class="form_cont">
									<input type="text" value="${session.memberId }" readonly name="memberId" class="form_ip" id="formJoin01" onkeyup="checkInput(this, 'id')" placeholder="아이디를 입력해 주세요." maxlength="20">
								</div>
								<span id="idcheck" class="validcheck" style="display: none;"></span>
							</div>
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin02" class="form_label">
										<span class="form_label_span">새 비밀번호</span>
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
											<li class="pw_valid_item" id="pw_valid3">
												아이디 등 개인신상 정보 사용 불가
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin03" class="form_label">
										<span class="form_label_span">새 비밀번호 확인</span>
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
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin04" class="form_label">
										<span class="form_label_span">이름</span>
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									</label>
								</div>
								<div class="form_cont">
									<input type="text" name="memberName" value="${session.memberName }" readonly class="form_ip" id="formJoin04" onkeyup="checkInput(this, 'name')" placeholder="이름을 입력해 주세요." maxlength="20">
								</div>
								<span id="namecheck" class="validcheck" style="display: none;"></span>
							</div>
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin05" class="form_label">
										<span class="form_label_span">휴대폰번호</span>
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									</label>
								</div>
								<div class="form_cont">
									<div class="form_cont">
										<input type="text" name="memberPhone" value="${session.memberPhone}" class="form_ip" id="formJoin05" placeholder="휴대폰 번호를 입력해 주세요." onkeyup="checkInput(this, 'phone')" maxlength="13">
									</div>
									<span id="phonecheck" class="validcheck" style="display: none;"></span>
								</div>
							</div>
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin06" class="form_label">
										<span class="form_label_span">이메일</span>
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									</label>
								</div>
								<div class="form_cont">
									<div class="form_cont">
										<input type="text" name="memberEmail" class="form_ip" readonly value="${session.memberEmail }" id="formJoin06" onkeyup="checkInput(this, 'email')" placeholder="이메일을 입력해 주세요." maxlength="50">
									</div>
									<span id="emailcheck" class="validcheck" style="display: none;"></span>
								</div>
							</div>
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin07" class="form_label">
										<span class="form_label_span">생년월일/성별</span>
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									</label>
								</div>
								<div class="form_cont">
									<div class="input_btn_box">
										<input type="text" name="memberBirth" value="${session.memberBirth }" readonly class="form_ip" id="formJoin07" onkeyup="checkInput(this, 'birth')" placeholder="생년월일 8자리를 입력해 주세요." maxlength="8">
										<div class="form_filter_box">
											<c:if test="${session.memberGender == '여'}">
												<span class="form_filter">
													<input id="rdoFilter02" type="radio" disabled onchange="checkGender()" name="memberGender" value="남">
													<label for="rdoFilter02">
														<span>남</span>
													</label>
												</span>
												<span class="form_filter">
													<input id="rdoFilter01" type="radio" name="memberGender" checked onchange="checkGender()" value="여">
													<label for="rdoFilter01">
														<span>여</span>
													</label>
												</span>
											</c:if>
											<c:if test="${session.memberGender == '남'}">
												<span class="form_filter">
													<input id="rdoFilter02" type="radio" onchange="checkGender()" checked name="memberGender" value="남">
													<label for="rdoFilter02">
														<span>남</span>
													</label>
												</span>
												<span class="form_filter">
													<input id="rdoFilter01" type="radio" disabled name="memberGender" onchange="checkGender()" value="여">
													<label for="rdoFilter01">
														<span>여</span>
													</label>
												</span>
											</c:if>
										</div>
										<span id="child_valid" class="valid_desc" style="display: none;">
											만 14세 미만 회원은 법정대리인(보호자)인증 후 가입이 가능합니다.
										</span>
										<span class="valid_desc fir">
											생년월일 8자리를 입력해 주세요.
										</span>
										<span id="gender_valid" class="valid_desc" style="display: none;">
											성별을 선택해 주세요.
										</span>
									</div>
									<span id="birthcheck" class="validcheck" style="display: none;"></span>
									<span id="gendercheck" class="validcheck" style="display: none;"></span>
								</div>
							</div>
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin05" class="form_label">
										<span class="form_label_span">주소</span>
										<span class="required">
											<span class="hidden">필수입력</span>
										</span>
									</label>
								</div>
								
								<div class="form_cont">
									<div class="input_btn_box">
										<input type="text" value="${session.addrPost }" id="post" name="addrPost" class="form_ip" id="formJoin06" onkeyup="checkInput(this, 'addr')" placeholder="우편변호" readonly>
										<button type="button" class="btn_ip btn_light_gray" onclick="findAddr()">
											<span>주소 찾기</span>
										</button>
									</div>
								</div>
								<div class="form_cont">
									<input name="addrMain" value="${session.addrMain }" class="form_ip" id="addr" type="text" placeholder="주소" onkeyup="checkInput(this, 'addr')" readonly>
								</div>
								<div class="form_cont">
									<input name="addrDetail" value="${session.addrDetail }" readonly class="form_ip" type="text" placeholder="상세 주소" onkeyup="checkInput(this, 'addr')" maxlength="50">
								</div>
								<span id="addrcheck" class="validcheck" style="display: none;"></span>
							</div>
						</div>
	
						<!-- 다음주소 찾기 js -->
						<script type="text/javascript" src="resources/js/member/findAddr.js"></script>
						<!-- 회원정보 수정 유효성 검사 js -->
						<script type="text/javascript" src="resources/js/member/memberModify.js"></script>
									
						<div class="join_form_wrap">
							<div class="login_btn_wrap">
								<button form="join_form" type="submit" id="submitBtn" class="login_button" style="width: 400px;">
									<span class="text">확인</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
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