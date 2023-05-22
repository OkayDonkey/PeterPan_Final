package com.book.memberDAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.MemberDTO;

@Repository
public class JoinDAOImpl implements JoinDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 회원가입 처리
	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		return this.sqlSession.insert("generalJoin", memberDTO);
	}

	@Override
	public int checkId(String id) {
		return this.sqlSession.selectOne("checkId", id);
	}

	@Override
	public int updateMailKey(MemberDTO memberDto) throws Exception {
		return sqlSession.update("updateMailKey", memberDto);
	}

	@Override
	public int checkEmail(String email) {
		return sqlSession.selectOne("checkEmail", email);
	}

	@Override
	public int checkIfAlreadyJoined(MemberDTO dto) {
		return sqlSession.selectOne("checkPhone", dto);
	}

	@Override
	public MemberDTO getmemberonelist(String phone) {
		return sqlSession.selectOne("getmemberone", phone);
	}

}
