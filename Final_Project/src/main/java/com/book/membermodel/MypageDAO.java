package com.book.membermodel;

import java.util.List;

import com.book.model.BookDTO;

public interface MypageDAO {

	List<BookDTO> getRecommendbookRandom();

}
