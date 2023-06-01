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

}
