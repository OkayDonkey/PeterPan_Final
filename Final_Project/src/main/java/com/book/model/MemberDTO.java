package com.book.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MemberDTO {
	private int memberNo; 
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberPhone;
	private String memberAddr;
	private String memberTier;
	private String token;
}
