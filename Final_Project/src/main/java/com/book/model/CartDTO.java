package com.book.model;

import lombok.NoArgsConstructor;

import lombok.AllArgsConstructor;

import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class CartDTO {
	private int bookNo;
	private String memberId;
	private int cartNo;
	private int cartCount;
	
	private String bookName;
	private String bookCover;
	private int bookPrice;
	private int totalPrice;
	
}
