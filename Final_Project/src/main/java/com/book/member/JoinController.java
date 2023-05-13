package com.book.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.memberDAO.JoinDAO;

@Controller
public class JoinController {
	
	@Autowired
	private JoinDAO dao;
	
	@RequestMapping("join.go")
	public String join() {
		
		return "member/join";
	}
	
	@RequestMapping("general_join.go")
	public String generalJoin() {
		
		return "member/general_join_phoneCert";
	}
	
	@RequestMapping("general_join_form.go")
	public String generalJoinForm() {
		
		return "member/general_join_form";
	}

}
