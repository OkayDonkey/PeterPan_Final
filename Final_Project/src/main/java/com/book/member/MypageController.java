package com.book.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.membermodel.MypageService;
import com.book.model.BookDTO;
import com.book.model.MemberDTO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService service;
	
	@RequestMapping("myPage.go")
	public void myPage(HttpSession session, MemberDTO dto, HttpServletResponse response, Model model) throws Exception {
		
		dto = (MemberDTO) session.getAttribute("session");
		
		List<BookDTO> list = service.getRecommendbookRandom();
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(dto == null) {
			out.println("<script>");
	        out.println("alert('로그인 후 이용해 주세요.')");
	        out.println("location.href='login.go';");
	        out.println("</script>");
		} else {
			session.setAttribute("rbooklist", list);
			out.println("<script>");
	        out.println("location.href='mypage_go.go';");
	        out.println("</script>");
		}
	}
	
	@RequestMapping("mypage_go.go")
	public String myPageGo(Model model, HttpSession session) {
		
		return "member/myPage/myPageMain";
	}
	
	@RequestMapping("member_info_midify_pwdcheck.go")
	public String modifyPwdCheck() {
		
		return "member/myPage/myPagePwdCheck";
	}
	
	@RequestMapping("mypage_pwd_same_check.go")
	@ResponseBody
	public String mypagePwdSameCheck(@RequestParam("password") String password, HttpSession session) {
		
		MemberDTO dto = (MemberDTO) session.getAttribute("session");
		
		if(BCrypt.checkpw(password, dto.getMemberPwd())) {
			return "1";
		} else {
			return "0";
		}
	}
	
	@RequestMapping("member_info_modify.go")
	public String memberInfoModify() {
		
		return "member/myPage/memberInfoModify";
	}

}
