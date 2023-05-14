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
	private String memberEmail;
	private int memberBirth;
	private String memberGender;
	private String memberTier;
	private String token;
	
	// 주소 관련
	private String addrPost;
	private String addrMain;
	private String addrDetail;
}
