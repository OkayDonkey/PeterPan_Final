package com.book.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.SeekableByteChannel;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.bookmodel.CartDAO;
import com.book.model.CartDTO;

@Controller
public class CartController {

	@Autowired
	private CartDAO Cdao;

	@RequestMapping("cart.go")
	public void cartList(Model model,CartDTO dto,HttpServletResponse response,HttpServletRequest request) throws IOException {		
		 
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		System.out.println(dto.getMemberId());
		
		if(dto.getMemberId() == null || dto.getMemberId().equals("")) {
			out.println("<script>");
			out.println("alert('로그인 먼저 부탁드립니다')");
			out.println("location.href='login.go'");
			out.println("</script>");			

		} else{
			
				/*
				 * if(dto.getMemberId() != null &&
				 * dto.getMemberId().equals("dto.getMemberId()"))
				 */	
			
			this.Cdao.insertCart(dto);	
			
			if (dto.getMemberId() != null) {
				
				// 확인 대화 상자 표시
				out.println("확인용"); /*  <<  */
				out.println("<script>");
				out.println("alert('장바구니 추가 성공')");
				out.println("if(confirm('장바구니로 이동')) {location.href = 'cartListpop.go' } else {redirect:/back; }");
				out.println("</script>");
				
			} else {
				// 이전 페이지로 돌아가기
				out.println("<script>");
				out.println("alert('장바구니 추가 실패')");
				out.println("history.back()");				
				out.println("</script>");
			}
		}
	
	}
	
/*	@RequestMapping("cartListpop")
	public String pop(Model model){
		*/
		
	}
