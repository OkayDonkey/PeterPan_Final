package com.book.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class AlbumDTO {

	private int albumDetailNo;
	private int albumNo;
	private int bookNo;
	private int memberNo;
	
	private	String memberName; // 디테일
	private	String albumTitle;
	private	String albumCont;
	private	String albumSysDate;
	private	String bookName;
	private	String bookPrice;
	private	String bookGenre;
	private	String bookWriter;
	private	String bookTrans;
	private	String bookRelDate;
	private	String bookCont;
	private	String bookLike;
	private	String bookCategory;
	private	String bookCover;
	private	String bookImg1;
	private	String bookImg2;
	private	String bookImg3;
	private	String bookImg4;
	private	String bookWeekBest;
	
}
