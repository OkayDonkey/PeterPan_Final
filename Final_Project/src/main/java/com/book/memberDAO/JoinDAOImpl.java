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
	public void join(MemberDTO memberDTO) throws Exception {
		this.sqlSession.insert("join", memberDTO);
	}

}
