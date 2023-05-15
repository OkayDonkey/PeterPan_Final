/*
 * package com.book.main04;
 * 
 * import java.util.List;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod;
 * 
 * import com.book.main04DAO.BookDAO; import com.book.model.BookDTO;
 * 
 * @Controller public class Main04Controoler {
 * 
 * @RequestMapping("list.go)
 * 
 * 
 * private BookDAO dao;
 * 
 * @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET) public
 * String home(Model model) {
 * 
 * List<BookDTO> list =this.dao.getbooklist();
 * 
 * System.out.println("aa"); System.out.println(list);
 * 
 * model.addAttribute("list", list);
 * 
 * return "home"; }
 * 
 * 
 * }
 */