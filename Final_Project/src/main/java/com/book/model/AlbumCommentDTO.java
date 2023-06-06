package com.book.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AlbumCommentDTO {

	private int albumNo;
	private int memberNo;
	private String memberId;
	private String comment;
	private String commentDate;
	private int commentNo;
	
}
