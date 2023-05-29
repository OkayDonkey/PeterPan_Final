<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/회원정보수정</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- 다음 주소 가져오는 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 다음 주소 가져오는 api end -->
<link rel="stylesheet" href="resources/css/member/memberMain.css" />
<link rel="stylesheet" href="resources/css/member/login.css" />
<link rel="stylesheet" href="resources/css/member/join.css" />
<link rel="stylesheet" href="resources/css/member/memberInfoModify.css" />
</head>
<body>

	<div class="wrapper member_join member_info" id="main">
		<header class="header_wrapper">
			<div class="header_inner">
				<div class="logo_box">
					<a class="logo_link" href="<%=request.getContextPath() %>/">
						<img src="resources/css/images/logo/peterpan_logo.png" height="90px" width="180px">
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
			<div class="join_contents_wrap" style="width: 500px;">
				<div class="title_wrap">
					<p class="title_heading">회원정보 수정</p>
				</div>
				
				<div class="title_wrap_def">
					<p class="title_heading" style="font-size: 16px;">회원정보 입력</p>
				</div>
				
				<div class="form_wrap">
					<form id="join_form" name="f" method="post" onsubmit="return check()" action="<%=request.getContextPath() %>/member_info_modify_ok.go">
						<div class="joinforminsert">
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin01" class="form_label">
										<span class="form_label_span">아이디</span>
									</label>
								</div>
								<div class="form_cont">
									<input type="text" style="border: none;" value="${session.memberId }" readonly name="memberId" class="form_ip" id="formJoin01" onkeyup="checkInput(this, 'id')" placeholder="아이디를 입력해 주세요." maxlength="20">
								</div>
								<span id="idcheck" class="validcheck" style="display: none;"></span>
							</div>
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin02" class="form_label">
										<span class="form_label_span">새 비밀번호</span>
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
									</label>
								</div>
								<div class="form_cont">
									<input type="text" style="border: none;" name="memberName" value="${session.memberName }" readonly class="form_ip" id="formJoin04" onkeyup="checkInput(this, 'name')" placeholder="이름을 입력해 주세요." maxlength="20">
								</div>
								<span id="namecheck" class="validcheck" style="display: none;"></span>
							</div>
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin05" class="form_label">
										<span class="form_label_span">휴대폰번호</span>
									</label>
								</div>
								<div class="form_cont">
									<div class="input_btn_box phonecheck">
										<input type="text" name="memberPhone" value="${session.memberPhone}" class="form_ip" id="formJoin05" placeholder="휴대폰 번호를 입력해 주세요." onkeyup="checkInput(this, 'phone')" maxlength="11">
										<button type="button" class="btn_ip btn_light_gray" onclick="sendPhone()">
											<span>변경</span>
										</button>
									</div>
									<span id="phonecheck" class="validcheck" style="display: none;"></span>
								</div>
							</div>
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin06" class="form_label">
										<span class="form_label_span">이메일</span>
									</label>
								</div>
								<div class="form_cont">
									<div class="input_btn_box emailcheck">
										<input type="text" name="memberEmail" class="form_ip" value="${session.memberEmail }" id="formJoin06" onkeyup="checkInput(this, 'email')" placeholder="이메일을 입력해 주세요." maxlength="50">
										<button type="button" class="btn_ip btn_light_gray" onclick="sendEmail()" id="emailButton">
											<span>변경</span>
										</button>
									</div>
									<span id="emailcheck" class="validcheck" style="display: none;"></span>
								</div>
							</div>
							<div class="form_box">
								<div class="form_title">
									<label for="formJoin07" class="form_label">
										<span class="form_label_span">생년월일/성별</span>
									</label>
								</div>
								<div class="form_cont">
									<div class="input_btn_box">
										<input type="text" style="border: none;" name="memberBirth" value="${session.memberBirth }" readonly class="form_ip" id="formJoin07" onkeyup="checkInput(this, 'birth')" placeholder="생년월일 8자리를 입력해 주세요." maxlength="8">
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
									<input name="addrDetail" value="${session.addrDetail }" class="form_ip" type="text" placeholder="상세 주소" onkeyup="checkInput(this, 'addr')" maxlength="50">
								</div>
								<span id="addrcheck" class="validcheck" style="display: none;"></span>
							</div>
						</div>
	
						<!-- 다음주소 찾기 js -->
						<script type="text/javascript" src="resources/js/member/findAddr.js"></script>
						<!-- 회원정보 수정 유효성 검사 js -->
						<script type="text/javascript" src="resources/js/member/memberModify.js"></script>
						
						<ul class="bul_list">
						    <li class="bul_item_dot font_size_xxs">
						        <span style="font-size: 5px;">●</span> 본인인증 및 성인인증 시 해외거주로 인해 인증이 불가한 경우 해당 안내를 통해 접수해 주시기 바랍니다.
						        <a href="#" class="btn_xxs btn_line_gray fc_black">
						            <span class="text" style="font-size: 12px; font-weight: 600;">해외거주 본인/성인인증 접수 신청</span><span class="ico_arw"></span>
						        </a>
						    </li>
						    <li class="bul_item_dot font_size_xxs">
						       <span style="font-size: 5px;">●</span> 회원탈퇴 후 동일 아이디로 재가입이 불가합니다.
						        <a href="<%=request.getContextPath() %>/member_withdrawal.go" class="btn_xxs btn_line_gray fc_black">
						            <span class="text" style="font-size: 12px; font-weight: 600;">회원탈퇴</span><span class="ico_arw"></span>
						        </a>
						    </li>
						</ul>
									
						<div class="join_form_wrap">
							<div class="login_btn_wrap" style="display: flex; justify-content: space-between;">
								<button form="join_form" type="button" id="cancelBtn" class="login_button" style="width: 49%;">
									<span class="text">취소</span>
								</button>
								<button form="join_form" type="submit" id="submitBtn" class="login_button" style="width: 49%; border-color: #5055b1; background-color: #5055b1;">
									<span class="text">확인</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			</section>
		</main>
		
		<script>
		  document.getElementById("cancelBtn").addEventListener("click", function() {
		    window.location.href = "myPage.go";
		  });
		</script>
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