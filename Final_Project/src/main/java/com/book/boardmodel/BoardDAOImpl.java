package com.book.boardmodel;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.PageDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BookDTO> getBoardMainList() {
		return this.sqlSession.selectList("all");
	}

	@Override
	public List<BoardDTO> getbest10List() {
		return this.sqlSession.selectList("getBest10");
	}

	@Override
	public List<BoardDTO> getcategoryList(String category) {
		return this.sqlSession.selectList("getcategoryList", category);
	}
	
	@Override
	public int insertQna(BoardDTO dto) {
		return this.sqlSession.insert("add", dto);
	}

	@Override
	public List<BoardDTO> searchList(Map<String, String> map) {
		return this.sqlSession.selectList("searchList", map);
	}

	@Override
	public List<BoardDTO> noticeList(PageDTO p) {
		return this.sqlSession.selectList("noticeList", p);
	}

	@Override
	public int getNoticeCount() {
		return this.sqlSession.selectOne("notice_count");
	}

	@Override
	public BoardDTO noticeDetail(int dno) {
		return this.sqlSession.selectOne("detailAll", dno);
	}

	@Override
	public int KeywordCount(String keyword) {
		return this.sqlSession.selectOne("notice_keyword_count", keyword);
	}

	@Override
	public List<BoardDTO> noticeSearchList(PageDTO pdto) {
		return this.sqlSession.selectList("noticeSearchList", pdto);
	}

	@Override
	public List<BoardDTO> mainNotice() {
		return this.sqlSession.selectList("mainNotice");
	}
}
