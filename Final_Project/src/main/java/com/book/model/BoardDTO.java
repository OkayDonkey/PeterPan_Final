package com.book.model;

import lombok.Data;

@Data
public class BoardDTO {
	private int boardNO;
	private int memberNo;
	private String boardArea;
	private String boardCategory;
	private String boardTitle;
	private String boardContent;
	private String boardFile;
	private String boardRegdate;
	private int boardHit;
}
