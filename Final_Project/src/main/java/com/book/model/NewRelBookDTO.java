package com.book.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NewRelBookDTO {
	
	private int bookNo;
	private String bookName;
	private int bookPrice;
	private String bookGenre;
	private String bookWriter;
	private String bookCategory;
	private String bookCover;
	
}
