package com.book.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.model.MemberDAO;

@Controller
public class LoginController {
	
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("login.go")
	public String login() {
		
		return "member/login";
	}
}
