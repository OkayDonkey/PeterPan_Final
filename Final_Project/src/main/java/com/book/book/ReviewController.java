package com.book.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.bookmodel.ReviewDAO;
import com.book.model.ReviewDTO;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewDAO dao;
	
	@RequestMapping("insertReview.go")
	@ResponseBody
	public List<ReviewDTO> insertReview(ReviewDTO reviewDto, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
	    
	    int result = this.dao.insertReview(reviewDto);
	    
	    if (result > 0) {
	        List<ReviewDTO> rDtoList = this.dao.loadReview(reviewDto.getBookNo());
	       
	        return rDtoList;
	    } else {
	    	return null;
	    }
	}
}
