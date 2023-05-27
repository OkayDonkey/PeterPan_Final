package com.book.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.nio.channels.SeekableByteChannel;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.bookmodel.CartDAO;
import com.book.model.BookDTO;
import com.book.model.CartDTO;
import com.book.model.MemberDTO;
import com.github.scribejava.core.model.Response;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
public class CartController {

	@Autowired
	private CartDAO Cdao;

	@RequestMapping("cart.go")
	public void cartList(Model model,CartDTO dto,HttpServletResponse response,HttpServletRequest request,HttpSession session,BookDTO bdto) throws IOException {		
		
		MemberDTO mdto = (MemberDTO)session.getAttribute("session");
		
		String memberId =mdto.getMemberId();
		
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		System.out.println(dto.getMemberId());
		
		if(dto.getMemberId() == null || dto.getMemberId().equals("")) {
			out.println("<script>");
			out.println("alert('로그인 먼저 부탁드립니다')");
			out.println("location.href='login.go'");
			out.println("</script>");			

		} else{
			
			int check = Cdao.getCartCkeck(dto);
			
			if(check == 0) {
				this.Cdao.insertCart(dto);
				
				out.println("<script>");
				out.println("location.href='cartList.go'");
				out.println("</script>");		
			}else {
			// 확인 대화 상자 표시
		/*	 if (dto.getMemberId() != null && dto.getMemberId().equals(dto.getMemberId())) {*/
				 
					this.Cdao.cartIf(dto);
					out.println("<script>");	
					out.println("alert('기존 상품에 추가했습니다')");
					out.println("history.back()");
					out.println("</script>");	
				 } 
		
		}
	}
	@RequestMapping("cartList.go")
	public String cartList(Model model,HttpSession session){
		
			MemberDTO sessiondto = (MemberDTO) session.getAttribute("session");
			
			System.out.println(sessiondto);
			
			String memberId =sessiondto.getMemberId(); 
			
			System.out.println(memberId);

		List<CartDTO> list = this.Cdao.getcartList(memberId);
		
		System.out.println(list);

		model.addAttribute("cList",list );		
		return "cart/Cart";
		}
	
	@RequestMapping("cartDelete.go")
	public void deletecart(HttpSession session,CartDTO dto,HttpServletResponse response) throws IOException {
		
		int check = this.Cdao.deletcart(dto);
		
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out =  response.getWriter();
		if(check > 0) {
			this.Cdao.deletecheck(dto);
			out.println("<script>");
			out.println("location.href='cartList.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("histroy.back()");
			out.println("</script>");			
		}
			 
	}
	
	
	@RequestMapping("buy.go")
	public String buyList(Model model,HttpSession session){
		
		MemberDTO sessiondto = (MemberDTO) session.getAttribute("session");

		List<CartDTO> list = this.Cdao.getcartList(sessiondto.getMemberId());
		
		System.out.println(list);
	
		model.addAttribute("cList",list );		
		
		return "cart/Buy";
	}
	
}
