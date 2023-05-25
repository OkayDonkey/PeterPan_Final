package com.book.bookmodel;

import java.util.List;

import com.book.model.CartDTO;

public interface CartDAO {
	


int insertCart(CartDTO dto);


List<CartDTO> getcartList(String string);

int cartIf(CartDTO dto);


int getCartCkeck(CartDTO dto);


int deletcart(CartDTO dto);

int deletecheck(CartDTO dto);
	
}
