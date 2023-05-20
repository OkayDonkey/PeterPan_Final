package com.book.boardmodel;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.model.BookDTO;

@Controller
public class BoardController {
	
	@Inject
	private BoardDAO dao;
	
	@RequestMapping("boardPage.go")
	public String mainPage() {
		
		/*
		 * List<BookDTO> mainList = this.dao.getBoardMainList();
		 * 
		 * model.addAttribute("mainList", mainList);
		 */
		return "board/boardPage";
		
	}

}
