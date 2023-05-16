package com.book.main05;

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

import com.book.model.BookDAO;
import com.book.model.BookDTO;

@Controller
public class Main05Controller {
	
	@Autowired
	private BookDAO dao;
	
	@RequestMapping("bookDetail.go")
	public String bookDetail(@RequestParam("bookNo") int bookNo, Model model, HttpServletResponse response) {

	    BookDTO cont = this.dao.getBookDetail(bookNo);
	    System.out.println("책 정보:"+cont);
	    
	    
	    Calendar cal = Calendar.getInstance();
	    cal.add(Calendar.DATE, 2);
	    Date twoDaysLater = cal.getTime();

	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd일 E요일", Locale.KOREAN);
	    String twoDaysLaterStr = dateFormat.format(twoDaysLater);


	    response.setContentType("text/html;charset=UTF-8");
	    model.addAttribute("twoDaysLater", twoDaysLaterStr);
	    model.addAttribute("Cont", cont);

	    return "bookDetail/bookDetail";
	}

	
	
}
