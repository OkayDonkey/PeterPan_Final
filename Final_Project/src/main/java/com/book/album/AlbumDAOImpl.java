package com.book.album;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.AlbumDTO;
import com.book.model.BookDTO;
import com.book.model.PageDTO;

@Repository
public class AlbumDAOImpl implements AlbumDAO{
	
	@Autowired
	private SqlSessionTemplate SqlSession;
	
	@Override
	public int getAlbumCount() {
		return this.SqlSession.selectOne("albumAll");
	}
	
	@Override
	public List<AlbumDTO> getAlbumList(PageDTO pdto) {
		return this.SqlSession.selectList("albumList",pdto);
	}
	
	@Override
	public int insertalbumCover(BookDTO dto) {
		return this.SqlSession.insert("albumIns", dto);
				
	}
	
	@Override
	public List<AlbumDTO> getalbum() {
		return this.SqlSession.selectList("alist");
	}

}
