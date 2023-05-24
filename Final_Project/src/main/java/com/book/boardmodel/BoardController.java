package com.book.boardmodel;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;


@Controller
public class BoardController {
	
	@Inject
	private BoardDAO dao;
	
	@RequestMapping("boardPage.go")
	public String mainPage() {
		return "board/boardPage";
	}
	
	@RequestMapping("boardFAQ.go")
	public String mainBest() {
		return "board/boardFAQ";
	}
	
	@RequestMapping("getCategoryList.go")
	@ResponseBody
	public List<BoardDTO> categoryList(@RequestParam("category") String category) {
		
		System.out.println(category);
		
		if(category.equals("BEST 10") || category.equals("자주 묻는 질문")) {
			List<BoardDTO> list = this.dao.getbest10List();
			System.out.println(list);
			return list;
		} else {
			List<BoardDTO> list = this.dao.getcategoryList(category);
			return list;
		}
	}

}
