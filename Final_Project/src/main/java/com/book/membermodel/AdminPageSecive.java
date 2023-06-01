package com.book.membermodel;

import java.util.List;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.MemberDTO;

public interface AdminPageSecive {

	List<MemberDTO> memberList();

	List<BookDTO> bookList();

	List<BoardDTO> qnaList();

	int blockMember(MemberDTO dto);

	int unblockMember(MemberDTO dto);

}
