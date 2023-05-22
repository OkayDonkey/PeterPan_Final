package com.book.memberDAO;

import java.util.HashMap;

import com.book.model.MemberDTO;

public interface LoginService {
	
	int updateMailAuth(MemberDTO memberDto) throws Exception;
	
	int emailAuthFail(String id) throws Exception;

	String getAccessToken(String code);

	HashMap<String, Object> getUserInfo(String access_Token);
}
