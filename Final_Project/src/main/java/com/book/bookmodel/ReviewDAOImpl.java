package com.book.bookmodel;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertReview(ReviewDTO dto) {
		 
		return this.sqlSession.insert("insertView", dto);
	}
	
	@Override
	public List<ReviewDTO> loadReview(int bookNo) {
		 
		return this.sqlSession.selectList("loadIdReview",bookNo);
	}
}
