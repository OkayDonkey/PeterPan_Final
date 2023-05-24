package com.book.member;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.membermodel.LoginDAO;
import com.book.membermodel.LoginService;
import com.book.model.LoginDTO;
import com.book.model.MemberDTO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO dao;
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("login.go")
	public String login(HttpSession session, Model model) throws Exception {
		
		String clientId = "eTDbNDf4IbCBkdCrvj09";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = URLEncoder.encode("http://localhost:8585/main/naver_login.go", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    
	    model.addAttribute("apiURL", apiURL);
	    session.setAttribute("state", state);
		
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
				+ "&redirect_uri=http://localhost:8585/main/kakao_login_ok.go"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	@RequestMapping("kakao_login_ok.go")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model, HttpSession httpSession) throws Exception {
		
		System.out.println("#########" + code);
		
		String access_Token = loginService.getAccessToken(code);
		
		HashMap<String, Object> userInfo = loginService.getUserInfo(access_Token);
		
		String nickname = (String) userInfo.get("nickname");
		String email = (String) userInfo.get("email");
		
		System.out.println("###kakao_access_Token#### : " + access_Token);
		System.out.println("###kakao_nickname#### : " + userInfo.get("nickname"));
		System.out.println("###kakao_email#### : " + userInfo.get("email"));
		
		int isLoggedIn = this.dao.checkLoginStatus(email);
		
		if(isLoggedIn == 1) {
			MemberDTO dto = this.dao.SNSLogin(email);
			
			// 이메일 인증 했는지 확인
		    if (loginService.emailAuthFail(dto.getMemberId()) != 1) {
		        System.out.println("이메일 인증 안됨");
		        String errorMessage = "이메일 인증 후 로그인 해주세요.";
		        model.addAttribute("errorMessage", errorMessage);
		        return "member/login";
		    }
			
			httpSession.setAttribute("session", dto);
			
			return "redirect:/";
		} else {
			model.addAttribute("kakaoNickname", nickname);
			model.addAttribute("kakaoEmail", email);
			
			return "member/join/SNS_join_form";
		}
		
    }
	
	@RequestMapping("naver_login.go")
	public void naverLohinOk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String clientId = "eTDbNDf4IbCBkdCrvj09";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "0V9OEgK2DD";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8585/main/naver_login.go", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.print("responseCode="+responseCode);
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      
	      response.setContentType("text/html; charset=UTF-8");
	      PrintWriter out = response.getWriter();
	      
	      if(responseCode==200) {
	        out.println(res.toString());
	        response.sendRedirect("naver_login_ok.go");
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	}
	
	
}
