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

	@Override
	public int blockMember(MemberDTO dto) {
		return this.sqlSession.update("blockMember", dto);
	}

	@Override
	public int unblockMember(MemberDTO dto) {
		return this.sqlSession.update("unblockMember", dto);
	}

	@Override
	public int outOfPrint(BookDTO dto) {
		return this.sqlSession.update("outOfPrint", dto);
	}

	@Override
	public int cancelOutOfPrint(BookDTO dto) {
		return this.sqlSession.update("cancelOutOfPrint", dto);
	}

	@Override
	public int qnaAnswer(BoardDTO dto) {
		return this.sqlSession.insert("qnaAnswer", dto);
	}

	@Override
	public List<MemberDTO> memberSearch(String keyword) {
		return this.sqlSession.selectList("memberSearch", keyword);
	}

	@Override
	public List<BookDTO> bookSearch(String keyword) {
		return this.sqlSession.selectList("bookSearch", keyword);
	}

	@Override
	public List<BoardDTO> boardSearch(String keyword) {
		return this.sqlSession.selectList("boardSearch", keyword);
	}

}
