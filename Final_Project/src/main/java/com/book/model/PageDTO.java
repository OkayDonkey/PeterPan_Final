package com.book.model;

import java.util.Map;

import org.aspectj.lang.annotation.DeclareAnnotation;

import lombok.Data;
import lombok.NoArgsConstructor;

//페이징 처리 작업 시 작업할 내용을 설정하는 객체

@Data
@NoArgsConstructor

public class PageDTO {

	// 페이징 처리 관련 멤버 선언
	private int page;         // 현재 페이지
	private int rowsize;      // 한 페이지당 보여질 게시물의 수
	private int totalRecord;  // DB 상의 테이블 전체 게시물 수
	private int startNo;      // 해당 페이지에서 시작 번호
	private int endNo;        // 해당 페이지에서 끝 번호
	private int startBlock;   // 해당 페이지의 시작 블럭
	private int endBlock;     // 해당 페이지의 끝 블럭
	private int allPage;      // 전체 페이지 수
	private int block = 5;    // 아래에 보여질 최대 페이지 수
	
	private String boardArea; // board 테이블
	
	
	//검색 관련 멤버 선언
	private String field;
	private String keyword; 
	
	//여여러정보를 받기 위한 변수 선언
	
	private String Category;
	private String Genre;
	
	// 일반적인 페이징 처리 인자 생성자
	public PageDTO(int page, int rowsize, int totalRecord) {
		this.page = page;
		this.rowsize = rowsize;
		this.totalRecord = totalRecord;

		
		// 해당 페이지에서 시작 번호
		this.startNo = (this.page * this.rowsize)
						- (this.rowsize - 1);
		
		// 해당 페이지에서 끝 번호
		this.endNo = (this.page * this.rowsize);
		
		// 해당 페이지에서 시작 블럭
		this.startBlock = 
				(((this.page - 1) / this.block) * this.block) + 1;
		
		// 해당 페이지에서 마지막 블럭
		this.endBlock = 
				(((this.page - 1) / this.block) * this.block) + this.block;
		
		// 전체 페이지 수 얻어오는 과정
		this.allPage = 
				(int)Math.ceil(this.totalRecord / (double)this.rowsize);
		
		if(this.endBlock > this.allPage) {
			this.endBlock = this.allPage;
		}
	}  // 인자 생성자
	
	
	
	// 일반적인 페이징 처리 인자 생성자(검색관련 인자 포함)
	public PageDTO(int page, int rowsize, int totalRecord,String field,String keyword) {
		
		this(page,rowsize,totalRecord);   //위 3개짜리 인자생성자 호출 
		
		this.field = field;
		
		this.keyword = keyword;
		
	}  // 인자 생성자
	
	// board에 필요한 페이징 처리 인자 생성자(검색관련 인자 포함)
	public PageDTO(int page, int rowsize, String boardArea, int totalRecord,String keyword) {
		
		this(page,rowsize,totalRecord);   //위 3개짜리 인자생성자 호출 
		
		this.boardArea = boardArea;
		
		this.keyword = keyword;
		
	}  // 인자 생성자
	
	
}
