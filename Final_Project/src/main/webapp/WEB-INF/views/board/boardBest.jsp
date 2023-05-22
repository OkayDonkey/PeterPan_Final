<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><img src="resources/img/Peter_Pan.png" width="40px">고객센터 - 피터팬</title>
</head>
<body>

<!-- 왼쪽 메뉴바 -->
<div  class="container align-content-center" style="min-width: 1200px;">
	<div class="row justify-content-sm-between"  style="width: 1200px;">
	
		<div class="left_list">
		<p class="boder_header" style="margin-bottom: 20px;">고객센터</p>
			<div class="boder_body">
				<ul  class="snb_list category">
					 <li class="snb_list" style="margin-bottom: 16px;"><a href="<%=request.getContextPath()%>/boardPage.go">메인</a></li>
					 
					 <div>
						 <li class="snb_list" style="margin-bottom: 16px;"><a href="<%=request.getContextPath()%>/boardBest.go">자주 묻는 질문</a>
							<div>
								 <ul class="snb_list_box">
									 <li class="snb_item"><a href="<%=request.getContextPath()%>/boardBest.go">BEST 10</a></li>
									 <li class="snb_item"><a href="#">회원</a></li>
									 <li class="snb_item"><a href="#">도서/상품정보/교과서</a></li>
									 <li class="snb_item"><a href="#">주문/결제</a></li>
									 <li class="snb_item"><a href="#">배송/수령일 안내</a></li>
									 <li class="snb_item"><a href="#">반품/교환/환불</a></li>
									 <li class="snb_item"><a href="#">서비스</a></li>
									 <li class="snb_item"><a href="#">eBook</a></li>
								 </ul>
							</div>	 
						 </li>
						 
						 
						 <li class="snb_list" style="margin-bottom: 16px;"><a href="#">1:1 문의</a>
							<div> 
								<ul class="snb_list_box">	 
									 <li class="snb_item"><a href="#">1:1 문의 접수</a></li>
									 <li class="snb_item"><a href="#">1:1 문의 내역</a></li>
							 	</ul>
							 </div>	
						 </li>
						
						<li class="snb_list"><a href="#">공지사항</a></li>
						
					 </div>
							
					<div class="custumer">
						<div class="custmer_de" style="margin-bottom: 16px;">
							<img src="resources/img/icons-tel.png" width="20px">
							<a href="#" class="tel_list" ><span>고객센터 이용안내</span></a>
						</div>
						<div class="tel" style="margin-bottom: 10px;">
							<a href="tel:1544-1990">1544-900</a>
							<span class="unit">(유료)</span>
						</div>
						<p class="desc">
							평일 09:00~18:00
							<br>
							(주말 및 공휴일 휴무)
						</p>	
					</div>	
					 
					<div class="snb_service_box">
						<div style="margin-bottom: 16px;">
							<a href="#" class="snb_ars" >보이는 ARS</a>
						</div>	
						<p class="desc">
							앱스토어에서
							<span class="fw_medium">'보이는 ARS'</span>
							<br>
							앱 설치 후 이용
						</p>
						<div class="tel_text_box">
							<a href="#">
								<span class="tel_text">전화상담서비스 안내도</span>
								<img src="resources/img/icons-tel-text.png" width="10px" >
							</a>
						</div>
					</div>		
				</ul>
			</div>
		 </div>
		
		
		
		 
		 <div class="main"  style="width: 900px;">
		 	<div class="main_heading" >
		 		<span class="main_heading_1">무엇을 도와드릴까요?</span><br>
		 		<span class="main_heading_2">피터팬 고객센터</span><span class="main_heading_1">입니다.</span>
		 	</div>
		 	
		 	<div>
		 		<div><h2 class="title_heading">자주 묻는 질문</h2></div>
		 		
		 		<div class="input_text_box">
		 			<div class="input_btn_box">
		 				<div class="form_ip_search">
		 					<input type="search" class="form_ip" title="자주 묻는 질문" placeholder="질문을 검색해 보세요.">
		 				</div>
		 				<div class="form_btn">
			 				<button type="button" class="btn">
			 					<span class="text">검색</span>
			 				</button>
			 			</div>	
		 			</div>
		 		</div>
		 		
		 		<div class="asked_category_list">
		 			<ul>
		 				<li>
		 					<a href="#">BEST 10</a>
		 				</li>
		 			
		 				<li>
		 					<a href="#">회원</a>
		 				</li>
		 			
		 				<li>
		 					<a href="#">도서/상품정보/교과서</a>
		 				</li>
		 			
		 				<li>
		 					<a href="#">주문/결제</a>
		 				</li>
		 				
		 				<li>
		 					<a href="#">배송/수령일 안내</a>
		 				</li>
		 			
		 				<li>
		 					<a href="#">반품/교환/환불</a>
		 				</li>
		 			
		 				<li>
		 					<a href="#">서비스</a>
		 				</li>
		 			
		 				<li>
		 					<a href="#">eBook</a>
		 				</li>
		 			</ul>
		 		</div>
		 	</div>
		 		
			 	<div class="notice_wrap">
			 		<div class="notice_head">
				 		<h2 class="title_heading">Best 10</h2>
			 		</div>
			 	
			 	
			 	</div>	
			 		
			 		
		 		<div id="accordion">
				  <div class="card">
				    <div class="card-header" id="headingOne">
				      <h5 class="mb-0">
				        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				          Q
				        </button>
				        <span>
				        	검색이 되지 않거나 품절/절판인 도서는 구입할 수 없나요?
				        </span>
				      </h5>
				    </div>
				    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
				      <div class="card-body">
				        검색이 되지 않는 도서는 품절/절판일 경우가 대부분이므로 검색 옵션 중 [품절/절판상품 포함] 란에 체크하신 후 한번 더 검색해보시기 바랍니다.
						<br>품절이나 절판으로 표시된 도서는 출판사에서도 더 이상 발간하지 않고 재고가 없는 경우가 대부분이라 구하기 어려운 도서입니다. 
						<br>이 경우 회원님께서 요청하셔도 구입시기를 확실하게 약속드릴 수 없습니다. 
						<br>이러한 도서의 구입가능 여부를 확인하시려면 고객센터의 1:1 문의 접수 이용하여 주시면, 최대한 확인하여 답변드리겠습니다.
				      </div>
				    </div>
				  </div>
				</div>
			 		
			 		
			 		
			 		
			 		
			 		
			 		
			 		
			 		
			 		
		 	</div>
		 </div>
		 
		 
		 
	 </div>

</body>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/theme.min.css" />
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/vendor.min.css" />

<!-- 부트스트랩 JS -->
<script src="resources/js/vendor.min.js"></script>
<script src="resources/js/theme.min.js"></script>

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/board/mainboard_01.css"/>
</html>