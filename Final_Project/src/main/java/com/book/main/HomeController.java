package com.book.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.main04DAO.BookDAO;
import com.book.model.BookDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BookDAO dao;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String home(Model model) {
	
		List<BookDTO> list =this.dao.getbooklist();
		List<BookDTO> bestlist =this.dao.getbestlist();
		
		System.out.println("aa");
		System.out.println(list);
		
		model.addAttribute("List", list)
			 .addAttribute("bestList",bestlist);
		
		
		return "home";
	}
	@RequestMapping("footer.go")
	public String footer() {
		return "top/footer";
}
}
