package com.book.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.memberDAO.JoinDAO;
import com.book.model.MemberDTO;

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
	
	@RequestMapping("general_join_ok.go")
	public void getneralJoinOk(MemberDTO dto, HttpServletResponse response) throws Exception {
		
		String salt = BCrypt.gensalt();
		
		String hashedPwd = BCrypt.hashpw(dto.getMemberPwd(), salt);
		
		dto.setMemberPwd(hashedPwd);
		
		int check = this.dao.join(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('회원가입이 완료되었습니다. 피터팬의 회원이 되신 것을 환영합니다.')");
			out.println("location.href='login.go'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원가입에 실패 하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
