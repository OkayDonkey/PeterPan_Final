package com.book.membermodel;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.BookDTO;

@Repository
public class MypageDAOImpl implements MypageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BookDTO> getRecommendbookRandom() {
		return this.sqlSession.selectList("RecommendbookRandom");
	}

}
