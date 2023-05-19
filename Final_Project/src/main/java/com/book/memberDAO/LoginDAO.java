package com.book.memberDAO;

import com.book.model.LoginDTO;
import com.book.model.MemberDTO;

public interface LoginDAO{

	// 로그인 처리
	MemberDTO generalLogin(LoginDTO dto);
}
