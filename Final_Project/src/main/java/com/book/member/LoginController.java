package com.book.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.memberDAO.LoginDAO;
import com.book.model.LoginDTO;
import com.book.model.MemberDTO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO dao;
	
	@RequestMapping("login.go")
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping("login_ok.go")
	public String loginOk(LoginDTO dto, HttpServletRequest request, HttpSession session, Model model) {
		
		MemberDTO memberdto = this.dao.generalLogin(dto);
		
		session = request.getSession();
		
		System.out.println(BCrypt.checkpw(dto.getMemberPwd(), memberdto.getMemberPwd()));
		
		if(memberdto.getMemberPwd().equals(dto.getMemberPwd())) {
			System.out.println("로그인 성공");
			session.setAttribute("seesionId", dto.getMemberId());
			
			return "home";
		}else {
			session.setAttribute("seesionId", null);
			
			System.out.println("실패 비밀번호 다름");
			return "member/login";
		}
		
		
		/*
		 * if(memberdto == null || !BCrypt.checkpw(dto.getMemberPwd(),
		 * memberdto.getMemberPwd())) { return "member/login"; }
		 */
		 
	}
	
	
}
