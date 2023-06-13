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
	
	// qna 답변 관련
	private String content;
	private String regdate;
	private String memberName;
}
