package com.book.book;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.bookmodel.ReviewDAO;
import com.book.model.ReviewDTO;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewDAO dao;
	
	@RequestMapping("insertReview.go")
	public String insertReview(ReviewDTO reviewDTO, HttpServletResponse response) {
	    
	    System.out.println("insertReview 컨트롤러 진입");
	    
	    int result = this.dao.insertReview(reviewDTO);
	    
	    if (result > 0) {
	        
	        System.out.println("리뷰 등록완료: " + result);
	        List<ReviewDTO> rDtoList = this.dao.loadReview(reviewDTO.getBookNo());
	        System.out.println("리뷰 로딩 책번호: " + reviewDTO.getBookNo());
	        System.out.println("리뷰 정보: " + rDtoList);
	        
	        // 리뷰 목록을 JSON으로 변환
	        JSONArray jsonArray = new JSONArray();
	        for (ReviewDTO dto : rDtoList) {
	            JSONObject obj = new JSONObject();
	            obj.put("ReviewDTO", dto);
	            jsonArray.put(obj);
	        }
	        
	        JSONObject jsonObj = new JSONObject();
	        jsonObj.put("RList", jsonArray.toString()); // jsonArray를 문자열로 변환하여 jsonObj에 추가
	        
	        response.setContentType("application/json"); // Content-Type 헤더 설정
	        
	        try {
	            PrintWriter out = response.getWriter();
	            out.println(jsonObj);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return null;
	}

	
	
}
