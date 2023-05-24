package com.book.book;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.bookmodel.DibDAO;
import com.book.model.DibsDTO;
import com.book.model.MemberDTO;

@Controller
public class DibsController {
	
	@Autowired
	private DibDAO dao;
	
	@RequestMapping("dibs.go")
	@ResponseBody
	public String dibs(DibsDTO dto, HttpSession session, HttpServletResponse response) throws Exception {
		
		System.out.println("Ajax>>>Controller     memberNo:" + dto.getMemberNo() + " bookNo:" + dto.getBookNo());
	
		MemberDTO Mdto = (MemberDTO) session.getAttribute("session");
		System.out.println("세션 회원정보 :" + Mdto);
		System.out.println("DibDTO정보 :" + dto);
		
		DibsDTO Ddto = this.dao.checkDibs(dto);
		
		System.out.println("좋아요 체크 Ddto:" + Ddto);
		
		int result = 0;
		
		if (Ddto == null) { // 로그인 데이터가 없거나 좋아요 데이터가 없을 때
			
			System.out.println("좋아요 데이터 없음");
			result = 1;
			this.dao.insertDibs(dto);;
			System.out.println(result);
			
		} else {  // 좋아요를 이미 눌렀을 때
			
			System.out.println("좋아요 데이터 있음");
			result = 0;
			this.dao.deleteDibs(dto);
			System.out.println(result);
		}
		
		return String.valueOf(result);
	}
	
	@RequestMapping("checkDibs.go")
	@ResponseBody
	public String checkDibs(DibsDTO dto, HttpSession session, HttpServletResponse response) throws Exception {
		
		System.out.println("Ajax>>>Controller     memberNo:" + dto.getMemberNo() + " bookNo:" + dto.getBookNo());
	
		MemberDTO Mdto = (MemberDTO) session.getAttribute("session");
		System.out.println("세션 회원정보 :" + Mdto);
		System.out.println("DibDTO정보 :" + dto);
		
		DibsDTO Ddto = this.dao.checkDibs(dto);
		
		System.out.println("좋아요 체크 Ddto:" + Ddto);
		
		int result = 0;
		
		if (Ddto == null) { // 로그인 데이터가 없거나 좋아요 데이터가 없을 때
			
			System.out.println("좋아요 데이터 없음");
			result = 0;
			System.out.println(result);
			
		} else {  // 좋아요를 이미 눌렀을 때
			
			System.out.println("좋아요 데이터 있음");
			result = 1;
			System.out.println(result);
		}
		
		return String.valueOf(result);
	}
}
