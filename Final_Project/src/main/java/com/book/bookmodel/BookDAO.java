package com.book.bookmodel;

import java.util.List;

import com.book.model.BookDTO;
import com.book.model.NewRelBookDTO;
import com.book.model.ReviewDTO;
import com.book.model.ReviewPercentDTO;

public interface BookDAO {
	
	BookDTO getBookDetail(int bookNo);
	
	List<ReviewDTO> getReviewCont(int bookNo);

	ReviewPercentDTO getPercentReview(int bookNo);
	
	List<BookDTO> getbooklist();
	
	List<BookDTO> getbestlist();

	List<NewRelBookDTO> getNewRelBook();

}
