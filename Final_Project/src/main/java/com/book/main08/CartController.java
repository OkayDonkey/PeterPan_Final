package com.book.main08;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.main08DAO.CartDAO;
import com.book.model.CartDTO;

@Controller
public class CartController {

	@Autowired
	private CartDAO Cdao;
	
	@RequestMapping("cart.go")
	public String cartList(Model model,CartDTO dto,HttpServletResponse response,HttpServletRequest request) throws IOException {		
			
		int check = this.Cdao.insertCart(dto);
			
		response.setContentType("text/html; charset=UTF-8");
			System.out.println(check);
		    if (check > 0) {
		        // 확인 대화 상자 표시
		        String confirmMessage = "이동?";
		        String confirmScript = "if (confirm('" + confirmMessage + "')) { window.location.href = 'cartList.go'; } else { history.back(); }";
		        model.addAttribute("confirmScript", confirmScript);
		    } else {
		        // 이전 페이지로 돌아가기
		        return "redirect:back";
		    }
	
		    return "home";
	 
		}
	}