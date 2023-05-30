package com.book.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardCommentDTO {
	private int comNo;
	private int boardNo;
	private int memberNo;
	private String brContent;
	private String brRegdate;
	
}
