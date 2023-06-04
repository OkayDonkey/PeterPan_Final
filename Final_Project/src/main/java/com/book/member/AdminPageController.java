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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("block_membership.go")
	@ResponseBody
	public String blockMembership(MemberDTO dto) {
		
		int check = this.service.blockMember(dto);
		
		if(check == 1) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping("unblock_membership.go")
	@ResponseBody
	public String unblockMembership(MemberDTO dto) {
		
		int check = this.service.unblockMember(dto);
		
		if(check == 1) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping("out_of_print.go")
	@ResponseBody
	public String outOfPrint(BookDTO dto) {
		int check = this.service.outOfPrint(dto);
		
		if(check == 1) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping("cancel_out_of_print.go")
	@ResponseBody
	public String cancelOutOfPrint(BookDTO dto) {
		int check = this.service.cancelOutOfPrint(dto);
		
		if(check == 1) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping("qna_answer.go")
	@ResponseBody
	public String qnaAnswer(BoardDTO dto) {
		int check = this.service.qnaAnswer(dto);
		
		if(check == 1) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping("admin_search.go")
	public String adminSearch(Model model, @RequestParam("manage") String manage, @RequestParam("keyword") String keyword) {
		
		if(manage.equals("member")) {
			List<MemberDTO> list = this.service.memberSearch(keyword);
			model.addAttribute("List", list);
			
			return "member/admin/memberManagementSearch";
		} else if(manage.equals("book")) {
			List<BookDTO> list = this.service.bookSearch(keyword);
			model.addAttribute("List", list);
			
			return "member/admin/bookManagementSearch";
		} else {
			List<BoardDTO> list = this.service.boardSearch(keyword);
			model.addAttribute("List", list);
			
			return "member/admin/qnaManagementSearch";
		}
		
		
	}
	
}
