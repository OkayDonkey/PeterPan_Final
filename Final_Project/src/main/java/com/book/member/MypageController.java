package com.book.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping("myPage.go")
	public String myPage() {
		
		return "member/myPage/myPageMain";
	}

}
