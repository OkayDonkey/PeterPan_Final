<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/hatLogo1.png" />
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/board/ars.css"/>
<title>고객센터 - 피터팬</title>
</head>
<body>

	<!-- 상단 네비바  -->
	<jsp:include page="./../top/top.jsp" />

	<!-- 화면 나누기 구성 -->
	<div class="container align-content-center" style="min-width: 1200px; margin-bottom: 150px;">
		<div class="row justify-content-sm-between" style="width: 1200px;">
	
			<!-- 왼쪽 메뉴바 -->
			<jsp:include page="../boardInclude/boardLeft.jsp" />
			
			<!-- 창마다 바뀜 -->
			<div class="customer_wrap">
	             <!-- title_wrap -->
	             <div>
	                 <h2>전화상담서비스 안내도</h2>
	                 <p>
	                     1. 로그인 하시면 배송조회/반품조회는 확인 가능합니다.<br>
	                     2. 밑줄 친 내용의 경우 사이트 내에서 확인 가능한 메뉴이며, 선택 시 해당 페이지로 이동됩니다.
	                 </p>
	             </div>
	             <!-- //title_wrap -->
	             
	             <!-- tbl_col_wrap -->
	             <div> 
	                 <table>
	                     <tbody>
	                         <tr>
	                             <th colspan="3">1. 주문배송 및 이용안내</th>
	                         </tr>
	                         <tr>
	                             <td colspan="3">
	                                     <span>1. 주문/배송조회</span>
	                             </td>
	                         </tr>
	                         <tr>
	                             <td colspan="3">
	                             	<span>2. 반품조회</span>
	                             </td>
	                         </tr>
	                         <tr>
	                             <td colspan="3">3. 환불조회</td>
	                         </tr>
	                         <tr>
	                             <td colspan="3">0. 기타문의 및 상담원 연결</td>
	                         </tr>
	
	                         <tr>
	                             <th colspan="3">2. 도서문의</th>
	                         </tr>
	                         <tr>
	                             <td colspan="3">1. 도서재고</td>
	                         </tr>
	                         <tr>
	                             <td colspan="3">2. 도서상담</td>
	                         </tr>
	                         <tr>
	                             <td colspan="1">3. 교과서 안내</td>
	                             <td colspan="2" style="border-left: 1px solid #eaeaea;">
	                              	<span>1. 초, 중, 고 교과서</span>
	                                <br>
	                                    <span>2. 방송대 교과서</span>
	                                <br> 
	                                	<span>0. 기타문의 및 상담원 연결</span>
	                             </td>
	                         </tr>
	                         <tr>
	                             <td colspan="3">4. 교환/반품 안내</td>
	                         </tr>
	                         <tr>
	                             <td colspan="3">
	                                <span>5. 출판사 전화번호</span>
	                             </td>
	                         </tr>
	                         <tr>
	                             <td colspan="3">0. 기타문의 및 상담원 연결</td>
	                         </tr>
	
	                         <tr>
	                             <th colspan="3">3. 매장 이용안내</th>
	                         </tr>
	                         <tr>
	                             <td rowspan="4">
                                     <span>1. 매장 영업시간 안내</span>
	                             </td>
	                             <td style="border-left: 1px solid #eaeaea;">1. 서울</td>
	                             <td style="border-left: 1px solid #eaeaea;">
	                                 01. 광화문점<br>
	                                 02. 강남점<br>
	                                 03. 잠실점<br>
	                                 04. 목동점<br>
	                                 05. 영등포점<br>
	                                 06. 디큐브시티 바로드림센터<br>
	                                 07. 수유 바로드림센터<br>
	                                 08. 동대문 바로드림센터<br>
	                                 09. 은평 바로드림센터<br>
	                                 10. 청량리 바로드림센터<br>
	                                 11. 합정점<br>
	                                 12. 가든파이브 바로드림센터<br>
	                                 13. 천호점<br>
	                                 00. 기타문의 및 상담원 연결
	                             </td>
	                         </tr>
	                         <tr>
	                             <td style="border-left: 1px solid #eaeaea;">2. 수도권</td>
	                             <td style="border-left: 1px solid #eaeaea;">
	                                 01. 분당점<br>
	                                 02. 평촌점<br>
	                                 03. 부촌점<br>
	                                 04. 인천점<br>
	                                 05. 일산점<br>
	                                 06. 송도 바로드림센터<br>
	                                 07. 판교 바로드림센터<br>
	                                 08. 광교월드스퀘어센터<br>
	                                 09. 광교점<br>
	                                 00. 기타문의 및 상담원 연결
	                             </td>
	                         </tr>
	                         <tr>
	                             <td style="border-left: 1px solid #eaeaea;">3. 지방</td>
	                             <td style="border-left: 1px solid #eaeaea;">
	                                 01. 대구점<br>
	                                 02. 해운대점<br>
	                                 03. 부산점<br>
	                                 04. 창원점<br>
	                                 05. 천안점<br>
	                                 06. 울산점<br>
	                                 07. 대전점<br>
	                                 08. 전주 바로드림센터<br>
	                                 09. 센터시티점<br>
	                                 10. 칠곡센터<br>
	                                 11. 세종 바로드림센터<br>
	                                 12. 광주상무센터<br>
	                                 13. 경성대부경대 센터<br>
	                                 00. 기타문의 및 상담원 연결
	                             </td>
	                         </tr>
	                         <tr>
	                             <td style="border-left: 1px solid #eaeaea;">4. 대학구내서점</td>
	                             <td style="border-left: 1px solid #eaeaea;">
	                                 01. 이화여대점<br>
	                                 02. 서울대점<br>
	                                 03. 카톨릭대점<br>
	                                 04. 포항공대점<br>
	                                 05. 전북대점<br>
	                                 00. 기타문의 및 상담원 연결
	                             </td>
	                         </tr>
	
	                         <tr>
	                             <th colspan="3">4. eBook/sam 서비스 안내</th>
	                         </tr>
	                         <tr>
	                             <td colspan="3">1. eBook 관련 문의</td>
	                         </tr>
	                         <tr>
	                             <td colspan="3">2. eBook 단말기 관련 문의</td>
	                         </tr>
	                         <tr>
	                             <td colspan="3">3. sam 관련 문의</td>
	                         </tr>
	                         <tr>
	                             <td colspan="3">4. 톡소다 관련 문의</td>
	                         </tr>
	                         <tr>
	                             <td colspan="3">0. 기타문의 및 상담원 연결</td>
	                         </tr>
	
	                         <tr>
	                             <th colspan="3">5. 리딩트리 등 기업고객</th>
	                         </tr>
	                         <tr style="border-bottom: 1px solid #eaeaea;">
	                             <td  colspan="3">0. 기타문의 및 상담원 연결</td>
	                         </tr>
	                     </tbody>
	                 </table>
	             </div>
	         </div>
		</div>		
	</div>
			
	<!-- footer -->
	<jsp:include page="./../top/footer.jsp" />
</body>
</html>