package com.book.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.memberDAO.LoginDAO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO dao;
	
	@RequestMapping("login.go")
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping("login_ok.go")
	public String loginOk() {
		
		return "home";
	}
	
	
}
