package com.book.member;


import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.book.membermodel.LoginDAO;
import com.book.membermodel.LoginService;
import com.book.model.LoginDTO;
import com.book.model.MemberDTO;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;

@Controller
public class LoginController {
	
	@Autowired
	private LoginDAO dao;
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("login.go")
	public String login(HttpSession session, Model model) throws Exception {
		
		String clientId = "eTDbNDf4IbCBkdCrvj09";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = URLEncoder.encode("http://localhost:8585/main/naver_login_ok.go", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    session.setAttribute("state", state);
	    
	    model.addAttribute("apiURL", apiURL);
		
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
			model.addAttribute("SNSNickname", nickname);
			model.addAttribute("SNSEmail", email);
			
			return "member/join/kakao_join_form.jsp";
		}
		
    }
	
	@RequestMapping("naver_login_ok.go")
	public String naverLoginOk(@RequestParam(value = "code", required = false) String code, Model model, HttpSession httpSession) throws Exception {
		
		System.out.println("#########" + code);
		
		String access_Token = loginService.getnaverAccessToken(code, httpSession);
		
		HashMap<String, Object> userInfo = loginService.getnaverUserInfo(access_Token);
		
		String nickname = (String) userInfo.get("nickname");
		String email = (String) userInfo.get("email");
		String phone = (String) userInfo.get("phone");
		String cleanedPhone = phone.replaceAll("-", "");
		String birthyear = (String) userInfo.get("birthyear");
		String birthday = (String) userInfo.get("birthday");
		String cleanedbirthday = birthday.replaceAll("-", "");
		String birth = birthyear + cleanedbirthday;
		String gender = (String) userInfo.get("gender");
		
		System.out.println("###naver_access_Token#### : " + access_Token);
		System.out.println("###naver_nickname#### : " + userInfo.get("nickname"));
		System.out.println("###naver_email#### : " + userInfo.get("email"));
		System.out.println("###naver_phone#### : " + userInfo.get("phone"));
		System.out.println("###naver_birth#### : " + birth);
		System.out.println("###naver_birth#### : " + userInfo.get("gender"));
		
		
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
			model.addAttribute("SNSNickname", nickname);
			model.addAttribute("SNSEmail", email);
			model.addAttribute("SNSPhone", cleanedPhone);
			model.addAttribute("birth", birth);
			model.addAttribute("gender", gender);
			
			return "member/join/naver_join_form";
		}
		
	}
	
	@RequestMapping("google_login.go")
	@ResponseBody
	public String googleLogin() {
		
		String reqUrl = 
				"https://accounts.google.com/o/oauth2/v2/auth"
				+ "?client_id=513875319931-f90iglrn7d97gt1in187q8ucmln9rdvg.apps.googleusercontent.com"
				+ "&redirect_uri=http://localhost:8585/main/google_login_ok.go"
				+ "&response_type=code"
				+ "&scope=email%20profile%20openid"
				+ "&access_type=offline";
		
		return reqUrl;
	}
	
	@RequestMapping("google_login_ok.go")
	public String googleAuth(Model model, @RequestParam(value = "code") String authCode, HttpSession session) throws Exception {
		
		//HTTP Request를 위한 RestTemplate
		RestTemplate restTemplate = new RestTemplate();

		//Google OAuth Access Token 요청을 위한 파라미터 세팅
		GoogleOAuthRequest googleOAuthRequestParam = GoogleOAuthRequest
				.builder()
				.clientId("513875319931-f90iglrn7d97gt1in187q8ucmln9rdvg.apps.googleusercontent.com")
				.clientSecret("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")
				.code(authCode)
				.redirectUri("http://localhost:8585/main/google_login_ok.go")
				.grantType("authorization_code").build();

		
		//JSON 파싱을 위한 기본값 세팅
		//요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
		ObjectMapper mapper = new ObjectMapper();
		mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
		mapper.setSerializationInclusion(Include.NON_NULL);

		//AccessToken 발급 요청
		ResponseEntity<String> resultEntity = restTemplate.postForEntity("https://oauth2.googleapis.com/token", googleOAuthRequestParam, String.class);

		System.out.println("resultEntity >>>" + resultEntity);
		//Token Request
		GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
		});

		//ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
		String jwtToken = result.getIdToken();
		String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
			    .queryParam("id_token", jwtToken)
			    .toUriString();

		String resultJson = restTemplate.getForObject(requestUrl, String.class);
		
		System.out.println("resultJson >>>" + resultJson);
		
		Map<String,String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>(){});
		
		String email = userInfo.get("email");
		
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
			
			session.setAttribute("session", dto);
			
			return "redirect:/";
		} else {
			
			model.addAttribute("userInfo", userInfo);
			model.addAttribute("token", result.getAccessToken());
			
			return "member/join/google_join_form";
		}

	}
	
	@RequestMapping("id_pwd_search.go")
	public String idPwdSearch() {
		
		return "member/idPwdSearch";
	}
	
}
