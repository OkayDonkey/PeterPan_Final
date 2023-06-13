package com.book.bookmodel;


import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.CartDTO;
import com.book.model.CouponDTO;
import com.book.model.MemberDTO;
import com.book.model.PurchaseDTO;


@Repository
public class CartDAOImpl implements CartDAO{

	@Autowired
	private SqlSessionTemplate SqlSession;
	
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
	
	@Override
	public int cartMinusEa(CartDTO dto) {
		 
		return this.SqlSession.update("minusCartEa", dto);
	}
	
	@Override
	public int cartPlusEa(CartDTO dto) {
		
		return this.SqlSession.update("plusCartEa", dto);
	}
	
	@Override
	public int cartTotalCost(CartDTO dto) {
		 
		return this.SqlSession.selectOne("calCartTotalCost", dto);
	}
	
	@Override
	public List<CouponDTO> getCouponList(String string) {
 
		return this.SqlSession.selectList("couponList", string);
	}
	
	@Override
	public int deleteCoupon(int couponNo) {
		 
		return this.SqlSession.delete("deleteCoupon", couponNo);
	}
	
	@Override
	public int deleteMemCart(String memId) {
		 
		return this.SqlSession.delete("deleteCart", memId);
	}
	
	@Override
	public int insertPurchase(PurchaseDTO dto) {
		 
		return this.SqlSession.insert("insertPurchase", dto);
	}
	
	@Override
	public void updatePoint(MemberDTO dto) {
		 
		this.SqlSession.update("updatePoint", dto);
	}
	
	@Override
	public int getCouponPrice(int couponNo) {
	 
		return this.SqlSession.selectOne("getCouponPrice", couponNo);
	}
	
	@Override
	public List<PurchaseDTO> purchasList(String purchaseNo) {
		 
		return this.SqlSession.selectList("purchaseNoList", purchaseNo);
	}
	
	
	
}