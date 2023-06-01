package com.book.membermodel;

import java.util.List;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.MemberDTO;

public interface AdminPageDAO {

	List<MemberDTO> memberList();

	List<BookDTO> bookList();

	List<BoardDTO> qnaList();

}
