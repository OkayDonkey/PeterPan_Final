package com.book.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReviewDTO {
	
	private int reviewNo;
	private int bookNo;
	private int memberNo;
	private String reviewTitle;
	private String reviewCont;
	private String reviewFile;
	private String reviewRegdate;
	private String memberId;

}
