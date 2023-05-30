package com.book.boardmodel;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	@RequestMapping("upload_ok.do")
	public String uploadOk(Model model, MultipartHttpServletRequest mRequest) {
	
		if(this.upload.fileUpload(mRequest) ) {
			model.addAttribute("result", "파일 업로드 성공");
			}else {
				model.addAttribute("result", "파일 업로드 실패");
		}
		return "board/boardPage";
	}
	


}