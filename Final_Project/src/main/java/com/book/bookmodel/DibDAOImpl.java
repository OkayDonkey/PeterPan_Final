package com.book.bookmodel;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.DibsDTO;

@Repository
public class DibDAOImpl implements DibDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public DibsDTO checkDibs(DibsDTO DDto) {

		return this.sqlSession.selectOne("DibCheck", DDto);
	}
	
	@Override
	public int insertDibs(DibsDTO DDto) {
		// TODO Auto-generated method stub
		return this.sqlSession.insert("insertDib",DDto);
	}
	
	@Override
	public int deleteDibs(DibsDTO DDto) {
		// TODO Auto-generated method stub
		return this.sqlSession.delete("deleteDib",DDto);
	}
}	
