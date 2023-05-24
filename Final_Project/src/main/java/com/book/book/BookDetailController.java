package com.book.book;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.bookmodel.BookDAO;
import com.book.model.BookDTO;
import com.book.model.DibsDTO;
import com.book.model.NewRelBookDTO;
import com.book.model.ReviewDTO;
import com.book.model.ReviewPercentDTO;

@Controller
public class BookDetailController {
	
	@Autowired
	private BookDAO dao;
	
	@RequestMapping("bookDetail.go")
	public String bookDetail(@RequestParam("bookNo") int bookNo, Model model, HttpServletResponse response) {

	    BookDTO cont = this.dao.getBookDetail(bookNo);
	    System.out.println("책 정보:"+cont);
	    
	    List<ReviewDTO> review = (List<ReviewDTO>) this.dao.getReviewCont(bookNo);
	    System.out.println("리뷰 정보:"+review);
	    
	    ReviewPercentDTO RPDto = this.dao.getPercentReview(bookNo);
	    System.out.println("리뷰-좋아요, 추천 % 데이터:"+RPDto);
	    
	    List<NewRelBookDTO> newRel = (List<NewRelBookDTO>) this.dao.getNewRelBook();
	    System.out.println("신작 정보:"+newRel);
	    
	    System.out.println();
	    
	    Calendar cal = Calendar.getInstance();
	    cal.add(Calendar.DATE, 2);
	    Date twoDaysLater = cal.getTime();
	    
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd일 E요일", Locale.KOREAN);
	    String twoDaysLaterStr = dateFormat.format(twoDaysLater);


	    response.setContentType("text/html;charset=UTF-8");
	    model.addAttribute("twoDaysLater", twoDaysLaterStr);
	    model.addAttribute("review", review);
	    model.addAttribute("Cont", cont);
	    model.addAttribute("PercentR", RPDto);
	    model.addAttribute("NewRelBook", newRel);

	    return "bookDetail/bookDetail";
	}
	
	
	
}
