package com.book.boardmodel;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.model.BoardDTO;
import com.book.model.MemberDTO;

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
		
		System.out.println(category);
		
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
	public void boardQna(HttpSession session, HttpServletResponse response) throws Exception {
		
		MemberDTO memberdto = (MemberDTO) session.getAttribute("session");
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(memberdto != null) {
			out.println("<script>");
			out.println("location.href='boardQna_go.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('로그인 후 가능합니다.')");
			out.println("location.href='login.go'");
			out.println("</script>");
		}
	}
	
	@RequestMapping("boardQna_go.go")
	public String boardQnaGo() {
		
		return "board/qnaForm";
	}
	
	@RequestMapping("boardArs.go")
	public String boardArs() {
		return "board/ars";
	}
	
	@Autowired
	private Upload upload;
	
	@RequestMapping("upload.do")
	public String upload() {
		return "board/qnaForm";
	}
	
	@RequestMapping("board_search.go")
	public String boardSearch(@RequestParam("keyword") String keyword, @RequestParam("boardArea") String boardArea, Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", keyword);
		map.put("boardArea", boardArea);
		
		System.out.println("map >>> " + map);

		List<BoardDTO> searchList = this.dao.searchList(map);
		
		System.out.println("searchList >>> " + searchList);
		
		model.addAttribute("searchList", searchList);
		
		return "board/boardSearch";
		
	}
	
	@RequestMapping("board_notice.go")
	public String boardNotice() {
		return "board/boardNotice";
	}


}