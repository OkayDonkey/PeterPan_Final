package com.book.membermodel;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.book.model.BookDTO;
import com.book.model.MemberDTO;

public interface MypageService {

	List<BookDTO> getRecommendbookRandom();

	String sendEmail(String email, HttpSession session) throws Exception;

	int memberInfoModify(MemberDTO dto);

}
