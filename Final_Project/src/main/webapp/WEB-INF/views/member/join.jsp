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
				<div class="join_wrap">
					<div class="join_form_wrap">
						<div class="btn_wrap join_btn_wrap">
							<a href="<%=request.getContextPath() %>/general_join.go">
								<span class="text join_text"><b>회원가입</b></span>
							</a>
						</div>
					</div>
					
					<!-- sns 회원가입 -->
					<div class="sns_login_box">
						<ul class="sns_login_list">
							<li class="sns_login_item">
								<button class="btn_sns_login" onclick="location.href='<%=request.getContextPath() %>/naver_join.go'">
									<img height="65px" width="75px" src="${path }/resources/css/images/logo/naver_logo.png">
									<span class="hidden">네이버회원가입</span>
								</button>
							</li>
							<li class="sns_login_item">
								<button class="btn_sns_login" onclick="location.href='<%=request.getContextPath() %>/kakao_join.go'">
									<img height="65px" width="75px" src="${path }/resources/css/images/logo/kakao_logo.png">
									<span class="hidden">카카오회원가입</span>
								</button>
							</li>
							<li class="sns_login_item">
								<button class="btn_sns_login" onclick="location.href='<%=request.getContextPath() %>/google_join.go'">
									<img height="65px" width="75px" src="${path }/resources/css/images/logo/google_logo.png">
									<span class="hidden">구글회원가입</span>
								</button>
							</li>
						</ul>
					</div>
				</div>
				
				<!-- 신규회원 혜택 -->
				<div class="join_benefit_wrap">
					<div class="join_benefit_box">
						<p class="benefit_title">신규회원 특별 혜택</p>
						<div class="benefit_coupon_box">
							<div class="coupon_item">
								<div class="copon_iner">
									<span class="left_box">
										<span class="coupon_logo">
											<img width="60" height="30" src="${path }/resources/css/images/logo/peterpan_logo.png">
										</span>
										<span class="coupon_val">
											1,000
											<span class="unit">원</span>
										</span>
									</span>
									<span class="right_box">
										<img src="${path }/resources/css/images/member/join/coupon_right_blueimg.PNG">
									</span>
								</div>
							</div>
							<div class="coupon_item">
								<div class="copon_iner">
									<span class="left_box">
										<span class="coupon_logo">
											<img width="60" height="30" src="${path }/resources/css/images/logo/peterpan_logo.png">
										</span>
										<span class="coupon_val">
											1,000
											<span class="unit">원</span>
										</span>
									</span>
									<span class="right_box">
										
									</span>
								</div>
							</div>
							<div class="coupon_item">
								<div class="copon_iner">
									<span class="left_box">
										<span class="coupon_logo">
											<img width="60" height="30" src="${path }/resources/css/images/logo/peterpan_logo.png">
										</span>
										<span class="coupon_val">
											3,000
											<span class="unit">P</span>
										</span>
									</span>
									<span class="right_box">
										
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>

</body>
</html>