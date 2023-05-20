package com.book.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReviewDTO {
	
	private int reviewNo;
	private String reviewCont;
	private String reviewTitle;
	private String reviewFile;
	private String reviewRegdate;
	private int bookNo;

}
