package com.book.boardmodel;

import java.util.List;
import java.util.Map;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.PageDTO;

public interface BoardDAO {
	
	List<BookDTO> getBoardMainList();

	List<BoardDTO> getbest10List();

	List<BoardDTO> getcategoryList(String category);

	// 1:1 문의 접수
	int insertQna(BoardDTO dto);

	List<BoardDTO> searchList(Map<String, String> map);

	List<BoardDTO> noticeList(PageDTO p);

	int getNoticeCount();

	BoardDTO noticeDetail(int dno);
	
	int KeywordCount(String keyword);

	List<BoardDTO> noticeSearchList(PageDTO pdto);

	List<BoardDTO> mainNotice();

}
