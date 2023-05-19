package com.book.model;

import java.util.List;

public interface BookDAO {
	
	BookDTO getBookDetail(int bookNo);
	
	List<ReviewDTO> getReviewCont(int bookNo);

	ReviewPercentDTO getPercentReview(int bookNo);
}
