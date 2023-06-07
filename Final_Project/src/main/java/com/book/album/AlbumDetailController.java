package com.book.album;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.model.AlbumCommentDTO;
import com.book.model.AlbumDTO;

@Controller
public class AlbumDetailController {
	
	@Autowired
	private AlbumDAO dao;
	
	@RequestMapping("album_detail.go")
	public String albumDetail(Model model) {
		
		return "album/albumDetail";
	}
	
	@RequestMapping("albumDetailTest.go")
	public String albumDetailTest(Model model) {
		
		// 앨범 정보를 번호로 조회하는 메서드
		List<AlbumDTO> list = this.dao.getAlbumNoList(1);
		
		// 좋아요를 앨범 번호로 가져오는 메서드
		int likeCount = this.dao.getLikeCount(1);
		
		// 앨범 댓글을 앨범 번호로 가져오는 메서드
		List<AlbumCommentDTO> commentList = this.dao.getAlbumComment(1);
		
		System.out.println("앨범 리스트 구성요소 :" + list);
		System.out.println("해당 앨범 좋아요 갯수 :" + likeCount);
		System.out.println("해당 앨범 댓글 정보 :" + commentList);
		
		model.addAttribute("albumList",list);
		model.addAttribute("likeCount",likeCount);
		model.addAttribute("commentList",commentList);
		
		return "album/albumDetail";
	}

}

