package com.book.model;

import lombok.Data;

@Data
public class LoginDTO {

	private String memberId;
	private String memberPwd;
	private boolean useCookie;
	
}
