package com.book.album;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.model.AlbumCommentDTO;
import com.book.model.AlbumDTO;
import com.book.model.ReviewDTO;

@Controller
public class AlbumDetailController {
	
	@Autowired
	private AlbumDAO dao;
	
	@RequestMapping("album_detail.go")
	public String albumDetail(Model model, @RequestParam("albumNo") int albumNo) {
		
		// 앨범 정보를 번호로 조회하는 메서드
		List<AlbumDTO> list = this.dao.getAlbumNoList(albumNo);
		
		// 좋아요를 앨범 번호로 가져오는 메서드
		int likeCount = this.dao.getLikeCount(albumNo);
		
		// 앨범 댓글을 앨범 번호로 가져오는 메서드
		List<AlbumCommentDTO> commentList = this.dao.getAlbumComment(albumNo);
		
		System.out.println("앨범 리스트 구성요소 :" + list);
		System.out.println("해당 앨범 좋아요 갯수 :" + likeCount);
		System.out.println("해당 앨범 댓글 정보 :" + commentList);
		
		model.addAttribute("albumList",list);
		model.addAttribute("likeCount",likeCount);
		model.addAttribute("commentList",commentList);
		
		return "album/albumDetail";
	}
	
	@RequestMapping("commentInsert.go")
	@ResponseBody
	public List<AlbumCommentDTO> insertComment(Model model, AlbumCommentDTO aDto) {
		
		System.out.println("insertReview 컨트롤러 진입");
		 
		int result = this.dao.insertComment(aDto);

		if (result > 0) {
		        
		        System.out.println("댓글 등록완료: " + result);
		        List<AlbumCommentDTO> commentList = this.dao.getAlbumComment(aDto.getAlbumNo());
		        System.out.println("댓글 로딩 책번호: " + aDto.getAlbumNo());
		        System.out.println("댓글 정보: " + commentList);
		       
		        return commentList;
		        
		    } else {
		    	
		    	return null;
		    	
		    }
		
	}

	
	
	
	
	
}

