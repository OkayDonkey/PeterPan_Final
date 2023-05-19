package com.book.memberDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.model.MemberDTO;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDAO loginDao;
	
	@Override
	public int updateMailAuth(MemberDTO memberDto) throws Exception {
		return loginDao.updateMailAuth(memberDto);
	}

	@Override
	public int emailAuthFail(String id) throws Exception {
		return loginDao.emailAuthFail(id);
	}

}
