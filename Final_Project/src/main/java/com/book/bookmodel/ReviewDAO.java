
package com.book.bookmodel;

import java.util.List;

import com.book.model.LikeDTO;
import com.book.model.ReviewDTO;
	
public interface ReviewDAO{
	
	public List<ReviewDTO> loadReview(int bookNo);
	
	public int insertReview(ReviewDTO dto);
	
	public int insertLike(LikeDTO likeDto);
	
}
