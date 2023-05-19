package com.book.model;

import lombok.Data;

@Data
public class BoardDTO {
	private int boardNO;
	private String boardTitle;
	private String boardHead;
	private int boardHit;
	private String boardRegdate;
	private String boardFile;
	private String boardContent;
	private String boardArea;
	private int memberNo;
}
