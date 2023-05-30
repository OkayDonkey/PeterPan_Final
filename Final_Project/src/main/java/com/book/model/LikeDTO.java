package com.book.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LikeDTO {
	
	private boolean likeCheck;
	private int memberNo;
	private int bookNo;
	
}
