package com.book.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.memberDAO.LoginDAO;
import com.book.memberDAO.LoginService;
import com.book.model.LoginDTO;
import com.book.model.MemberDTO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO dao;
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("login.go")
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping("login_ok.go")
	public String loginOk(LoginDTO dto, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		
		MemberDTO memberdto = this.dao.generalLogin(dto);
		
		if(memberdto == null || !BCrypt.checkpw(dto.getMemberPwd(), memberdto.getMemberPwd())) {
			System.out.println("로그인 실패");
			
			return "member/login";
		}
		
		//이메일 인증 했는지 확인
        if (loginService.emailAuthFail(dto.getMemberId()) != 1) {
        	System.out.println("이메일 인증 안됨");
        	
            return "member/login";
        }
		
		model.addAttribute("user", memberdto);
		
		session = request.getSession();
		
		return "redirect:/";
	}
	
	@RequestMapping("logout.go")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) {
		
	        httpSession.removeAttribute("login");
	        httpSession.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("registerEmail.go")
	public String emailConfirm(MemberDTO memberDto)throws Exception{

	    loginService.updateMailAuth(memberDto);

	    return "/member/join/emailAuthSuccess";
	}
	
}
