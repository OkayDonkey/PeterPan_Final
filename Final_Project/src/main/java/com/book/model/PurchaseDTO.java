package com.book.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseDTO {
	
	private String purchaseNo;
	private String memberId;
	private int bookNo;
	private int bookEA;
	
	// 구매내역 보기 위한 정보
	private String bookName;
	private String bookPrice;
	private String bookCover;
	
}
