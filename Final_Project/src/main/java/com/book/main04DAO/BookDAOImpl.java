package com.book.main04DAO;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.BookDTO;

@Repository
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BookDTO> getbooklist() {
	return this.sqlSession.selectList("main_all");
	}
	
	@Override
	public List<BookDTO> getbestlist() {
	return this.sqlSession.selectList("best_all");

	
	}


}
