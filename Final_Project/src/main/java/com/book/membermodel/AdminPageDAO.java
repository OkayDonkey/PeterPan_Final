package com.book.membermodel;

import java.util.List;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.MemberDTO;

public interface AdminPageDAO {

	List<MemberDTO> memberList();

	List<BookDTO> bookList();

	List<BoardDTO> qnaList();

	int blockMember(MemberDTO dto);

	int unblockMember(MemberDTO dto);

	int outOfPrint(BookDTO dto);

	int cancelOutOfPrint(BookDTO dto);

	int qnaAnswer(BoardDTO dto);

	List<MemberDTO> memberSearch(String keyoword);

	List<BookDTO> bookSearch(String keyword);

	List<BoardDTO> boardSearch(String keyword);

}
