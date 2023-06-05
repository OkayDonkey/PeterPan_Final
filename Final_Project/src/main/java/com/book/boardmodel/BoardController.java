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
import com.book.model.PageDTO;

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
    public String boardSearch(Model model, @RequestParam(defaultValue = "1") int page, PageDTO pdto) {


        if(pdto.getBoardArea().equals("FAQ")) {
        	
    	   Map<String, String> map = new HashMap<String, String>();

           map.put("keyword", pdto.getKeyword());
           map.put("boardArea", pdto.getBoardArea());

           List<BoardDTO> searchList = this.dao.searchList(map);
           System.out.println("searchList >>> " + searchList);

           model.addAttribute("searchList", searchList);
        	 
            return "board/boardSearch";

        }else {
        	
            int totalCount;

            if(pdto.getKeyword().equals("")) {   
                totalCount = this.dao.getNoticeCount();
                System.out.println("totalCount >>> " +  totalCount);
                
                int rowsize = 10;
                
                PageDTO p = new PageDTO(page, rowsize, totalCount);
        		
        		List<BoardDTO> searchList = dao.noticeList(p);

                int totalEndNo = totalCount - ((page-1) * rowsize);

                model.addAttribute("searchList", searchList);
                model.addAttribute("paging", p).addAttribute("count", totalCount).addAttribute("endNo", totalEndNo);
                
                return "board/boardNoticeSearch";

            }else{
                totalCount = this.dao.KeywordCount(pdto.getKeyword());
                System.out.println("totalCount >>> " +  totalCount);
                
                int rowsize = 10;
                
                PageDTO p = new PageDTO(page, rowsize, pdto.getBoardArea(), totalCount, pdto.getKeyword());
                System.out.println("keyword >>> " +  pdto.getKeyword());
                System.out.println("boardArea >>> " +  pdto.getBoardArea());
                
                System.out.println("p >>" + p);

                List<BoardDTO> searchList = dao.noticeSearchList(p);
                System.out.println("searchList >>> " + searchList);
                
                int totalEndNo = totalCount - ((page-1) * rowsize);

                model.addAttribute("searchList", searchList);
                model.addAttribute("paging", p).addAttribute("count", totalCount).addAttribute("endNo", totalEndNo);
                
                return "board/boardNoticeSearch";

            }
 
        }
    }
	
	@RequestMapping("board_notice.go")
	public String boardNotice(Model model, @RequestParam(defaultValue = "1") int page) {
		
		int rowsize = 10;
		int totalCount = this.dao.getNoticeCount();
	
		PageDTO p = new PageDTO(page, rowsize, totalCount);
		
		List<BoardDTO> noticeList = dao.noticeList(p);
		
		int totalEndNo = totalCount - ((page-1) * rowsize);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("paging", p).addAttribute("count", totalCount).addAttribute("endNo", totalEndNo);
		
		return "board/boardNotice";

	}
	
	@RequestMapping("noticeDetail.go")
	public String noticeDetail(@RequestParam("no") int dno, Model model) {
		
		BoardDTO dto = dao.noticeDetail(dno);
		
		model.addAttribute("dto", dto);
		
		return "board/noticeDetail";
	}
	
	@RequestMapping("notice_write.go")
	public String noticeWrite() {
		return "board/noticeWrite";
	}
	
	

}