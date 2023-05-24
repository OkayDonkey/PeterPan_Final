package com.book.membermodel;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.book.model.MemberDTO;

public interface LoginService {
	
	int updateMailAuth(MemberDTO memberDto) throws Exception;
	
	int emailAuthFail(String id) throws Exception;

	// 카카오 로그인 관련 토큰
	String getAccessToken(String code);

	HashMap<String, Object> getUserInfo(String access_Token);

	// 네이버 로그인 관련 토큰
	String getnaverAccessToken(String authorize_code, HttpSession session) throws Exception;

	HashMap<String, Object> getnaverUserInfo(String access_Token) throws Exception;
}
