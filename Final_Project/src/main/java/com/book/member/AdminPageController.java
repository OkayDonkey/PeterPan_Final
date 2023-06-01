package com.book.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.membermodel.AdminPageSecive;
import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.MemberDTO;

@Controller
public class AdminPageController {
	
	@Autowired
	private AdminPageSecive service;
	
	@RequestMapping("adminPage.go")
	public void adminPage(HttpSession session, MemberDTO dto, HttpServletResponse response) throws Exception {
		
		dto = (MemberDTO) session.getAttribute("session");
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(dto == null) {
			out.println("<script>");
	        out.println("alert('로그인 후 이용해 주세요.')");
	        out.println("location.href='login.go';");
	        out.println("</script>");
		} else {
			out.println("<script>");
	        out.println("location.href='adminPage_go.go';");
	        out.println("</script>");
		}
		
	}
	
	@RequestMapping("adminPage_go.go")
	public String adminPageGo(Model model) {
		
		List<MemberDTO> mlist = this.service.memberList();
		List<BookDTO> blist = this.service.bookList();
		List<BoardDTO> qnalist = this.service.qnaList();
		
		model.addAttribute("memberList", mlist).
			  addAttribute("bookList", blist).
			  addAttribute("qnaList", qnalist);
		
		return "member/admin/adminPageMain";
	}
	
	@RequestMapping("member_management.go")
	public String memberManagement(Model model) {
		
		List<MemberDTO> mlist = this.service.memberList();
		
		model.addAttribute("memberList", mlist);
		
		return "member/admin/memberManagement";
	}
	
	@RequestMapping("book_management.go")
	public String bookManagement(Model model) {
		
		List<BookDTO> blist = this.service.bookList();
		
		model.addAttribute("bookList", blist);
		
		return "member/admin/bookManagement";
	}
	
	@RequestMapping("qna_management.go")
	public String qnaManagement(Model model) {
		
		List<BoardDTO> qnalist = this.service.qnaList();
		
		model.addAttribute("qnaList", qnalist);
		
		return "member/admin/qnaManagement";
	}

}
