package com.book.bookmodel;

import java.util.List;

import com.book.model.CartDTO;
import com.book.model.CouponDTO;
import com.book.model.MemberDTO;
import com.book.model.PurchaseDTO;

public interface CartDAO {
	
	int insertCart(CartDTO dto);
	
	List<CartDTO> getcartList(String string);
	
	int cartIf(CartDTO dto);
	
	int getCartCkeck(CartDTO dto);
	
	int deletcart(CartDTO dto);
	
	int deletecheck(CartDTO dto);

	int cartMinusEa(CartDTO dto);

	int cartPlusEa(CartDTO dto);
	
	int cartTotalCost(CartDTO dto);
	
	List<CouponDTO> getCouponList(String string);
	
	int deleteMemCart (String memId);

	int deleteCoupon(int couponNo);

	int insertPurchase(PurchaseDTO dto);

	void updatePoint(MemberDTO dto);
	
	int getCouponPrice(int couponNo);
	
	List<PurchaseDTO> purchasList(String purchaseNo);
	
}
