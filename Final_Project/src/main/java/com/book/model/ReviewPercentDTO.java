package com.book.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewPercentDTO {
	
	private int like_count;
	private int review_count;
	private double like_percentage;
	
}
