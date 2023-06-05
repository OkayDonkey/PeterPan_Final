package com.book.membermodel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.MemberDTO;

@Service
public class AdminPageSeciveImpl implements AdminPageSecive{

	@Autowired
	private AdminPageDAO dao;
	
	@Override
	public List<MemberDTO> memberList() {
		return this.dao.memberList();
	}

	@Override
	public List<BookDTO> bookList() {
		return this.dao.bookList();
	}

	@Override
	public List<BoardDTO> qnaList() {
		return this.dao.qnaList();
	}

	@Override
	public int blockMember(MemberDTO dto) {
		return this.dao.blockMember(dto);
	}

	@Override
	public int unblockMember(MemberDTO dto) {
		return this.dao.unblockMember(dto);
	}

	@Override
	public int outOfPrint(BookDTO dto) {
		return this.dao.outOfPrint(dto);
	}

	@Override
	public int cancelOutOfPrint(BookDTO dto) {
		return this.dao.cancelOutOfPrint(dto);
	}

	@Override
	public int qnaAnswer(BoardDTO dto) {
		return this.dao.qnaAnswer(dto);
	}

	@Override
	public List<MemberDTO> memberSearch(String keyword) {
		return this.dao.memberSearch(keyword);
	}

	@Override
	public List<BookDTO> bookSearch(String keyword) {
		return this.dao.bookSearch(keyword);
	}

	@Override
	public List<BoardDTO> boardSearch(String keyword) {
		return this.dao.boardSearch(keyword);
	}

}
