<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/img/hatLogo1.png" />
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" id="main-styles" href="resources/css/board/qnaForm.css" />
<title>고객센터 - 피터팬</title>
</head>
<script type="text/javascript" src="resources/js/board/boardQNA.js"></script>
<body>
	<!-- 상단 네비바  -->
	<jsp:include page="./../top/top.jsp" />

	<!-- 화면 나누기 구성 -->
	<div class="container align-content-center" style="min-width: 1200px;" id="totalBoard">
		<div class="row justify-content-sm-between" style="width: 1200px;, padding-bottom: 100px;">

			<!-- 왼쪽 메뉴바 -->
			<jsp:include page="../boardInclude/boardLeft.jsp" />

			<!-- 문의 접수 내용 -->
			<div class="customer_wrap">
			<!-- ///////////////////////////////////// 아래줄 지우지마 -->
				<form enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/board_qna_ok.go">
					<div class="title_wrap title_size_lg">
						<h1>관리자 공지사항 작성 페이지</h1>
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
										for="InquiryQuestList-button" style="font-size: 15px;">문의유형 <span
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
															<!-- //////////// 지우지 마 -->
																<input type="hidden" value="NOTICE" name="boardArea">
																<input type="hidden" value="${session.memberNo }"
																	name="memberNo"> <select name="boardCategory"
																	data-kbbfn-field="" id="InquiryQuestList"
																	title="문의유형 분류" class="graybg" style="width: 730px;">
																	<option disabled selected="selected" >문의 유형을 선택해 주세요.</option>
																	<option value="배송/수령예정일안내">배송/수령예정일안내</option>
																	<option value="회원">회원</option>
																	<option value="도서/상품정보">도서/상품정보</option>
																	<option value="주문/결제">주문/결제</option>
																	<option value="배송/수령일 안내">배송/수령일 안내</option>
																	<option value="반품/교환/환불">반품/교환/환불</option>
																	<option value="서비스">서비스</option>
																	<option value="eBook">eBook</option>
																</select> <span tabindex="0" id="InquiryQuestList-button"
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
								
								<!-- 내용 -->
								<tr>
									<th scope="row" class="has_ip">
										<label for="InquiryTitle" style="font-size: 15px;">내용
											<span style="color: #3C9A17;">*</span></label> 
											<span class="required"></span></th>
									<td>
										  <textarea id="summernote" name="content"></textarea>
									</td>
								</tr>
								<tr>
									<th style="font-size: 15px; font-weight: 600;">첨부파일</th>
									<td><input type="file" name="file1"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 썸머 노트 -->
					<script type="text/javascript">
					$(document).ready(function() {
						  $('#summernote').summernote({
					 	    	placeholder: 'content',
						        minHeight: 370,
						        maxHeight: null,
						        focus: true, 
						        lang : 'ko-KR',
						        
						        callbacks:{ 
		                            onImageUpload : function(files){ 
		                               uploadSummernoteImageFile(files[0],this); 
		                           } 
		                        } 
						  });
						  
						  function uploadSummernoteImageFile(file,editor){ 

		                        data = new FormData(); 

		                        data.append("file",file); 
		      
		                        $.ajax({ 
		      
			                     data:data, 
			      
			                     type:"POST", 
			      
			                     url:"/uploadSummernoteImageFile", 
			      
			                     dataType:"JSON", 
			      
			                     contentType:false, 
			      
			                     processData:false, 
			      
			                     success:function(data){ 
		      
			                         $(editor).summernote("insertImage",data.url); 
			      
			                         $("#thumbnailPath").append("<option value="+data.url+">"+data.originName+"</option>"); 
		                     } 
		                 }); 
		                    } 
						  
						});
					
					
				
					</script>
					<!-- //tbl_row_wrap -->
					<div class="btn_wrap page_bottom" id="insert_btn">
					<div class="btn_wrap_de">
						<a href="board_notice.go" class="btn_light_gray btn_lg"> 
							<span class="text">취소</span>
						</a>
						<button data-kbbfn-form="inquiryForm" data-kbbfn-submit="" type="submit" class="btn_primary btn_lg">
							<span class="text">공지사항 등록</span>
						</button>
					</div></div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="./../top/footer.jsp" />
	
	
</body>
<!-- 썸머 노트 -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
</html>