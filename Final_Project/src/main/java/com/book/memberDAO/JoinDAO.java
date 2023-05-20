package com.book.memberDAO;

import com.book.model.MemberDTO;

public interface JoinDAO {

	// 회원가입 처리
	int join(MemberDTO memberDTO) throws Exception;
	
	// 로그인 중복 체크 처리
	int checkId(String id);
	
	// 이메일 중복 체크 처리
	int checkEmail(String email);
	
	// 회원가입 시 이메일 인증을 위한 랜덤번호 저장
	int updateMailKey(MemberDTO memberDto) throws Exception;
	
}
