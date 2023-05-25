package com.book.bookmodel;


import java.util.List;
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
	
	@Override
	public List<CartDTO> getcartList(String memberId) {
		return this.SqlSession.selectList("c_list",memberId);
	}

	@Override
	public int cartIf(CartDTO dto) {
		return this.SqlSession.update("ifcart",dto);
	}

	@Override
	public int getCartCkeck(CartDTO dto) {
		return this.SqlSession.selectOne("check",dto);
	}
	
	@Override
	public int deletcart(CartDTO dto) {
		return  this.SqlSession.delete("delete",dto);
	}
	@Override
	public int deletecheck(CartDTO dto) {
		return this.SqlSession.update("deletecheck",dto);
	}
}