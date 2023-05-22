package com.book.membermodel;

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

	// 이미 가입이 되어있는지 인증한 핸드폰 번호로 비교
	int checkIfAlreadyJoined(MemberDTO dto);

	// 가입된 멤버의 모든 정보를 핸드폰 번호로 가져옴
	MemberDTO getmemberonelist(String phone);
	
}
