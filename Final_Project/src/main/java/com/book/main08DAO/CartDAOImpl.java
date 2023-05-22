package com.book.main08DAO;


import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.CartDTO;


@Repository
public class CartDAOImpl implements CartDAO{

	@Autowired
	private SqlSessionTemplate SqlSession;
	
	/*
	 * @Override public int insertCart(Map<Integer,String> map) {
	 * this.SqlSession.insert("insert", map); }
	 */

	@Override
	public int insertCart(CartDTO dto) {
		return this.SqlSession.insert("c_insert",dto );

	}

}
