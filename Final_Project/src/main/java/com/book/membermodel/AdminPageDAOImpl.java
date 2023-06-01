package com.book.membermodel;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.MemberDTO;

@Repository
public class AdminPageDAOImpl implements AdminPageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MemberDTO> memberList() {
		return this.sqlSession.selectList("memberList");
	}

	@Override
	public List<BookDTO> bookList() {
		return this.sqlSession.selectList("bookList");
	}

	@Override
	public List<BoardDTO> qnaList() {
		return this.sqlSession.selectList("qnaList");
	}

}
