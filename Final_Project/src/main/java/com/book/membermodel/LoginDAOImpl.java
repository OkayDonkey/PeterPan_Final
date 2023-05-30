package com.book.membermodel;

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

	@Override
	public int phoneSearchGetId(MemberDTO dto) {
		return sqlSession.selectOne("phoneSearchgetIdCheck", dto);
	}

	@Override
	public int emailSearchGetId(MemberDTO dto) {
		return sqlSession.selectOne("emailSearchgetIdCheck", dto);
	}

	@Override
	public MemberDTO getmemberonelist(String memberEmail) {
		return sqlSession.selectOne("getmemberonelistbyemail", memberEmail);
	}

	@Override
	public int phoneSearchGetPwd(MemberDTO dto) {
		return sqlSession.selectOne("phoneSearchGetPwdCheck", dto);
	}
	
	@Override
	public int emailSearchGetPwd(MemberDTO dto) {
		return sqlSession.selectOne("emailSearchGetPwdCheck", dto);
	}

	@Override
	public MemberDTO getmemberonelistbyId(String memberId) {
		return sqlSession.selectOne("getmemberonelistbyId", memberId);
	}

	@Override
	public void pwdReset(MemberDTO dto) {
		sqlSession.update("pwdReset", dto);
	}

}
