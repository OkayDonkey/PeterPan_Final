<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="resources/css/member/login.css" />
<link rel="stylesheet" href="resources/css/member/join.css" />
</head>
<body>
	<div class="wrapper member_login" id="main">
		<header class="header_wrapper">
			<div class="header_inner">
				<div class="logo_box">
					<a class="logo_link">
						<img src="resources/css/images/logo/peterpan_logo.png" height="90px" width="180px">
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
                <div class="ico_title">본인인증정보와 일치하는 결과입니다.<br>로그인 후 이용해주세요.</div>
            </div>
        </div>
        
        <div class="id_result_single_box">
            <div class="id_text_wrap">
                <div class="id_name_box">
                    <span class="id_name">${member.memberId}</span>
                </div>
                <div class="id_info_box">
                    <div class="id_info_inner">
                        <span class="id_info">가입일 <span class="date">2012.05.</span></span><!-- 수정 220405 가입일 월 뒤 "." 추가 -->
                        <span class="gap">|</span>
                        <c:if test="${member.memberTier == 1 }">
                        	<span class="id_info">일반회원</span>
                        </c:if>
                        <c:if test="${member.memberTier == 2 }">
                        	<span class="id_info">관리자</span>
                        </c:if>
                        
                        
                    </div>
                </div>
            </div>
        </div>
        
        <div class="btn_wrap justify page_bottom">
            <a href="#" class="btn_lg btn_line_primary"><span class="text">비밀번호 찾기</span></a>
            <a href="<%=request.getContextPath() %>/login.go" class="btn_lg btn_primary"><span class="text">로그인</span></a>
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
