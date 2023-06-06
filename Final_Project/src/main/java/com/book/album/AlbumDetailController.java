package com.book.album;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AlbumDetailController {
	
	@Autowired
	private AlbumDAO dao;
	
	@RequestMapping("album_detail.go")
	public String albumDetail(Model model) {
		
		return null;
	}

}
