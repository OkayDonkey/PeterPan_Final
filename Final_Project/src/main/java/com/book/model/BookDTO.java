package com.book.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookDTO {

	private int bookNo;
	private String bookName;
	private int bookPrice;
	private String bookGenre;
	private String bookWriter;
	private String bookTrans;
	private String bookRelDate;
	private String bookCont;
	private int bookLike;
	private String bookCategory;
	private String bookCover;
	private String bookImg1;
	private String bookImg2;
	private String bookImg3;
	private String bookImg4;
	private int bookWeekBest;
	
	private String memberId;

}