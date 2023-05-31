<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/board/mainboard.css"/>
<title>고객센터 - 피터팬</title>
</head>
<body>

			<!-- 왼쪽 메뉴바 -->
			<div class="left_list">
				<p class="boder_header" style="margin-bottom: 20px;">고객센터</p>
				<div class="boder_body">
					<ul class="snb_list category">
						<li class="snb_list" style="margin-bottom: 16px;">
							<a href="<%=request.getContextPath()%>/boardPage.go">메인</a></li>

						<div>
							<li class="snb_list" style="margin-bottom: 16px;">
								<a onclick="handleClick(this);" href="<%=request.getContextPath() %>/boardFAQ.go?category=자주 묻는 질문">자주 묻는 질문</a>
								<div>
									<ul class="snb_list_box">
										<li class="snb_item"><a class="snb_btn"  href="<%=request.getContextPath() %>/boardFAQ.go?category=BEST 10">BEST 10</a></li>
										<li class="snb_item"><a class="snb_btn"  href="<%=request.getContextPath() %>/boardFAQ.go?category=회원">회원</a></li>
										<li class="snb_item"><a class="snb_btn"  href="<%=request.getContextPath() %>/boardFAQ.go?category=도서/상품정보/교과서">도서/상품정보/교과서</a></li>
										<li class="snb_item"><a class="snb_btn"  href="<%=request.getContextPath() %>/boardFAQ.go?category=주문/결제">주문/결제</a></li>
										<li class="snb_item"><a class="snb_btn"  href="<%=request.getContextPath() %>/boardFAQ.go?category=배송/수령일 안내">배송/수령일 안내</a></li>
										<li class="snb_item"><a class="snb_btn"  href="<%=request.getContextPath() %>/boardFAQ.go?category=반품/교환/환불">반품/교환/환불</a></li>
										<li class="snb_item"><a class="snb_btn"  href="<%=request.getContextPath() %>/boardFAQ.go?category=서비스">서비스</a></li>
										<li class="snb_item"><a class="snb_btn"  href="<%=request.getContextPath() %>/boardFAQ.go?category=eBook">eBook</a></li>
									</ul>
								</div>
							</li>
								
 							<li class="snb_list" style="margin-bottom: 16px;">
								<a href="<%=request.getContextPath() %>/boardQna.go">1:1 문의</a>
								<div>
									<ul class="snb_list_box">
										<li class="snb_item"><a href="<%=request.getContextPath() %>/boardQna.go">1:1 문의 접수</a></li>
										<li class="snb_item"><a href="<%=request.getContextPath() %>/myPage.go">1:1 문의 내역</a></li>
									</ul>
								</div></li>

							<li class="snb_list"><a href="<%=request.getContextPath() %>/board_noticeOk.go">공지사항</a></li>
						</div>

						<div class="custumer">
							<div class="custmer_de" style="margin-bottom: 16px;">
								<img src="resources/img/icons-tel.png" width="20px"> 
									<a href="<%=request.getContextPath() %>/boardArs.go" class="tel_list"><span>고객센터 이용안내</span></a>
							</div>
							<div class="tel" style="margin-bottom: 10px;">
								<a href="tel:1544-1990">1544-900</a> <span class="unit">(유료)</span>
							</div>
							<p class="desc">
								평일 09:00~18:00 <br> (주말 및 공휴일 휴무)
							</p>
						</div>

						<div class="snb_service_box">
							<div style="margin-bottom: 16px;">
								<a href="<%=request.getContextPath() %>/boardArs.go" class="snb_ars">보이는 ARS</a>
							</div>
							<p class="desc">
								앱스토어에서 <span class="fw_medium">'보이는 ARS'</span><br> 앱 설치 후 이용
							</p>
							<div class="tel_text_box">
								<a href="<%=request.getContextPath() %>/boardArs.go"> <span class="tel_text">전화상담서비스 안내도</span> <img
									src="resources/img/icons-tel-text.png" width="10px">
								</a>
							</div>
						</div>
					</ul>
				</div>
			</div>
			
			
<script type="text/javascript">
	const menu = document.querySelectorAll("snb_list_box li");
	for(let i = 0; i < menu.length; i++){
		menu[i].addEventListener("click", act);
		function act() {
			for(let j = 0; j < menu.length; j++){
				menu[j].removeAttribute("class", "active");
			}
			this.setAttribute("class", "active");
		}
	}
</script>

</body>


</html>