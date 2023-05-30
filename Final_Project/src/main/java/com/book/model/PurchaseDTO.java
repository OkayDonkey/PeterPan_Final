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
	
}
