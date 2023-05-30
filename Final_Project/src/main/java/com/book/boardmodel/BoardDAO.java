package com.book.boardmodel;

import java.util.List;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;

public interface BoardDAO {
	
	List<BookDTO> getBoardMainList();

	List<BoardDTO> getbest10List();

	List<BoardDTO> getcategoryList(String category);

	// 1:1 문의 접수
	int insertQna(BoardDTO dto);



}
