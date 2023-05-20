package com.book.memberDAO;

import com.book.model.MemberDTO;

public interface LoginService {
	
	int updateMailAuth(MemberDTO memberDto) throws Exception;
	
	int emailAuthFail(String id) throws Exception;
}
