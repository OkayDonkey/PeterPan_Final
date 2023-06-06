package com.book.album;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		List<AlbumDTO> list = this.dao.getAlbumNoList(1);
		
		model.addAttribute("albumList",list);
		
		return "album/albumDetail";
	}

}

