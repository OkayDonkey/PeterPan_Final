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
		
		MemberDTO Mdto = (MemberDTO) session.getAttribute("session");
		
		dto.setMemberNo(Mdto.getMemberNo());
		
		AlbumLikeDTO Adto = this.dao.checkLike(dto);
		
		int result = 0;
		
		if (Adto == null) { // 로그인 데이터가 없거나 좋아요 데이터가 없을 때
			result = 1;
			this.dao.insertLike(dto);;
			this.dao.insertAlbumLike(dto);;
		} else {  // 좋아요를 이미 눌렀을 때
			result = 0;
			this.dao.deleteLike(dto);
			this.dao.deleteAlbumLike(dto);
		}
		
		return String.valueOf(result);
	}
	
	@RequestMapping("checkAlbumLike.go")
	@ResponseBody
	public String checkAlbumLike(AlbumLikeDTO dto, HttpSession session, HttpServletResponse response) throws Exception {
	
		MemberDTO Mdto = (MemberDTO) session.getAttribute("session");
		
		dto.setMemberNo(Mdto.getMemberNo());
		
		AlbumLikeDTO Adto = this.dao.checkLike(dto);
		
		int result = 0;
		
		if (Adto == null) { // 로그인 데이터가 없거나 좋아요 데이터가 없을 때
			result = 0;
			
		} else {  // 좋아요를 이미 눌렀을 때
			
			result = 1;
		}
		
		return String.valueOf(result);
	}
}
