<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/hatLogo1.png" />
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/board/qnaForm.css"/>
<title>고객센터 - 피터팬</title>
</head>
<script type="text/javascript" src="resources/js/board/boardQNA.js"></script>
<body>
	<!-- 상단 네비바  -->
	<jsp:include page="./../top/top.jsp" />

	<!-- 화면 나누기 구성 -->
	<div class="container align-content-center" style="min-width: 1200px;" id="totalBoard">
		<div class="row justify-content-sm-between" style="width: 1200px;">

			<!-- 왼쪽 메뉴바 -->
			<jsp:include page="../boardInclude/boardLeft.jsp" />

			<!-- 문의 접수 내용 -->
			<div class="customer_wrap">
			<form method="post"  action="<%=request.getContextPath() %>/board_qna_ok.go">
				<div class="title_wrap title_size_lg">
					<p class="title_heading">1:1문의 접수</p>
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
								<th scope="row" class="has_ip"><label for="InquiryQuestList-button">문의유형</label> <span
									class="required"> <span class="hidden">필수입력</span>
								</span></th>
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
														<div class="form_sel" style="width: 397px;">
															
															<input type="hidden" value="QNA" name="boardArea">
															<input type="hidden" value="${session.memberNo }" name="memberNo">
															
															<select name="boardCategory" data-kbbfn-field="" id="InquiryQuestList" title="문의유형 분류" >
															<option value="-1" selected="selected">문의 유형을 선택해 주세요.</option>
																<option value="000">배송/수령예정일안내</option>
																<option value="001">회원</option>
																<option value="002">도서/상품정보</option>
																<option value="003">주문/결제</option>
																<option value="004">배송/수령일 안내</option>
																<option value="005">반품/교환/환불</option>
																<option value="006">서비스</option>
																<option value="007">eBook</option></select>
																<span tabindex="0"
																id="InquiryQuestList-button" role="combobox"
																aria-expanded="false" aria-autocomplete="list"
																aria-owns="InquiryQuestList-menu" aria-haspopup="true"
																title="문의유형 분류"
																class="ui-selectmenu-button ui-button ui-widget ui-selectmenu-button-closed ui-corner-all"
																aria-activedescendant="ui-id-20"
																aria-labelledby="ui-id-20" aria-disabled="false">
																<span class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span>
																<span class="ui-selectmenu-text"></span></span>
														</div>
														<div class="form_sel" style="display: none; width: 397px;">
															<select data-kbbfn-field="" id="InquiryStoreList" title="매장관련 상세 분류" style="display: none;">
																<option value="-1" selected="selected">매장을 선택해 주세요.</option>
																<option value="016">광화문점</option>
																<option value="017">강남점</option>
																<option value="018">부산점</option>
																<option value="019">대구점</option>
																<option value="020">대전점</option>
																<option value="022">부천점</option>
																<option value="024">인천점</option>
																<option value="026">잠실점</option>
																<option value="027">창원점</option>
																<option value="029">분당점</option>
																<option value="030">목동점</option>
																<option value="031">천안점</option>
																<option value="032">센텀시티점</option>
																<option value="033">영등포점</option>
																<option value="034">울산점</option>
																<option value="035">일산점</option>
																<option value="036">합정점</option>
																<option value="037">평촌점</option>
																<option value="038">판교점</option>
																<option value="039">광교월드스퀘어센터</option>
																<option value="040">칠곡센터</option>
																<option value="041">광주상무센터</option>
																<option value="042">수유바로드림센터</option>
																<option value="043">전주바로드림센터</option>
																<option value="044">동대문바로드림센터</option>
																<option value="045">송도바로드림센터</option>
																<option value="047">은평바로드림센터</option>
																<option value="048">청량리바로드림센터</option>
																<option value="049">가든파이브바로드림센터</option>
																<option value="050">해운대센터</option>
																<option value="051">세종바로드림센터</option>
																<option value="052">디큐브바로드림센터</option>
																<option value="053">경성대.부경대점</option>
																<option value="054">이화여대점</option>
																<option value="055">서울대점</option>
																<option value="056">포항공대점</option>
																<option value="057">전북대점</option>
																<option value="063">광교점</option>
																<option value="090">천호점</option>
																<option value="091">건대바로드림센터</option></select><span tabindex="0"
																id="InquiryStoreList-button" role="combobox"
																aria-expanded="false" aria-autocomplete="list"
																aria-owns="InquiryStoreList-menu" aria-haspopup="true"
																title="매장관련 상세 분류"
																class="ui-selectmenu-button ui-selectmenu-button-closed ui-corner-all ui-button ui-widget"><span
																class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span><span
																class="ui-selectmenu-text">매장을 선택해 주세요.</span></span>
														</div>
													</div>
													<span class="valid_desc"></span>
												</div>
												<!-- //valid_check -->
											</div>
											<!-- //form_cont -->

											<!-- FAQ -->
											<div id="FaqListWrap" class="form_cont" style="display: none">
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
								<th scope="row" class="has_ip"><label for="InquiryTitle">내용</label>
									<span class="required"> <span class="hidden">필수입력</span>
								</span></th>
								<td>
									<div class="form_col_group w_full">
										<div class="col_box">
											<div class="valid_check">
												<input name="boardTitle" data-kbbfn-field="" id="InquiryTitle" type="text"
													class="form_ip w_full" title="제목 입력"
													placeholder="제목을 입력해 주세요." required="" maxlength="30">
												<span class="valid_desc"></span>
											</div>
										</div>
										<div class="col_box">
											<div class="valid_check">
												<!-- byte_check_wrap -->
												<div class="byte_check_wrap w_full">
													<textarea name="boardContent" data-kbbfn-field="" id="InquiryContent"
														class="form_textarea" title="문의 내용 입력"
														placeholder="빠른 답변을 위해 10자 이상의 문의 내용을 입력해 주세요."
														maxlength="500" style="height: 246px;" required=""></textarea>
													<!-- 수정 220422 placeholder 마침표 추가, 타이틀 수정, style attr 추가 -->
													<div class="byte_check_footer">
													</div>
												</div>
												<!-- //byte_check_wrap -->
												<span class="valid_desc"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>

							<tr id="InquiryFileForm">

								<th scope="row"><span>사진첨부 </span><span>0</span><span
									class="fc_gray">/3</span></th>
								<td><p class="info_text font_size_xxs">빠른 답변을 위해 이미지를
										첨부해 주세요.</p>
									<ul class="file_list">
										<li class="list_item"><span class="file_item"><span
												class="btn_box"><input name="boardFile"
													id="23834088-4cd1-4dff-abdd-8a8da4a3830f" type="file"><label
													for="23834088-4cd1-4dff-abdd-8a8da4a3830f"><span
														class="hidden">첨부파일 추가</span></label><span class="attach_img_box"><span
														class="attach_img_view"></span>
													<button class="btn_remove_img" type="button">
															<span class="hidden">첨부파일 삭제</span>
														</button></span></span></span></li>
									</ul>
									<ul class="bul_list">
										<li class="bul_item_asterisk font_size_xxs">JPG, PNG, GIF
											파일만 최대 3장 업로드 가능합니다.</li>
									</ul></td>
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
									for="InquiryPhoneNumber">연락처</label> <span class="required"><span
										class="hidden">필수입력</span></span></th>
								<td>
									<!-- form_wrap -->
									<div class="form_wrap">
										<!-- form_box -->
										<div class="form_box">
											<!-- form_cont -->
												<!-- valid_check -->
												<div class="valid_check">
													<input data-kbbfn-form="inquiryForm" data-kbbfn-field="" id="InquiryPhoneNumber" required="" type="tel"
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
											placeholder="이메일을 입력해 주세요." title="이메일 입력" value="${session.memberEmail }">
										<!-- 수정 220422 placeholder 추가, title 수정-->
										<span class="valid_desc" style="display: none;"></span>
									</div> <!-- //valid_check --> <!-- //수정 220422 valid 추가 -->
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- //tbl_row_wrap -->

				<div class="btn_wrap page_bottom">
					<a href="https://www.kyobobook.co.kr/"
						class="btn_light_gray btn_lg"> <span class="text">취소</span>
					</a>
					<button data-kbbfn-form="inquiryForm" data-kbbfn-submit=""
						type="submit" class="btn_primary btn_lg">
						<span class="text">문의접수</span>
					</button>
				</div>
				</form>


				<div class="info_text_box size_lg">
					<div class="title_wrap title_size_xs">
						<p class="title_heading">문의내용 답변 안내</p>
					</div>
					<ul class="bul_list">
						<li class="bul_item_dot font_size_xxs">
							<span>답변은 마이룸 또는 회원정보에 등록된 이메일로 확인 가능합니다.</span></li>
						<li class="bul_item_dot font_size_xxs">
							<span> 당일 17시 이후 문의건과 공휴일 1:1 문의는 문의 유형과 이름/연락처/이메일 주소를 남겨 주시면 확인 후 운영시간에 통지해
								드립니다. </span></li>
						<li class="bul_item_dot font_size_xxs">
							<span>정상근무일 기준이며, 통지예정일이 휴일인 경우 다음 정상 근무일에 진행 됩니다.</span></li>
						<li class="bul_item_dot font_size_xxs">
							<span class="fw_bold">설/추석 연휴 기간 동안은 고객센터 휴무로 인해 1:1 문의 답변이 불가 합니다.</span></li>
						<li class="bul_item_dot font_size_xxs">
							<span class="fw_bold">설/추석 연후 끝난 이후부터 순차적으로 답변드릴 예정이니 양해 부탁드립니다.</span></li>
						<li class="bul_item_dot font_size_xxs">
							<span class="fw_bold">신학기(3월, 9월), 코로나로 인해 문의량이 급증하여 답변이 지연될 수 있습니다.</span></li>
					</ul>
				</div>

			</div>








		</div>
	</div>

	<!-- footer -->
	<jsp:include page="./../top/footer.jsp" />

</body>
</html>