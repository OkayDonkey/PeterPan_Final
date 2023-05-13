package com.book.memberDAO;

import com.book.model.MemberDTO;

public interface JoinDAO {

	// 회원가입 처리
	void join(MemberDTO memberDTO) throws Exception;

	
}
