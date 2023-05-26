package com.book.boardmodel;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.model.BoardDTO;

@Controller
public class BoardController {

	@Inject
	private BoardDAO dao;

	@RequestMapping("boardPage.go")
	public String mainPage() {
		return "board/boardPage";
	}

	@RequestMapping("boardFAQ.go")
	public String mainBest(HttpServletRequest request, Model model) {

		String category = request.getParameter("category");

		model.addAttribute("category", category);

		return "board/boardFAQ";
	}

	@RequestMapping("getCategoryList.go")
	@ResponseBody
	public Map<String, Object> categoryList(@RequestParam("category") String category, BoardDTO dto) {
		Map<String, Object> maplist = new HashMap<String, Object>();

		System.out.println(category);
		List<BoardDTO> list = null;

		if (category.equals("BEST 10") || category.equals("자주 묻는 질문")) {
			list = this.dao.getbest10List();
		} else {
			list = this.dao.getcategoryList(category);
		}
		maplist.put("list", list);
		maplist.put("category", category);

		return maplist;
	}

	@RequestMapping("boardQna.go")
	public String boardQna() {
		return "board/qnaForm";
	}
	
	@RequestMapping("board_qna_ok.go")
	public void qnaOk(BoardDTO dto, HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertQna(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('접수 성공!!!')");
			out.println("location.href='boardQna.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('접수 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	
	
	


}