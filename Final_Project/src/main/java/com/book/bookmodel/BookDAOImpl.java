package com.book.bookmodel;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.BookDTO;
import com.book.model.ReviewDTO;
import com.book.model.ReviewPercentDTO;

@Repository
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public BookDTO getBookDetail(int bookNo) {
		
		return this.sqlSession.selectOne("detail", bookNo);
	}
	
	@Override
	public List<ReviewDTO> getReviewCont(int bookNo) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("reviewCont", bookNo);
	}
	
	@Override
	public ReviewPercentDTO getPercentReview(int bookNo) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("percentLike", bookNo);
	}
	
}
