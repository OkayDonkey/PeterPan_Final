package com.book.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlbumDTO {

	private int albumNo;
	private	String memberId;
	private	String albumTitle;
	private	String bookCover;
	private	String albumCont;
	private	String albumSysdate;

	
}
