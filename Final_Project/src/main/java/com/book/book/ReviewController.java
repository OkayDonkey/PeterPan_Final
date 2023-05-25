package com.book.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.bookmodel.ReviewDAO;
import com.book.model.LikeDTO;
import com.book.model.ReviewDTO;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewDAO dao;
	
	@RequestMapping("insertReview.go")
	@ResponseBody
	public List<ReviewDTO> insertReview(ReviewDTO reviewDto, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
	    
	    System.out.println("insertReview 컨트롤러 진입");
	    
	    int result = this.dao.insertReview(reviewDto);
	    /*
	    if(check == true) {
	    	
	    	System.out.println("추천함 데이터 추가");
	    	this.dao.insertLike(likeDto);
	    	
	    } else {
	    	
	    	System.out.println("추천하지 않음");
	    	
	    }
	    */
	    if (result > 0) {
	        
	        System.out.println("리뷰 등록완료: " + result);
	        List<ReviewDTO> rDtoList = this.dao.loadReview(reviewDto.getBookNo());
	        System.out.println("리뷰 로딩 책번호: " + reviewDto.getBookNo());
	        System.out.println("리뷰 정보: " + rDtoList);
	       
	        return rDtoList;
	    } else {
	    	return null;
	    }
	}
}
