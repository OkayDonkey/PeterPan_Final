package com.book.memberDAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.LoginDTO;
import com.book.model.MemberDTO;

@Repository
public class LoginDAOImpl implements LoginDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public MemberDTO generalLogin(LoginDTO dto) {
		return sqlSession.selectOne("generalLogin", dto);
	}

	@Override
	public int updateMailAuth(MemberDTO memberDto) throws Exception {
		return sqlSession.update("updateMailAuth", memberDto);
	}

	@Override
	public int emailAuthFail(String id) throws Exception {
		return sqlSession.selectOne("emailAuthFail", id);
	}

	@Override
	public int checkLoginStatus(String email) {
		return sqlSession.selectOne("snsLogincheck", email);
	}

	@Override
	public MemberDTO SNSLogin(String email) {
		return sqlSession.selectOne("snsLogin", email);
	}
}
