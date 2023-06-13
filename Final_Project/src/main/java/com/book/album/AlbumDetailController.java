package com.book.album;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.bookmodel.CartDAO;
import com.book.model.AlbumCommentDTO;
import com.book.model.AlbumDTO;
import com.book.model.BookDTO;
import com.book.model.CartDTO;
import com.book.model.MemberDTO;

@Controller
public class AlbumDetailController {
	
	@Autowired
	private AlbumDAO dao;
	
	@Autowired
	private CartDAO Cdao;
	
	@RequestMapping("album_detail.go")
	public String albumDetail(Model model, @RequestParam("albumNo") int albumNo) {
		
		// 앨범 정보를 번호로 조회하는 메서드
		List<AlbumDTO> list = this.dao.getAlbumNoList(albumNo);
		
		// 좋아요를 앨범 번호로 가져오는 메서드
		int likeCount = this.dao.getLikeCount(albumNo);
		
		// 앨범 댓글을 앨범 번호로 가져오는 메서드
		List<AlbumCommentDTO> commentList = this.dao.getAlbumComment(albumNo);
		
		model.addAttribute("albumList",list);
		model.addAttribute("likeCount",likeCount);
		model.addAttribute("commentList",commentList);
		
		return "album/albumDetail";
	}
	
	@RequestMapping("commentInsert.go")
	@ResponseBody
	public List<AlbumCommentDTO> insertComment(Model model, AlbumCommentDTO aDto) {
		
		int result = this.dao.insertComment(aDto);

		if (result > 0) {
		        
		        List<AlbumCommentDTO> commentList = this.dao.getAlbumComment(aDto.getAlbumNo());
		       
		        return commentList;
		        
		    } else {
		    	return null;
	    }
		
	}

	@ResponseBody
	@RequestMapping("albumBookCart.go")
	public String albumBookCart(Model model,CartDTO dto, HttpSession session,BookDTO bdto) throws IOException {
		
		MemberDTO mdto = (MemberDTO)session.getAttribute("session");
		
		if(mdto.getMemberId() == null || dto.getMemberId().equals("")) {
			return "1";
		} else{
			
			int check = Cdao.getCartCkeck(dto);
			
			if(check == 0) {
				this.Cdao.insertCart(dto);
				return "2";
			}else {
				this.Cdao.cartIf(dto);
				return "3";
			} 
		}
	}
	
}

