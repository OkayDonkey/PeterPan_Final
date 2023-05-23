<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피터팬/로그인</title>
<link rel="stylesheet" href="${path }/resources/css/member/join.css" />
<link rel="stylesheet" href="${path }/resources/css/member/login.css" />
<link rel="stylesheet" href="${path }/resources/css/member/id_pwd_search.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
			<div class="contents_wrap">
				<!-- tab_wrap -->
				<div class="tab_wrap type_line_primary justify ui-tabs ui-corner-all ui-widget ui-widget-content">
					<!-- tab_list_wrap -->
					<div class="tab_list_wrap">
						<ul class="tabs ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header">
							<li class="tab_item ui-tabs-tab ui-corner-top ui-state-default ui-tab ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="tabContentFindId" aria-labelledby="ui-id-1" aria-selected="true" aria-expanded="true">
								<a href="" class="tab_link ui-tabs-anchor" id="findIdLink">
									<span class="tab_text">아이디 찾기</span>
								</a>
							</li>
							<li class="tab_item ui-tabs-tab ui-corner-top ui-state-default ui-tab" role="tab" tabindex="-1" aria-controls="tabContentFindPw" aria-labelledby="ui-id-2" aria-selected="false" aria-expanded="false">
								<a href="" class="tab_link ui-tabs-anchor" role="presentation" tabindex="-1" id="findPwdLink">
									<span class="tab_text">비밀번호 찾기</span>
								</a>
							</li>
						</ul>
					</div>
					<!-- 아이디 찾기 -->
					<div id="tabContentFindId" class="tab_content ui-tabs-panel ui-corner-bottom ui-widget-content" aria-labelledby="ui-id-1" role="tabpanel" aria-hidden="false">
					  <div class="fold_box_wrap">
					    <ul class="fold_box_list">
					      <li class="fold_box expanded" id="IdphoneFind">
					        <div class="fold_box_header">
					          <h2>휴대폰번호로 찾기</h2>
					          <button type="button" class="btn_fold">
					            <span class="hidden">컨텐츠 닫기</span>
					          </button>
					        </div>
					        <div class="fold_box_contents">
					          <div class="form_wrap">
					            <div class="form_box">
					              <div class="form_title">
					                <label for="phoneFormFindId01" class="form_label">이름</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="phoneFormFindId01" class="form_ip" placeholder="이름을 입력해 주세요." maxlength="40" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					            <div class="form_box">
					              <div class="form_title">
					                <label for="phoneFormFindId02" class="form_label">생년월일</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="phoneFormFindId02" class="form_ip" placeholder="생년월일 8자리를 입력해 주세요." maxlength="8" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					            <div class="form_box">
					              <div class="form_title">
					                <label for="phoneFormFindId03" class="form_label">휴대폰번호</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="phoneFormFindId03" class="form_ip" placeholder="숫자만 입력해 주세요." maxlength="15" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					          </div>
					          <div class="btn_wrap justify">
					            <a href="#" class="btn_lg btn_light_gray" disabled="disabled">
					              <span class="text">확인</span>
					            </a>
					          </div>
					        </div>
					      </li>
					      <li class="fold_box" id="emailFind">
					        <div class="fold_box_header">
					          <h2>이메일로 찾기</h2>
					          <button type="button" class="btn_fold">
					            <span class="hidden">컨텐츠 열기</span>
					          </button>
					        </div>
					        <div class="fold_box_contents">
					          <div class="form_wrap">
					            <div class="form_box">
					              <div class="form_title">
					                <label for="formFindId01" class="form_label">이름</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="formFindId01" class="form_ip" placeholder="이름을 입력해 주세요." maxlength="40" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					            <div class="form_box">
					              <div class="form_title">
					                <label for="formFindId02" class="form_label">생년월일</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="formFindId02" class="form_ip" placeholder="생년월일 8자리를 입력해 주세요." maxlength="8" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					            <div class="form_box">
					              <div class="form_title">
					                <label for="formFindId03" class="form_label">이메일</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="formFindId03" class="form_ip" placeholder="숫자만 입력해 주세요." maxlength="15" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					          </div>
					          <div class="btn_wrap justify">
					            <a href="#" class="btn_lg btn_light_gray" disabled="disabled">
					              <span class="text">확인</span>
					            </a>
					          </div>
					        </div>
					      </li>
					    </ul>
					  </div>
					</div>
					
					<!-- 비밀번호 찾기 -->
					<div id="tabContentFindpwd" class="tab_content ui-tabs-panel ui-corner-bottom ui-widget-content" aria-labelledby="ui-id-1" role="tabpanel" aria-hidden="false">
					  <div class="fold_box_wrap">
					    <ul class="fold_box_list">
					      <li class="fold_box expanded" id="phoneFind">
					        <div class="fold_box_header">
					          <h2>휴대폰번호로 찾기</h2>
					          <button type="button" class="btn_fold">
					            <span class="hidden">컨텐츠 닫기</span>
					          </button>
					        </div>
					        <div class="fold_box_contents">
					          <div class="form_wrap">
					          	<div class="form_box">
					              <div class="form_title">
					                <label for="formFindPwd01" class="form_label">아이디</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="formFindPwd01" class="form_ip" placeholder="아이디를 입력해 주세요." maxlength="40" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					            <div class="form_box">
					              <div class="form_title">
					                <label for="formFindPwd02" class="form_label">이름</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="formFindPwd02" class="form_ip" placeholder="이름을 입력해 주세요." maxlength="40" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					            <div class="form_box">
					              <div class="form_title">
					                <label for="formFindPwd03" class="form_label">생년월일</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="formFindPwd03" class="form_ip" placeholder="생년월일 8자리를 입력해 주세요." maxlength="8" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					            <div class="form_box">
					              <div class="form_title">
					                <label for="formFindPwd04" class="form_label">휴대폰번호</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="formFindPwd04" class="form_ip" placeholder="숫자만 입력해 주세요." maxlength="15" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					          </div>
					          <div class="btn_wrap justify">
					            <a href="#" class="btn_lg btn_light_gray" disabled="disabled">
					              <span class="text">확인</span>
					            </a>
					          </div>
					        </div>
					      </li>
					      <li class="fold_box" id="emailFind">
					        <div class="fold_box_header">
					          <h2>이메일로 찾기</h2>
					          <button type="button" class="btn_fold">
					            <span class="hidden">컨텐츠 열기</span>
					          </button>
					        </div>
					        <div class="fold_box_contents">
					          <div class="form_wrap">
					          	<div class="form_box">
					              <div class="form_title">
					                <label for="formFindPwd01" class="form_label">아이디</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="formFindPwd01" class="form_ip" placeholder="아이디를 입력해 주세요." maxlength="40" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					            <div class="form_box">
					              <div class="form_title">
					                <label for="formFindPwd02" class="form_label">이름</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="formFindPwd02" class="form_ip" placeholder="이름을 입력해 주세요." maxlength="40" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					            <div class="form_box">
					              <div class="form_title">
					                <label for="formFindPwd03" class="form_label">생년월일</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="formFindPwd03" class="form_ip" placeholder="생년월일 8자리를 입력해 주세요." maxlength="8" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					            <div class="form_box">
					              <div class="form_title">
					                <label for="formFindPwd04" class="form_label">이메일</label>
					              </div>
					              <div class="form_cont">
					                <div class="valid_check">
					                  <input type="text" id="formFindPwd04" class="form_ip" placeholder="숫자만 입력해 주세요." maxlength="15" data-autocomplete="false">
					                  <span class="valid_desc">경고 메시지 영역입니다</span>
					                </div>
					              </div>
					            </div>
					          </div>
					          <div class="btn_wrap justify">
					            <a href="#" class="btn_lg btn_light_gray" disabled="disabled">
					              <span class="text">확인</span>
					            </a>
					          </div>
					        </div>
					      </li>
					    </ul>
					  </div>
					</div>
				</div>
			</div>
		</main>
		
		<script type="text/javascript" src="resources/js/member/id_pwd_search.js"></script>
		
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