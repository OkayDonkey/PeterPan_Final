<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/favicon.png" />
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/board/qnaForm.css" />
<title>고객센터 - 피터팬</title>
</head>
<script type="text/javascript" src="resources/js/board/boardQNA.js"></script>
<body>
	<!-- 상단 네비바  -->
	<jsp:include page="../../top/top.jsp" />

	<!-- 화면 나누기 구성 -->
	<div class="container align-content-center" style="min-width: 1200px;" id="totalBoard">
		<div class="row justify-content-sm-between" style="width: 1200px;, padding-bottom: 100px;">

			<!-- 왼쪽 메뉴바 -->
			<jsp:include page="../../boardInclude/boardLeft.jsp" />


			<c:set value="${DTO }" var="dto" />
			<!-- 문의 접수 내용 -->
			<div class="customer_wrap">
				<form enctype="multipart/form-data" method="post"
					action="<%=request.getContextPath()%>/board_qna_modify_ok.go">
					<div class="title_wrap title_size_lg">
						<h1 class="title_heading">1:1문의 수정</h1>
					</div>
					<!-- tbl_row_wrap -->
					<div class="tbl_row_wrap" id="inquiryForm" data-kbbfn="form-group"
						data-kbbfn-depend="submodule.CsInquiryModule">

						<table class="tbl_row">
							<colgroup>
								<col style="width: 160px;">
								<col>
							</colgroup>

							<tbody>
								<tr>
									<th scope="row" class="has_ip"><label
										for="InquiryQuestList-button">문의유형 <span
											style="color: #3C9A17;">*</span></label> <span class="required"></span></th>
									<td>
										<!-- form_wrap -->
										<div class="form_wrap">

											<!-- form_box -->
											<div class="form_box">
												<!-- form_cont -->
												<div class="form_cont">

													<!-- valid_check -->
													<div class="valid_check w_full">
														<div class="form_sel_multi">
															<div class="form_sel" style="width: 141%;">
																
																<input type="hidden" value="${dto.boardNO }" name="boardNO">
																<input type="hidden" value="QNA" name="boardArea">
																<input type="hidden" value="${session.memberNo }" name="memberNo"> 
																<select name="boardCategory" id="InquiryQuestList" title="문의유형 분류" class="graybg">
																    <option disabled>문의 유형을 선택해 주세요.</option>
																    <option value="배송/수령예정일안내" ${dto.boardCategory == '배송/수령예정일안내' ? 'selected' : ''}>배송/수령예정일안내</option>
																    <option value="회원" ${dto.boardCategory == '회원' ? 'selected' : ''}>회원</option>
																    <option value="도서/상품정보" ${dto.boardCategory == '도서/상품정보' ? 'selected' : ''}>도서/상품정보</option>
																    <option value="주문/결제" ${dto.boardCategory == '주문/결제' ? 'selected' : ''}>주문/결제</option>
																    <option value="배송/수령일 안내" ${dto.boardCategory == '배송/수령일 안내' ? 'selected' : ''}>배송/수령일 안내</option>
																    <option value="반품/교환/환불" ${dto.boardCategory == '반품/교환/환불' ? 'selected' : ''}>반품/교환/환불</option>
																    <option value="서비스" ${dto.boardCategory == '서비스' ? 'selected' : ''}>서비스</option>
																    <option value="eBook" ${dto.boardCategory == 'eBook' ? 'selected' : ''}>eBook</option>
																</select>


																<span tabindex="0" id="InquiryQuestList-button"
																	role="combobox" aria-expanded="false"
																	aria-autocomplete="list"
																	aria-owns="InquiryQuestList-menu" aria-haspopup="true"
																	title="문의유형 분류"
																	class="ui-selectmenu-button ui-button ui-widget ui-selectmenu-button-closed ui-corner-all"
																	aria-activedescendant="ui-id-20"
																	aria-labelledby="ui-id-20" aria-disabled="false">
																	<span
																	class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span>
																	<span class="ui-selectmenu-text"></span>
																</span>
															</div>

														</div>
														<span class="valid_desc"></span>
													</div>
													<!-- //valid_check -->
												</div>
												<!-- //form_cont -->

												<!-- FAQ -->
												<div id="FaqListWrap" class="form_cont"
													style="display: none">
													<div class="fold_box_wrap type_gray">
														<ul class="fold_box_list">

															<li class="fold_box">
																<div class="fold_box_header">
																	<span>자주 묻는 질문 추천</span>
																	<button type="button" class="btn_fold">
																		<span class="hidden">컨텐츠 열기</span>
																	</button>
																</div>
																<div class="fold_box_contents">
																	<div class="fold_contents_inner">
																		<div class="faq_text_list">
																			<ul id="FaqList"></ul>

																		</div>
																	</div>
																</div>
															</li>
														</ul>
													</div>
												</div>

											</div>
											<!-- //form_box -->
										</div> <!-- //form_wrap -->
									</td>
								</tr>
								<!-- <tr id="OrderProductBlock"> -->
								<tr id="OrderProductBlock" style="display: none;">
									<th scope="row">문의상품</th>
									<td>
										<button type="button" class="btn_md btn_line_primary"
											data-role="btn-dialog" data-target="#popOrderSelect">
											<span class="text">주문상품 선택</span>
										</button>
										<p class="info_text font_size_xxs">최근 3개월 주문상품까지 선택 가능합니다.
										</p>
									</td>
								</tr>
								<tr id="OrderPopResult" style="display: none;">
									<th scope="row"></th>
									<td>
										<!-- file_attach_wrap -->
										<div class="file_attach_wrap">
											<ul class="attached_list">
												<li class="attached_item"><span class="name"> <span>주문번호</span>
														<span class="fw_bold"> </span>
												</span>
													<button type="button" class="btn_attached_del">
														<span class="hidden">삭제</span>
													</button></li>
											</ul>
										</div> <!-- //file_attach_wrap --> <!-- auto_overflow_wrap -->
										<div class="auto_overflow_wrap" style="display: none;">
											<div class="auto_overflow_contents" style="max-height: 145px">
												<div class="auto_overflow_inner">
													<ul class="prod_name_list">

													</ul>
												</div>
											</div>
											<div class="auto_overflow_footer align_left">
												<button type="button" class="btn_more_body"
													data-btn-toggle="">
													<span class="text">펼치기</span> <span class="ico_arw"></span>
												</button>
											</div>
										</div> <!-- //auto_overflow_wrap -->
									</td>
								</tr>
								<tr>
									<th scope="row" class="has_ip"><label for="InquiryTitle">내용
											<span style="color: #3C9A17;">*</span>
									</label> <span class="required"></span></th>
									<td>
										<div class="form_col_group w_full">
											<div class="col_box">
												<div class="valid_check" style="width: 141%;">
													<input name="boardTitle" value="${dto.boardTitle }"
														id="InquiryTitle" type="text" class="form_ip w_full"
														title="제목 입력" placeholder="제목을 입력해 주세요." required=""
														maxlength="30"> <span class="valid_desc"></span>
												</div>
											</div>
											<div class="col_box">
												<div class="valid_check">
													<!-- byte_check_wrap -->
													<div class="byte_check_wrap w_full" style="width: 250%;">
														<textarea name="boardContent" data-kbbfn-field=""
															id="InquiryContent" class="form_textarea"
															title="문의 내용 입력"
															placeholder="빠른 답변을 위해 10자 이상의 문의 내용을 입력해 주세요."
															maxlength="500" style="height: 246px;" required="">${dto.boardContent }</textarea>
														<!-- 수정 220422 placeholder 마침표 추가, 타이틀 수정, style attr 추가 -->
														<div class="byte_check_footer"></div>
													</div>
													<!-- //byte_check_wrap -->
													<span class="valid_desc"></span>
												</div>
											</div>
										</div>
									</td>
								</tr>


								<tr>
									<th style="font-weight: 600;">첨부파일</th>
									<td><input type="file" name="file1" value="${dto.boardFile }"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //tbl_row_wrap -->
					<!-- tbl_row_wrap -->
					<div class="tbl_row_wrap">
						<div class="title_wrap title_size_sm">
							<p class="title_heading">문의에 대한 답변 등록 시 알려드립니다.</p>
						</div>
						<table class="tbl_row">
							<colgroup>
								<col style="width: 160px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="has_ip"><label
										for="InquiryPhoneNumber">연락처 <span
											style="color: #3C9A17;">*</span></label></th>
									<td>
										<!-- form_wrap -->
										<div class="form_wrap">
											<!-- form_box -->
											<div class="form_box">
												<!-- form_cont -->
												<!-- valid_check -->
												<div class="valid_check">
													<input data-kbbfn-form="inquiryForm" data-kbbfn-field=""
														id="InquiryPhoneNumber" required="" type="tel"
														class="form_ip" placeholder="-없이 입력해 주세요." title="연락처 입력"
														maxlength="30" value="${session.memberPhone }">
													<!-- 수정 220422 placeholder 추가, title 수정-->
													<span class="valid_desc"></span>
												</div>
												<!-- //form_cont -->
											</div>
											<!-- //form_box -->
										</div> <!-- //form_wrap -->
									</td>
								</tr>
								<tr>
									<th scope="row" class="has_ip"><label for="InquiryEmail">이메일</label>
									</th>
									<td>
										<!-- 수정 220422 valid 추가 --> <!-- valid_check -->
										<div class="valid_check">
											<input data-kbbfn-form="inquiryForm" data-kbbfn-field=""
												id="InquiryEmail" type="email" class="form_ip"
												placeholder="이메일을 입력해 주세요." title="이메일 입력"
												value="${session.memberEmail }">
											<!-- 수정 220422 placeholder 추가, title 수정-->
											<span class="valid_desc" style="display: none;"></span>
										</div> <!-- //valid_check --> <!-- //수정 220422 valid 추가 -->
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //tbl_row_wrap -->

					<div class="btn_wrap page_bottom" id="insert_btn">
					<div class="btn_wrap_de">
						<a href="boardPage.go" class="btn_light_gray btn_lg"> 
							<span class="text">취소</span>
						</a>
						<button data-kbbfn-form="inquiryForm" data-kbbfn-submit="" type="submit" class="btn_primary btn_lg">
							<span class="text">문의 수정</span>
						</button>
					</div>	
				</div>

				<div class="info_text_box size_lg" style="margin-top: 60px;">
					<div class="title_wrap title_size_xs">
						<p class="title_heading">문의내용 답변 안내</p>
					</div>
					<ul class="bul_list">
						<li class="bul_item_dot font_size_xxs"><span>답변은 마이룸
								또는 회원정보에 등록된 이메일로 확인 가능합니다.</span></li>
						<li class="bul_item_dot font_size_xxs"><span> 당일 17시
								이후 문의건과 공휴일 1:1 문의는 문의 유형과 이름/연락처/이메일 주소를 남겨 주시면 확인 후 운영시간에 통지해
								드립니다. </span></li>
						<li class="bul_item_dot font_size_xxs"><span>정상근무일
								기준이며, 통지예정일이 휴일인 경우 다음 정상 근무일에 진행 됩니다.</span></li>
						<li class="bul_item_dot font_size_xxs"><span class="fw_bold">설/추석
								연휴 기간 동안은 고객센터 휴무로 인해 1:1 문의 답변이 불가 합니다.</span></li>
						<li class="bul_item_dot font_size_xxs"><span class="fw_bold">설/추석
								연후 끝난 이후부터 순차적으로 답변드릴 예정이니 양해 부탁드립니다.</span></li>
						<li class="bul_item_dot font_size_xxs"><span class="fw_bold">신학기(3월,
								9월), 코로나로 인해 문의량이 급증하여 답변이 지연될 수 있습니다.</span></li>
					</ul>
				</div>
				</form>
			</div>
		</div>
	</div>
	
<!-- 	<div id="insertPopup" class="insertPopup"  hidden>
		<div class="insertPopupBox">
			<p class="first_write">문의를 등록하시겠습니까?</p>
			<p>빠른 시간 내에 답변드리겠습니다.</p>
			<div class="insertBox_btn"  style="display: flex;">
				<div class="RoundBox1"  onclick="closeModal()"><button>취소</span></div>
				<div class="RoundBox2"  onclick="location.href=''"><span>확인</span></div>
			</div>
		</div>
	</div>
 -->
	<!-- footer -->
	<jsp:include page="../../top/footer.jsp" />
	
	<script type="text/javascript">
		var deleteButtons = document.getElementsByClassName('delete-button');
		  
		  for (var i = 0; i < deleteButtons.length; i++) {
		    deleteButtons[i].addEventListener('click', function() {
		      var fileInput = this.previousElementSibling;
		      fileInput.value = ''; // 첨부파일 필드의 값을 초기화하여 파일을 제거
		    });
		  }
		  
/* 		function openModal() {
			document.getElementById("insertPopup").removeAttribute("hidden");
		}

		function closeModal() {
			document.getElementById("insertPopup").setAttribute("hidden", true);
		} */
	</script>

</body>
</html>