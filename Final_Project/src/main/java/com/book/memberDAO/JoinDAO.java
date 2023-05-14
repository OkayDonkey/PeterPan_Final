package com.book.memberDAO;

import com.book.model.MemberDTO;

public interface JoinDAO {

	// 회원가입 처리
	int join(MemberDTO memberDTO) throws Exception;
	
	
}
