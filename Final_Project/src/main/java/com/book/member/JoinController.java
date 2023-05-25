package com.book.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.membermodel.JoinDAO;
import com.book.membermodel.JoinService;
import com.book.model.MemberDTO;

@Controller
public class JoinController {
	
	@Autowired
	private JoinDAO dao;
	
	@Autowired
	private JoinService joinService;
	
	@RequestMapping("join.go")
	public String join(HttpSession session, Model model) throws Exception {
		
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
		
		return "member/join/join";
	}
	
	@RequestMapping("general_join.go")
	public String generalJoin() {
		
		return "member/join/general_join_phoneCert";
	}
	
	@RequestMapping("general_join_phone.go")
	public String getneralJoinPhone() {
		
		return "member/join/general_join_phone";
	}
	
	@RequestMapping("general_join_form.go")
	public void generalJoinForm(MemberDTO dto, RedirectAttributes redirectAttributes , HttpSession session ,HttpServletRequest request , @RequestParam("OkNo") int insertNo, Model model, HttpServletResponse response) throws IOException {
		
		String name = dto.getMemberName();
		String phoneNo = dto.getMemberPhone();
		
		// 가입 여부를 확인하는 로직 추가
	    int isAlreadyJoined = joinService.checkIfAlreadyJoined(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if (isAlreadyJoined > 0) {
			session.setAttribute("memberPhone", phoneNo);
	        out.println("<script>");
	        out.println("alert('이미 가입되어 있습니다.')");
	        out.println("window.opener.location.href = 'already_join.go';");
	        out.println("window.close();");
	        out.println("</script>");
	    } else if (insertNo == (Integer) session.getAttribute("validateNo")) {
	        session.removeAttribute("validateNo");
	        session.setAttribute("memberName", name);
	        session.setAttribute("memberPhone", phoneNo);

	        out.println("<script>");
	        out.println("alert('인증되었습니다.')");
	        out.println("window.opener.location.href = 'general_join_form_go.go';");
	        out.println("window.close();");
	        out.println("</script>");
	    } else {
	        out.println("<script>");
	        out.println("alert('인증번호가 맞지 않습니다.')");
	        out.println("history.back()");
	        out.println("</script>");
	    }
	}
	
	@RequestMapping("already_join.go")
	public String alreadyJoin(MemberDTO dto, Model model, HttpSession session) {
		
		String phone = (String) session.getAttribute("memberPhone");
		
		dto = joinService.getmemberonelist(phone);
		
		model.addAttribute("member", dto);
		
		session.removeAttribute("memberPhone");
		
		return "member/join/already_join";
	}
	
	@RequestMapping("general_join_form_go.go")
	public String generalJoinFormGo() {
		
		return "member/join/general_join_form";
	}
	
	@RequestMapping("general_join_ok.go")
	public String getneralJoinOk(MemberDTO dto, HttpSession session) throws Exception {
		
		session.removeAttribute("memberName");
		session.removeAttribute("memberPhone");
		
		String salt = BCrypt.gensalt();
		
		String hashedPwd = BCrypt.hashpw(dto.getMemberPwd(), salt);
		
		dto.setMemberPwd(hashedPwd);
		
		this.joinService.join(dto);
		
		return "member/join/joinOk";
	}
	
	@ResponseBody
	@RequestMapping("join_idcheck.go")
	public int joinIdCheck(@RequestParam("checkId") String id) {
	    int checkId = this.dao.checkId(id);
	    if (checkId != 0) {
	        return 1;
	    } else {
	        return 0;
	    }
	}
	
	@ResponseBody
	@RequestMapping("join_emailcheck.go")
	public int joinEmailCheck(@RequestParam("checkEmail") String email) {
	    int checkEmail = this.dao.checkEmail(email);
	    if (checkEmail != 0) {
	        return 1;
	    } else {
	        return 0;
	    }
	}
	
	@RequestMapping("phoneCheck_form.go")
	public String phonCheckForm() {
		return "member/join/phone_check_form";
	}
	
	@RequestMapping("send.go")
	@ResponseBody
	public int sendSMS(@RequestParam("memberPhone") String phone, HttpSession session) throws Exception {
		
	    int validateNo = joinService.sendSMS(phone, session);
	    
	    if(validateNo == 202) {
	    	return 1;
	    } else {
	    	return 0;
	    }
	    
	}
	
	@RequestMapping("snsJoin_phone_check.go")
	public ResponseEntity<Integer> SNSJoinPhoneCheck(@RequestParam("okNo") int insertNo, HttpSession session) {
		
	    if (insertNo == (Integer) session.getAttribute("validateNo")) {
	        session.removeAttribute("validateNo");
	        return ResponseEntity.ok(1);
	    } else {
	        return ResponseEntity.ok(0);
	    }
	}

	
}
