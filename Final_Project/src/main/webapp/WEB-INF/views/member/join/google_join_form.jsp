<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/SNS회원가입</title>
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
						<img src="resources/img/peterPanLogo.png" height="110px" width="180px">
					</a>
				</div>
			</div>
		</header>
		
		<main class="container_wrapper">
			<div class="join_contents_wrap">
				<div class="title_wrap">
					<p class="title_heading">SNS 회원가입</p>
					<div class="right_area">
						<span class="step_round_desc">마지막 단계입니다!</span>
						<ol class="step_round_list">
							<li class="step_item">1</li>
							<li class="step_item active">2</li>
						</ol>
					</div>
				</div>
				
				<div class="title_wrap_def">
					<p class="title_heading" style="font-size: 16px;">추가 회원정보 입력</p>
					<div class="right_area">
						<span class="required">
							필수 입력
						</span>
					</div>
				</div>
				
				<div class="form_wrap">
					<form id="join_form" name="f" method="post" onsubmit="return check()" action="<%=request.getContextPath() %>/general_join_ok.go">
					<input type="hidden" name="memberId" value="${userInfo.email }">
					<input type="hidden" name="memberPwd" value="snsPwd">
						<div class="joinforminsert">
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
									<input type="text" name="memberName" value="${userInfo.name}" class="form_ip" id="formJoin04" onkeyup="checkInput(this, 'name')" placeholder="이름을 입력해 주세요." maxlength="20">
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
								<div class="snsphonecheck">
								  <div class="form_cont">
								    <div class="input_btn_box">
								      <input type="text" name="memberPhone" class="form_ip" id="formJoin05" placeholder="휴대폰번호를 입력해주세요." onkeyup="checkInput(this, 'phone')" maxlength="11">
								      <button type="button" class="btn_ip btn_light_gray" onclick="SNSsendPhone()">
								        <span>인증</span>
								      </button>
								    </div>
								    <span id="phonecheck" class="validcheck" style="display: none;"></span>
								  </div>
								</div>
							</div>
							
							<script type="text/javascript" src="resources/js/member/sendSMS.js"></script>
							
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
										<input type="text" name="memberEmail" value="${userInfo.email }" readonly class="form_ip" id="formJoin06" onkeyup="checkInput(this, 'email')" placeholder="이메일을 입력해 주세요." maxlength="50">
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
										<input type="text" name="memberBirth" class="form_ip" id="formJoin07" onkeyup="checkInput(this, 'birth')" placeholder="생년월일 8자리를 입력해 주세요." maxlength="8">
										<div class="form_filter_box">
											<span class="form_filter">
												<input id="rdoFilter02" type="radio" onchange="checkGender()" name="memberGender" value="남">
												<label for="rdoFilter02">
													<span>남</span>
												</label>
											</span>
											<span class="form_filter">
												<input id="rdoFilter01" type="radio" name="memberGender" onchange="checkGender()" value="여">
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
										<input type="text" id="post" name="addrPost" class="form_ip" id="formJoin06" onkeyup="checkInput(this, 'addr')" placeholder="우편변호" readonly>
										<button type="button" class="btn_ip btn_light_gray" onclick="findAddr()">
											<span>주소 찾기</span>
										</button>
									</div>
								</div>
								<div class="form_cont">
									<input name="addrMain" class="form_ip" id="addr" type="text" placeholder="주소" onkeyup="checkInput(this, 'addr')" readonly>
								</div>
								<div class="form_cont">
									<input name="addrDetail" class="form_ip" type="text" placeholder="상세 주소" onkeyup="checkInput(this, 'addr')" maxlength="50">
								</div>
								<span id="addrcheck" class="validcheck" style="display: none;"></span>
							</div>
						</div>
	
						<!-- 다음주소 찾기 js -->
						<script type="text/javascript" src="resources/js/member/findAddr.js"></script>
						<!-- 회원가입 유효성 검사 js -->
						<script type="text/javascript" src="resources/js/member/join.js"></script>
									
						<!-- 서비스 이용약관 동의 -->
						<script type="text/javascript" src="resources/js/member/termsChk.js"></script>
		
						<div class="title_wrap_def">
							<p class="title_heading" style="font-size: 16px;">서비스 이용약관 동의</p>
						</div>
						<div class="terms_agree_chk_wrap">
							<div class="terms_agree_row">
								<span class="form_chk">
									<input id="termsAllChk" type="checkbox">
									<label for="termsAllChk">
										<span class="spot">약관 전체 동의</span>
									</label>
								</span>
							</div>
							<div class="terms_agree_row">
								<ul class="chk_col_list">
									<li class="chk_col_item" style="display: flex;">
										<span class="form_chk">
											<input id="peterpan" type="checkbox" class="check1" name="check1" data_type="require">
											<label for="peterpan">
												피터팬 이용약관
												<span class="fc_green">(필수)</span>
											</label>
										</span>
										<div class="right_box_cont">
											<button type="button" class="btn_more_view">
												<span>내용보기</span>
												<span class="ico_arw"></span>
											</button>
										</div>
									</li>
									<li class="chk_col_item" style="display: flex;">
										<span class="form_chk">
											<input id="collectionUsage" type="checkbox" class="check1" name="check1" data_type="require">
											<label for="collectionUsage">
												개인정보 수집 및 이용 동의
												<span class="fc_green">(필수)</span>
											</label>
										</span>
										<div class="right_box_cont">
											<button type="button" class="btn_more_view">
												<span>내용보기</span>
												<span class="ico_arw"></span>
											</button>
										</div>
									</li>
									<li class="chk_col_item" style="display: flex;">
										<span class="form_chk">
											<input id="consignment" type="checkbox" class="check1" name="check1" data_type="require">
											<label for="consignment">
												개인정보 처리 위탁 동의
												<span class="fc_green">(필수)</span>
											</label>
										</span>
										<div class="right_box_cont">
											<button type="button" class="btn_more_view">
												<span>내용보기</span>
												<span class="ico_arw"></span>
											</button>
										</div>
									</li>
								</ul>
							</div>
							<div class="terms_agree_row">
								<ul class="chk_col_list">
									<li class="chk_col_item" style="display: flex;">
										<span class="form_chk">
											<input id="personal" type="checkbox" class="check3" name="check3" data_type="selective">
											<label for="personal">
												개인정보 수집 및 이용 동의
												<span class="fc_green">(선택)</span>
											</label>
										</span>
										<div class="right_box_cont">
											<button type="button" class="btn_more_view">
												<span>내용보기</span>
												<span class="ico_arw"></span>
											</button>
										</div>
									</li>
									<li class="chk_col_item" style="display: flex; flex-wrap: wrap;">
										<span class="form_chk">
											<input id="termsMarketingChk" type="checkbox" class="check4" name="marketingOk" value="all" data_type="selective">
											<label for="termsMarketingChk">
												피터팬 마케팅 수신 동의
												<span class="fc_green">(선택)</span>
											</label>
										</span>
										<div class="marketing_agree_inner">
											<ul class="chk_list">
												<li class="chk_row_item">
													<span class="form_chk">
														<input id="sms" type="checkbox" class="check2" name="marketingOk" value="SMS">
														<label for="sms">
															SMS
														</label>
													</span>
												</li>
												<li class="chk_row_item">
													<span class="form_chk">
														<input id="email" type="checkbox" class="check2" name="marketingOk" value="email">
														<label for="email">
															이메일
														</label>
													</span>
												</li>
											</ul>
											<p class="form_desc">마케팅 수신 동의 시 다양한 혜택을 받아볼 수 있습니다.</p>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<!-- 이용약관 동의 end -->
						
						<div class="join_form_wrap">
							<div class="login_btn_wrap">
								<button form="join_form" type="submit" id="submitBtn" class="login_button" style="width: 400px;">
									<span class="text">회원가입</span>
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