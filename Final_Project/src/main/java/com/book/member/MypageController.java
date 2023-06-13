package com.book.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	@RequestMapping("qna_delete.go")
	public void qnaDelete(@RequestParam("boardNo") int boardNo, HttpServletResponse response) throws Exception {
		
		int qnaAnwercount = this.service.qnaAnwerCount(boardNo);
		
		if(qnaAnwercount > 0) {
			this.service.qnaAnswerDelete(boardNo);
		}
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int check = this.service.qnaDelete(boardNo);
		
		if(check > 0) {
			out.println("<script>");
	        out.println("alert('1:1 문의하신 글이 삭제되었습니다.')");
	        out.println("location.href='qnaList.go';");
	        out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('1:1 문의하신 글 삭제에 실패하였습니다.)");
	        out.println("history.back()");
	        out.println("</script>");
		}
		
	}
	
	@RequestMapping("qna_modify.go")
	public String qnaModify(@RequestParam("boardNo") int boardNo, Model model) {
		
		BoardDTO dto = this.service.getBoardDtoAtboardNo(boardNo);
		
		model.addAttribute("DTO", dto);
		
		return "member/myPage/qnaModify";
	}
	
	@RequestMapping("board_qna_modify_ok.go")
	public void boardQnaModifyOk(BoardDTO dto, HttpServletResponse response, MultipartHttpServletRequest mRequest) throws IOException {
		
		String uploadPath = "C:\\Users\\YBG\\Documents\\GitHub\\Final_Froject_book\\Final_Project\\src\\main\\webapp\\resources\\upload";

		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);

		int month = cal.get(Calendar.MONTH) + 1;

		int day = cal.get(Calendar.DAY_OF_MONTH);

		// getFileNames() : 업로드된 파일들의 이름 목록을 제공해 주는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();

		String uploadFileName = iterator.next();

		// file1으로 뜸.
		MultipartFile mFile = mRequest.getFile(uploadFileName);

		// 실제 파일 이름
		String originalFileName = mFile.getOriginalFilename();

		// 실제 폴더를 만들어 보자
		String homedir = uploadPath + "/" + year + "-" + month + "-" + day;

		File path1 = new File(homedir);

		if (!path1.exists()) {
			path1.mkdirs();
		}

		// 실제 파일을 만들어 보자.
		String saveFileName = originalFileName;

		if (!saveFileName.equals("")) {
			// currentTimeMillis ==> 1000분의 1초 단위로 이름이 바뀐다.
			saveFileName = System.currentTimeMillis() + "_" + saveFileName;

			try {
				File origin = new File(homedir + "/" + saveFileName);

				// transferTo() : 파일데이터를 지정한 폴더로 실제 저장시키는 메서드.
				mFile.transferTo(origin);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
			
		dto.setBoardFile(saveFileName);
		
		int check = this.service.updateQna(dto);
		
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		if (check > 0) {
			out.println("<script>");
			out.println("alert('1:1 문의 수정이 되었습니다.')");
			out.println("location.href='qnaList.go'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('1:1 문의 수정이 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

}
