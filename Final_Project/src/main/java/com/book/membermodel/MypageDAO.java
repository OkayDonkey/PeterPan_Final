package com.book.membermodel;

import java.util.List;

import com.book.model.BookDTO;
import com.book.model.MemberDTO;

public interface MypageDAO {

	List<BookDTO> getRecommendbookRandom();

	int memberInfoModify(MemberDTO dto);

}
