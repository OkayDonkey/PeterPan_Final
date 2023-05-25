package com.book.membermodel;

import com.book.model.LoginDTO;
import com.book.model.MemberDTO;

public interface LoginDAO{

	// 로그인 처리
	MemberDTO generalLogin(LoginDTO dto);
	
	// 메일 인증을 하면 mail_auth 컬럼을 기본값 0에서 1로 바꿔 로그인을 허용
	int updateMailAuth(MemberDTO memberDto) throws Exception;
	
	// 이메일 인증을 안 했으면 0을 반환, 로그인 시 인증했나 안 했나 체크하기 위함
	int emailAuthFail(String id) throws Exception;

	// sns(카카오)에서 로그인 했을 시 id 값이 카카오 email 값  id 값이 있는지 확인
	int checkLoginStatus(String email);

	// SNS 로그인 처리
	MemberDTO SNSLogin(String email);

	int phoneSearchGetId(MemberDTO dto);

	int emailSearchGetId(MemberDTO dto);

	MemberDTO getmemberonelist(String memberEmail);

	int phoneSearchGetPwd(MemberDTO dto);
	
	int emailSearchGetPwd(MemberDTO dto);

	MemberDTO getmemberonelistbyId(String memberId);

	void pwdReset(MemberDTO dto);

}
