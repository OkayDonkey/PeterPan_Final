package com.book.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public BookDTO getBookDetail(int bookNo) {
		
		return this.sqlSession.selectOne("detail", bookNo);
	}
	
	
}
