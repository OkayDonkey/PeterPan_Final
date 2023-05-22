package com.book.main05;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.bookmodel.DibDAO;
import com.book.model.DibsDTO;
import com.book.model.MemberDTO;

@Controller
public class DibsController {
	
	@Autowired
	private DibDAO dao;
	
	@RequestMapping("dibs.go")
	public void dibs(DibsDTO dto, HttpSession session, 
			@RequestParam("memberNo") int memberNo,@RequestParam("bookNo") int bookNo) {
		
			System.out.println("Ajax>>>Controller     memberNo:"+memberNo+"bookNo:"+bookNo);
		
		MemberDTO Mdto = (MemberDTO)session.getAttribute("session");
		System.out.println("세션 회원정보 :"+Mdto);
		System.out.println("DibDTO정보 :"+dto.getMemberNo());
		
		int check = this.dao.checkDibs(dto.getMemberNo());
			
		if(check == 1) { // 좋아요를 이미 눌렀을 때
			System.out.println("좋아요 데이터 있음");
		}else {	// 로그인 데이터가 없거나 좋아요 데이터가 없을 때
			System.out.println("좋아요 데이터 없음");
			this.dao
		}
		
	}
	
}
