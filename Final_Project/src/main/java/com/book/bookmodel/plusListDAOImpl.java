package com.book.bookmodel;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.BookDTO;
import com.book.model.PageDTO;

@Repository
public class plusListDAOImpl implements plusListDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("count");
	}

	@Override
	public int getListCategory(String category) {
		return this.sqlSession.selectOne("cate",category);
	}
	
	
	@Override
	public List<BookDTO> getplusList(PageDTO pdto) {
		return this.sqlSession.selectList("List",pdto);
	}
	
	@Override
	public List<BookDTO> toList(PageDTO pdto) {
		return this.sqlSession.selectList("tolist",pdto);
	}
	
	//서치목록을 수량 새주는 메서드
	@Override
	public int searchbookCount(Map<String, String> map) {
	    return this.sqlSession.selectOne("search", map);
	}
	
	//서치 목록을 뿌려줄 메서드
	@Override
	public List<BookDTO> searchbookList(PageDTO pdto) {
		return this.sqlSession.selectList("searchOk",pdto);
	}
	
	//장르 카테고리 둘 다 카운터해줄 메서드
	@Override
	public int genreList(Map<String, String> map) {
	return this.sqlSession.selectOne("genre",map);
	}
	
	@Override
	public List<BookDTO> genList(PageDTO dto) {
	return this.sqlSession.selectList("gen",dto);
	}

	@Override
	public List<BookDTO> getbestList(PageDTO dto) {
	return this.sqlSession.selectList("bestList",dto);
	}
	@Override
	public int BestCount() {
		return this.sqlSession.selectOne("bestL");	
	}
	
	
	@Override
	public List<BookDTO> newbook(PageDTO pdto) {
	return this.sqlSession.selectList("new",pdto);
	}
	@Override
	public int newCount() {
	return this.sqlSession.selectOne("newL");
	}
	
	
}
