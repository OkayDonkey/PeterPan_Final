package com.book.main;


import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.bookmodel.BookDAO;
import com.book.model.BookDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BookDAO dao;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String home(Model model) {
	
		List<BookDTO> list =this.dao.getbooklist();
		List<BookDTO> bestlist =this.dao.getbestlist();
		
		model.addAttribute("List", list)
			 .addAttribute("bestList",bestlist);
		
		return "home";
	}
	@RequestMapping("footer.go")
	public String footer() {
		return "top/footer";
}
	
	@RequestMapping("terms.go")
	public String terms() {
		return "top/terms";
	}
	@RequestMapping("protect.go")
	public String pro() {
		return "top/protect";
	}
	@RequestMapping("kid.go")
	public String kid() {
		return "top/kid";
	}
	
}
