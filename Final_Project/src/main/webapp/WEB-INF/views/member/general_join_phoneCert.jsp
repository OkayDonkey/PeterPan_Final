<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/휴대폰 인증</title>
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
						<ol class="step_round_list">
							<li class="step_item active">1</li>
							<li class="step_item">2</li>
						</ol>
					</div>
				</div>
				
				<div class="title_wrap_def">
					<p class="title_heading" style="font-size: 16px;">본인인증</p>
				</div>
				
				<div class="cert_type_box">
					<button type="button" class="btn_cert_type" onclick="location.href='general_join_form.go'">
						<span class="ico_phone">
							<img src="${path }/resources/css/images/member/join/join_phone.PNG" height="45px">
						</span>
						<span class="text">휴대폰 본인인증</span>
					</button>
					<button type="button" class="btn_cert_type">
						<span class="ico_phone">
							<img src="${path }/resources/css/images/member/join/ipin_join.PNG" height="45px">
						</span>
						<span class="text">아이핀 본인인증</span>
					</button>
				</div>
				
				<div class="info_text_box">
					<p class="bul_item_dot">
						본인인증이 잘 되지 않을 경우, 고객센터(1544-0000) 문의를 통해 접수해 주세요.
					</p>
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