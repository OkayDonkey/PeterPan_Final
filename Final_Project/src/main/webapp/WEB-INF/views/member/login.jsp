<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/로그인</title>
<link rel="stylesheet" href="${path }/resources/css/member/login.css" />
</head>
<body>

	<div class="wrapper member_login" id="main">
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
			<div class="login_contents_wrap">
				<form method="post" action="<%=request.getContextPath() %>/login_ok.go">
					<div class="login_form_wrap">
						<div class="form_id_pwd">
							<div class="id_box">
								<input type="text" placeholder="아이디를 입력해 주세요." class="id_text">
							</div>
							<div>
								<input type="password" placeholder="비밀번호를 입력해 주세요." class="pwd_text">
							</div>
						</div>
					</div>
					<div class="login_btn_wrap">
						<button type="submit" class="login_button">
							<span class="text">로그인</span>
						</button>
					</div>
					<div class="save_id_box">
						<span class="form_chk">
							<input type="checkbox" id="formSaveId">
							<label for="formSaveId">
								<span>아이디 저장</span>
							</label>
						</span>
						<a href="" class="btn_text_link">아이디/비밀번호 찾기</a>
					</div>
				</form>
				<div class="sns_login_box">
					<ul class="sns_login_list">
						<li class="sns_login_item">
							<button type="button" class="btn_sns_login" onclick="location.href='<%=request.getContextPath() %>/naver_login.go'">
								<img height="65px" width="75px" src="${path }/resources/css/images/logo/naver_logo.png">
								<span class="hidden">네이버로그인</span>
							</button>
						</li>
						<li class="sns_login_item">
							<button type="button" class="btn_sns_login" onclick="location.href='<%=request.getContextPath() %>/kakao_login.go'">
								<img height="65px" width="75px" src="${path }/resources/css/images/logo/kakao_logo.png">
								<span class="hidden">카카오로그인</span>
							</button>
						</li>
						<li class="sns_login_item">
							<button type="button" class="btn_sns_login" onclick="location.href='<%=request.getContextPath() %>/google_login.go'">
								<img height="65px" width="75px" src="${path }/resources/css/images/logo/google_logo.png">
								<span class="hidden">구글로그인</span>
							</button>
						</li>
					</ul>
					<p class="p_content">
						개인정보 보호를 위해 공용 pc에서 사용 시 SNS계정의 로그아웃
						<br>
						상태를 꼭 확인해 주세요.
					</p>
				</div>
				<div class="join_induce_wrapper">
					<div class="btn_wrap">
						<a href="<%=request.getContextPath() %>/join.go">
							<span class="text">회원가입</span>
						</a>
					</div>
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