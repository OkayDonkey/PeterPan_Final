package com.book.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.bookmodel.plusListDAO;
import com.book.model.BookDTO;
import com.book.model.CartDTO;
import com.book.model.PageDTO;

@Controller
public class plusListController {

	@Inject
	private plusListDAO dao;
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 5;
	
	// DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	
	@RequestMapping("kr_list")
	public String krlist(Model model, HttpServletRequest request,BookDTO bdto) {
	
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
		totalRecord = this.dao.getListCount();
		
		PageDTO pdto = new PageDTO(page, rowsize, totalRecord);
		
		pdto.setCategory(bdto.getBookCategory());
			
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<BookDTO> list = this.dao.getplusList(pdto);
		
		model.addAttribute("List", list).
		      addAttribute("Paging", pdto);
		
		return "plusList/plusList";
	}
			
	@RequestMapping("tolist.go")
	public String tList(HttpServletRequest request ,Model model,BookDTO bdto) {
		
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
		totalRecord = this.dao.getListCategory(bdto.getBookCategory());
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
			
		dto.setCategory(bdto.getBookCategory());

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<BookDTO>list = this.dao.toList(dto);
		
		model.addAttribute("List", list)
		     .addAttribute("Paging", dto)
		     .addAttribute("totalnum", totalRecord)
		     .addAttribute("bookCategory",dto.getCategory());
		
		return "plusList/plusList";
		
	}
	
	
	
	//장르,카테고리 탭 메서드 
	@RequestMapping("genreList.go")
	public String genre(Model model,HttpServletRequest request,BookDTO bdto) {
		
		int page;
		
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}else {
			page= 1;
		}
		
		Map<String, String> map =new HashMap<String, String>();
		
		map.put("Genre",bdto.getBookGenre());
		map.put("Category",bdto.getBookCategory());
		
		totalRecord=this.dao.genreList(map);
		
		PageDTO dto = 
				new PageDTO(page, rowsize, totalRecord);

		dto.setCategory(bdto.getBookCategory());
	    dto.setGenre(bdto.getBookGenre());
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
			
		List<BookDTO>list = this.dao.genList(dto);
		
	
		System.out.println("list>>>>"+list);	
	
		model.addAttribute("List", list)
		      .addAttribute("Paging", dto)		
			 .addAttribute("category",dto.getCategory())		
			 .addAttribute("totalnum",dto.getTotalRecord())		
			 .addAttribute("genre", dto.getGenre());		
			
		return "plusList/genreList";
	}
	
	@RequestMapping("total_main_search.go")
	public String search(Model model,HttpServletRequest request,@RequestParam("field") String field,
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

		//검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업
		//value
		Map<String, String> map = 
						new HashMap<String, String>();
		
		map.put("field",field );
		map.put("keyword", keyword);
		
		totalRecord = this.dao.searchbookCount(map);
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord, field, keyword);
		
		//검색 시 한페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드 호출
		List<BookDTO> searchList = this.dao.searchbookList(dto);

		model.addAttribute("searchPageList",searchList)
			 .addAttribute("Paging", dto)
			 .addAttribute("stotal", totalRecord);
		
		return "plusList/book_search_list";				
		}
	
		@RequestMapping("bestListbook.go")
		public String bestList(Model model,HttpServletRequest request,CartDTO cdto,BookDTO bdto) {
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
			totalRecord = this.dao.BestCount ();
			
			PageDTO pdto = new PageDTO(page, rowsize, totalRecord);
				
			// 페이지에 해당하는 게시물을 가져오는 메서드 호출
			List<BookDTO> list = this.dao.getbestList(pdto);
			
			cdto.setCartCount(bdto.getBookNo());
			
			model.addAttribute("List", list)
			      .addAttribute("Paging", pdto)
			      .addAttribute("total", totalRecord)
			      .addAttribute("cartC", cdto.getCartCount());
			
			return "plusList/bestList";	
		}
		
		@RequestMapping("newbook.go")
		public String newbook(Model model,HttpServletRequest request) {
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
			totalRecord = this.dao.newCount();
			
			PageDTO pdto = new PageDTO(page, rowsize, totalRecord);
				
			// 페이지에 해당하는 게시물을 가져오는 메서드 호출
			List<BookDTO> list = this.dao.newbook(pdto);
			
			model.addAttribute("List", list).
			      addAttribute("Paging", pdto)
				  .addAttribute("totalR", totalRecord);
			
			return "plusList/newList";	
		}
	}
 