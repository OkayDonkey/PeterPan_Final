package com.book.membermodel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.model.BookDTO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDAO dao;

	@Override
	public List<BookDTO> getRecommendbookRandom() {
		return this.dao.getRecommendbookRandom();
	}

	
}
