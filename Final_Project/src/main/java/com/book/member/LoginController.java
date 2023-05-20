package com.book.member;


import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String loginOk(LoginDTO dto, HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model) throws Exception {

	    MemberDTO memberdto = this.dao.generalLogin(dto);

	    response.setContentType("text/html; charset=UTF-8");

	    if (memberdto == null || !BCrypt.checkpw(dto.getMemberPwd(), memberdto.getMemberPwd())) {
	        System.out.println("로그인 실패");
	        String errorMessage = "아이디나 비밀번호를 확인해주세요.";
	        model.addAttribute("errorMessage", errorMessage);
	        return "member/login";
	    }

	    // 이메일 인증 했는지 확인
	    if (loginService.emailAuthFail(dto.getMemberId()) != 1) {
	        System.out.println("이메일 인증 안됨");
	        String errorMessage = "이메일 인증 후 로그인 해주세요.";
	        model.addAttribute("errorMessage", errorMessage);
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
	
	@RequestMapping("kakao_login.go")
	@ResponseBody
	public String getKakaoAuthUrl(HttpServletRequest request) {
		
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=741eb3ae7fa62ff6c3ce720118cad209"
				+ "&redirect_uri=http://localhost:8585/main/SNS_join_form.go"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	@RequestMapping("SNS_join_form.go")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		
		System.out.println("#########" + code);
		
		String access_Token = loginService.getAccessToken(code);
		
		HashMap<String, Object> userInfo = loginService.getUserInfo(access_Token);
		
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		
		return "member/join/SNS_join_form";
    	}
	
}
