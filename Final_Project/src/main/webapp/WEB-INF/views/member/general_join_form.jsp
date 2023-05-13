<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/회원가입</title>
<link rel="stylesheet" href="${path }/resources/css/member/login.css" />
<link rel="stylesheet" href="${path }/resources/css/member/join.css" />
</head>
<body>

	<div class="wrapper member_join" id="main">
		<header class="header_wrapper">
			<div class="header_inner">
				<div class="logo_box">
					<a class="logo_link">
						<img src="${path }/resources/css/images/logo/peterpan_logo.png" height="90px" width="180px">
					</a>
				</div>
			</div>
		</header>
		
		<main class="container_wrapper">
			<div class="join_contents_wrap">
				<div class="title_wrap">
					<p class="title_heading">회원가입</p>
					<div class="right_area">
						<span class="step_round_desc">마지막 단계입니다!</span>
						<ol class="step_round_list">
							<li class="step_item">1</li>
							<li class="step_item active">2</li>
						</ol>
					</div>
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
					<form method="post" action="<%=request.getContextPath() %>/general_join_ok.go">
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
									<input type="text" name="memberId" class="form_ip" id="formJoin01" placeholder="아이디를 입력해 주세요." maxlength="20">
								</div>
							</div>
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
										<input type="password" name="memberPwd" class="form_ip" id="formJoin02" placeholder="비밀번호를 입력해 주세요." maxlength="15">
									</div>
									<div class="pw_valid_wrap">
										<div class="valid_step_box">
											<ol class="valid_step_list">
												<li class="step_item">
													<span class="hidden">안전도 낮음</span>
												</li>
												<li class="step_item">
													<span class="hidden">안전도 보통</span>
												</li>
												<li class="step_item">
													<span class="hidden">안전도 높음</span>
												</li>
											</ol>
											<div class="bubble_speech_box">
												<span class="valid_state">안전도</span>
											</div>
										</div>
										<ul class="pw_valid_list">
											<li class="pw_valid_item">
												영문, 숫자, 특수문자 3가지 조합 8자리 이상 또는
												<br>
												2가지 조합 10자리 이상
											</li>
											<li class="pw_valid_item">
												공백 및 3자 이상의 연속 또는 중복 문자는 사용 불가
											</li>
											<li class="pw_valid_item" style="display: none;">
												생일, 전화번호, 아이디 등 개인신상 정보 사용 불가
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
									<input type="password" name="memberPwd" class="form_ip" id="formJoin03" placeholder="비밀번호를 한 번 더 입력해 주세요." maxlength="15">
								</div>
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
									<input type="text" name="memberName" class="form_ip" id="formJoin04" placeholder="이름을 입력해 주세요." maxlength="20">
								</div>
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
									<div class="input_btn_box">
										<input type="text" name="memberPhone" class="form_ip" id="formJoin05" placeholder="숫자만 입력해 주세요." maxlength="11">
										<button type="button" class="btn_ip btn_light_gray">
											<span>인증번호 발송</span>
										</button>
									</div>
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
									<div class="input_btn_box">
										<input type="text" name="memberEmail" class="form_ip" id="formJoin06" placeholder="이메일을 입력해 주세요." maxlength="50">
										<button type="button" class="btn_ip btn_light_gray">
											<span>인증번호 발송</span>
										</button>
									</div>
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
										<input type="text" name="memberEmail" class="form_ip" id="formJoin07" placeholder="생년월일 8자리를 입력해 주세요." maxlength="8">
										<div class="form_filter_box">
											<span class="form_filter">
												<input id="rdoFilter02" type="radio" name="rdoFilter">
												<label for="rdoFilter02">
													<span>남</span>
												</label>
											</span>
											<span class="form_filter">
												<input id="rdoFilter01" type="radio" name="rdoFilter">
												<label for="rdoFilter01">
													<span>여</span>
												</label>
											</span>
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
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</main>
	</div>

</body>
</html>