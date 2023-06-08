package com.book.album;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.model.AlbumLikeDTO;
import com.book.model.MemberDTO;

@Controller
public class AlbumLikeController {
	
	@Autowired
	private AlbumDAO dao;
	
	@RequestMapping("albumLike.go")
	@ResponseBody
	public String Like(AlbumLikeDTO dto, HttpSession session, HttpServletResponse response) throws Exception {
		
		System.out.println("Ajax>>>Controller     memberNo:" + dto.getMemberNo() + " albumNo:" + dto.getAlbumNo());
	
		MemberDTO Mdto = (MemberDTO) session.getAttribute("session");
		
		System.out.println("세션 회원정보 :" + Mdto.getMemberNo());
		dto.setMemberNo(Mdto.getMemberNo());
		System.out.println("AlbumLikeDTO정보 :" + dto);
		
		AlbumLikeDTO Adto = this.dao.checkLike(dto);
		
		System.out.println("좋아요 체크 Ddto:" + Adto);
		
		int result = 0;
		
		if (Adto == null) { // 로그인 데이터가 없거나 좋아요 데이터가 없을 때
			
			System.out.println("좋아요 데이터 없음");
			result = 1;
			this.dao.insertLike(dto);;
			this.dao.insertAlbumLike(dto);;
			System.out.println(result);
			
		} else {  // 좋아요를 이미 눌렀을 때
			
			System.out.println("좋아요 데이터 있음");
			result = 0;
			this.dao.deleteLike(dto);
			this.dao.deleteAlbumLike(dto);
			System.out.println(result);
		}
		
		return String.valueOf(result);
	}
	
	@RequestMapping("checkAlbumLike.go")
	@ResponseBody
	public String checkAlbumLike(AlbumLikeDTO dto, HttpSession session, HttpServletResponse response) throws Exception {
		
		System.out.println("Ajax>>>Controller     memberNo:" + dto.getMemberNo() + " albumNo:" + dto.getAlbumNo());
	
		MemberDTO Mdto = (MemberDTO) session.getAttribute("session");
		System.out.println("세션 회원정보 :" + Mdto);
		dto.setMemberNo(Mdto.getMemberNo());
		System.out.println("DibDTO정보 :" + dto);
		
		AlbumLikeDTO Adto = this.dao.checkLike(dto);
		
		System.out.println("좋아요 체크 Ddto:" + Adto);
		
		int result = 0;
		
		if (Adto == null) { // 로그인 데이터가 없거나 좋아요 데이터가 없을 때
			
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
