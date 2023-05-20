package com.book.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.memberDAO.JoinDAO;
import com.book.memberDAO.JoinService;
import com.book.model.MemberDTO;

@Controller
public class JoinController {
	
	@Autowired
	private JoinDAO dao;
	
	@Autowired
	private JoinService joinService;
	
	@RequestMapping("join.go")
	public String join() {
		
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
	public void generalJoinForm(MemberDTO dto,HttpSession session ,HttpServletRequest request , @RequestParam("OkNo") int insertNo, Model model, HttpServletResponse response) throws IOException {
		
		String name = dto.getMemberName();
		String phoneNo = dto.getMemberPhone();
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(insertNo == (Integer)session.getAttribute("validateNo")) {
			session.removeAttribute("validateNo");
			
			session.setAttribute("memberName", name);
			session.setAttribute("memberPhone", phoneNo);
			out.println("<script>");
			out.println("location.href='general_join_form_go.go?'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('인증번호가 맞지 않습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("general_join_form_go.go")
	public String generalJoinFormGo() {
		
		return "member/join/general_join_form";
	}
	
	@RequestMapping("general_join_ok.go")
	public String getneralJoinOk(MemberDTO dto, HttpServletResponse response) throws Exception {
		
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
	
}
