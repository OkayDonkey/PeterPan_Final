package com.book.album;

import java.awt.print.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.multi.MultiDesktopPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.bookmodel.plusListDAO;
import com.book.model.AlbumDTO;
import com.book.model.BookDTO;
import com.book.model.MemberDTO;
import com.book.model.PageDTO;

@Controller
public class AlbumController {
	
	@Autowired
	private AlbumDAO dao;
	
	@Autowired
	private plusListDAO pdao;
	
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 5;	
	
	// DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	
	
	@RequestMapping("album.go")
	public String albumList(Model model,HttpServletRequest request) {
		
		// 페이징 처리 작업
		int page;    // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = 
				Integer.parseInt(request.getParameter("page"));
		}else {
			// 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
			page = 1;
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord = 
				this.dao.getAlbumCount();
		
		
			PageDTO pdto = 
					new PageDTO(page, rowsize, totalRecord);
			
			
		List<AlbumDTO> list =
				this.dao.getAlbumList(pdto);
		
		 model.addAttribute("list",list)
			  .addAttribute("Paging",pdto );
		 
		 return "album/albumList";
	}
	
	@RequestMapping("insertalbum.go")
	public String upload(Model model, BookDTO bookDTO, HttpServletRequest request, HttpSession session,AlbumDTO albumDTO) {
		/*
		 * albumInsert(model, bookDTO, request, session, albumDTO ); // 앨범 추가 로직 호출
		 */
		return "album/albumUpload";
	}
	
	@ResponseBody
	@RequestMapping("modal_search.go")
	public List<BookDTO> search(Model model,HttpServletRequest request,@RequestParam("field") String field,
									@RequestParam("keyword") String keyword) {
		// 검색 페이징 처리 작업
		int page;    // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page =  
				Integer.parseInt(request.getParameter("page"));
		}else {
			// 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
			page = 1;
		}
		System.out.println("필드"+field);
		System.out.println("키워드"+keyword);
		//검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업
		//value
		Map<String, String> map = 
						new HashMap<String, String>();
		
		map.put("field",field );
		map.put("keyword", keyword);
		
		
		System.out.println(map);
		
		totalRecord = this.pdao.searchbookCount(map);
		
		System.out.println("키워드 책 수량 >>>"+totalRecord);
		
		PageDTO dto =
					new PageDTO(page, rowsize, totalRecord, field, keyword);
		
		System.out.println("pdto>>"+dto);
		//검색 시 한페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드 호출
		List<BookDTO> searchList = this.pdao.searchbookList(dto);

		System.out.println("keyword+field >>"+dto.getKeyword()+dto.getField());
		
		
		
		model.addAttribute("List",searchList)
			 .addAttribute("Paging", dto);
		
		

		return searchList;				
		}
	
		/*
		 * @RequestMapping("albumInsert.go") public void albumInsert(Model
		 * model,HttpServletRequest request,HttpSession session,BookDTO dto) {
		 * 
		 * 
		 * 
		 * MemberDTO mdto =(MemberDTO) session.getAttribute("session");
		 * 
		 * 
		 * 
		 * dto.setMemberId(mdto.getMemberId());
		 * 
		 * 
		 * this.dao.insertalbumCover(dto);
		 * 
		 * 
		 * return; }
		 */
	
	@ResponseBody
	@RequestMapping("insertBookOk.go")
	public BookDTO insBook(Model model,@RequestParam("bookNo") int bookNo) {
		BookDTO dto = this.dao.getBookAlbum(bookNo);
					
		return dto;
	}
	
	
	@RequestMapping("insertOk.go")
	public void insertOk(Model model, @RequestParam("bookNo") int bookNo ,HttpServletResponse response, @RequestParam("albumTitle") String albumTitle , @RequestParam("albumCont") String albumCont,AlbumDTO dto) throws IOException {
		System.out.println("책번호"+bookNo);
		int check = this.dao.albumInsert(dto);
		
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out =response.getWriter();
		
		if(check>0) {
			out.println("<script>");
			out.println("alert('회원 등록 성공')");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert('회원 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
}
