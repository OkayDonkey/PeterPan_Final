<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
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
<link rel="stylesheet" href="${path }/resources/css/member/join.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
    // 오류 메시지가 존재할 경우 알림창을 띄움
    var errorMessage = "${errorMessage}";
    if (errorMessage) {
        alert(errorMessage);
    }
</script>
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
								<input name="memberId" type="text" placeholder="아이디를 입력해 주세요." class="id_text" maxlength="20">
							</div>
							<div>
								<input name="memberPwd" type="password" placeholder="비밀번호를 입력해 주세요." class="pwd_text" maxlength="18">
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
						
						<%
						    String clientId = "eTDbNDf4IbCBkdCrvj09";//애플리케이션 클라이언트 아이디값";
						    String redirectURI = URLEncoder.encode("http://localhost:8585/main/naver_login_ok.go", "UTF-8");
						    SecureRandom random = new SecureRandom();
						    String state = new BigInteger(130, random).toString();
						    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
						    apiURL += "&client_id=" + clientId;
						    apiURL += "&redirect_uri=" + redirectURI;
						    apiURL += "&state=" + state;
						    session.setAttribute("state", state);
						 %>
						 <a href="<%=apiURL%>"><img height="56" src="${path }/resources/css/images/logo/naver_logo.png"/></a>
						</li>
						<li class="sns_login_item">
							<button type="button" class="btn_sns_login" onclick="kakaoLogin()">
								<img height="55px" width="65px" src="${path }/resources/css/images/logo/kakao_logo.png">
								<span class="hidden">카카오로그인</span>
							</button>
						</li>
						<li class="sns_login_item">
							<button type="button" class="btn_sns_login" onclick="location.href='<%=request.getContextPath() %>/google_login.go'">
								<img height="55px" width="65px" src="${path }/resources/css/images/logo/google_logo.png">
								<span class="hidden">구글로그인</span>
							</button>
						</li>
					</ul>
					
					<!-- 카카오 로그인 -->
					<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
					<script type="text/javascript" src="resources/js/member/kakaoLogin.js"></script>
					
					<!-- 네이버 로그인 -->
					<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
					<script type="text/javascript" src="resources/js/member/naverLogin.js"></script>
					
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