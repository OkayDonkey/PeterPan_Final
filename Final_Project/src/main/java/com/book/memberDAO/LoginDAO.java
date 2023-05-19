package com.book.memberDAO;

import com.book.model.LoginDTO;
import com.book.model.MemberDTO;

public interface LoginDAO{

	// 로그인 처리
	MemberDTO generalLogin(LoginDTO dto);
	
	// 메일 인증을 하면 mail_auth 컬럼을 기본값 0에서 1로 바꿔 로그인을 허용
	int updateMailAuth(MemberDTO memberDto) throws Exception;
	
	// 이메일 인증을 안 했으면 0을 반환, 로그인 시 인증했나 안 했나 체크하기 위함
	int emailAuthFail(String id) throws Exception;
}
