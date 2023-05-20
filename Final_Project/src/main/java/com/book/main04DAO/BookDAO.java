package com.book.main04DAO;

import java.util.List;

import com.book.model.BookDTO;


public interface BookDAO {
	
	List<BookDTO> getbooklist();
	
	List<BookDTO> getbestlist();


}

