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

}
