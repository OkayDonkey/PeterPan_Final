package com.book.bookmodel;

import java.util.List;
import java.util.Map;

import com.book.model.BookDTO;
import com.book.model.PageDTO;

public interface plusListDAO {

	//전체 수량 새기
	int getListCount();


	List<BookDTO> getplusList(PageDTO pdto);

	List<BookDTO> toList(PageDTO dto);

	int getListCategory(String category);

	int searchbookCount(Map<String, String> map);

	List<BookDTO> searchbookList(PageDTO pdto);

	int genreList(Map<String, String> map);


	List<BookDTO> genList(PageDTO dto);

	//베스트 리스트 뽑기
	List<BookDTO> getbestList(PageDTO dto);
	
	int BestCount();


	List<BookDTO> newbook(PageDTO pdto);


	int newCount();

}
