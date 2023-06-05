package com.book.member;

import java.io.PrintWriter;
import java.util.List;

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

import com.book.bookmodel.CartDAO;
import com.book.membermodel.LoginService;
import com.book.membermodel.MypageService;
import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.CouponDTO;
import com.book.model.MemberDTO;
import com.book.model.PurchaseDTO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService service;
	
	@Autowired
	private LoginService Loginservice;
	
	@Autowired
	private CartDAO Cdao;
	
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
		
		MemberDTO sessiondto = (MemberDTO) session.getAttribute("session");
		
		List<CouponDTO> couponList = this.service.getcoupon(sessiondto.getMemberId());
		
		model.addAttribute("couponList", couponList);
		
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
	
	@RequestMapping("email_send.go")
	@ResponseBody
	public String emailSend(@RequestParam("memberEmail") String email, HttpSession session) throws Exception {
		
		String mail_key = this.service.sendEmail(email, session);
		
		if(mail_key != null) {
			return "1";
		} else {
			return "0";
		}
		
	}
	
	@RequestMapping("member_modify_email_check.go")
	public ResponseEntity<Integer> memberModifyEmailCheck(@RequestParam("emailOkCode") String emailOkCode, HttpSession session) {
		
		if(emailOkCode.equals(session.getAttribute("mail_key"))) {
			session.removeAttribute("mail_key");
			return ResponseEntity.ok(1);
		} else {
			return ResponseEntity.ok(0);
		}
		
	}
	
	@RequestMapping("member_info_modify_ok.go")
	public void memberInfoModifyOk(MemberDTO dto, HttpServletResponse response, HttpSession session) throws Exception {
		
		System.out.println("dto.getMemberPwd() >>>" + dto.getMemberPwd());
		
		if(dto.getMemberPwd() != "" && dto.getMemberPwd() != null) {
			String salt = BCrypt.gensalt();
			
			String hashedPwd = BCrypt.hashpw(dto.getMemberPwd(), salt);
			
			dto.setMemberPwd(hashedPwd);
		}
		
		int check = this.service.memberInfoModify(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		dto = this.Loginservice.getmemberonelistbyId(dto.getMemberId());
		
		if(check > 0) {
			session.setAttribute("session", dto);
			out.println("<script>");
	        out.println("alert('회원 정보가 변경되었습니다.')");
	        out.println("location.href='myPage.go';");
	        out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원 정보 변경에 실패했습니다.')");
	        out.println("history.back()");
	        out.println("</script>");
		}
		
	}
	
	@RequestMapping("member_withdrawal.go")
	public String memberWirhdrawal() {
		
		return "member/myPage/memberWithdrawal";
	}
	
	@RequestMapping("member_delete.go")
	public void memberDelete(HttpSession session, MemberDTO dto, HttpServletResponse response) throws Exception {
		
		dto = (MemberDTO) session.getAttribute("session");
		
		int check = this.service.memberdelete(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			session.removeAttribute("session");
			out.println("<script>");
	        out.println("alert('회원탈퇴가 완료되었습니다.')");
	        out.println("location.href='/main/';");
	        out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원탈퇴를 실패하였습니다.')");
	        out.println("history.back()");
	        out.println("</script>");
		}
		
	}
	
	@RequestMapping("orderHistory.go")
	public String orderHistory(Model model, HttpSession session) {
		
		MemberDTO dto = (MemberDTO) session.getAttribute("session");
		
		List<PurchaseDTO> list = this.service.purchaseList(dto.getMemberId());
		
		model.addAttribute("List", list);
		
		return "member/myPage/orderHistory";
	}
	
	@RequestMapping("qnaList.go")
	public String qnaList(Model model, HttpSession session) {
		
		MemberDTO dto = (MemberDTO) session.getAttribute("session");
		
		if(dto == null) {
			
			return "member/login.go";
			
		} else {
			List<BoardDTO> totalList = this.service.qnaList(dto.getMemberNo());
			
			List<BoardDTO> noAnswerList = this.service.noAnswerqnaList(dto.getMemberNo());
			
			List<BoardDTO> answerOkList = this.service.answerOkqnaList(dto.getMemberNo());
			
			model.addAttribute("TotalList", totalList).
				  addAttribute("noAnswerList", noAnswerList).
				  addAttribute("answerOkList", answerOkList);
			
			return "member/myPage/qnaList";
		}
	}
	
	@RequestMapping("order_history_detail.go")
	public String orderHistoryDetail(Model model, @RequestParam("purchasNo") String purchasNo) {
		
		List<PurchaseDTO> pList = this.Cdao.purchasList(purchasNo);
		
		model.addAttribute("pList", pList);
		
		return "member/myPage/orderHistoryDetail";
	}

}
