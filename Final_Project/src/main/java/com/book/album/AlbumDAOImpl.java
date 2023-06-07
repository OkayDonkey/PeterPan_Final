package com.book.album;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.AlbumCommentDTO;
import com.book.model.AlbumDTO;
import com.book.model.AlbumLikeDTO;
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
	public BookDTO getBookAlbum(int bookNo) {
		return this.SqlSession.selectOne("getbook",bookNo);
	}
	
	@Override
	public int albumInsert(AlbumDTO dto) {
		return this.SqlSession.insert("insertOk",dto);
	}
	
	@Override
	public List<AlbumDTO> getAlbumNoList(int no) {
		return this.SqlSession.selectList("albumNoList", no);
	}

	@Override
	public List<AlbumDTO> getTotalAlbum(int albumNo) {
		return this.SqlSession.selectList("totalAlbum", albumNo);
	}

	@Override
	public AlbumLikeDTO checkLike(AlbumLikeDTO dto) {
		 
		return this.SqlSession.selectOne("albumLikeCheck", dto);
	}
	
	@Override
	public int insertLike(AlbumLikeDTO dto) {

		return this.SqlSession.insert("insertAlbumLike", dto );
	}
	
	@Override
	public int deleteLike(AlbumLikeDTO dto) {
	 
		return this.SqlSession.delete("deleteAlbumLike", dto);
	}
	
	@Override
	public int getLikeCount(int num) {
		 
		return this.SqlSession.selectOne("likeCount", num);
	}
	
	@Override
	public List<AlbumCommentDTO> getAlbumComment(int num) {
		 
		return this.SqlSession.selectList("albumCommentList", num);
	}
	
	@Override
	public BookDTO getBookNamealbum(String bookname) {
		return this.SqlSession.selectOne("bookN",bookname);
	}
	@Override
	public void albumbookins1(Map<String, Object> map1) {
		this.SqlSession.insert("bookDetailIns1",map1);
	}
	@Override
	public void albumbookins2(Map<String, Object> map2) {
		this.SqlSession.insert("bookDetailIns2",map2);
	}
	
	@Override
	public void albumbookins3(Map<String, Object> map3) {
		this.SqlSession.insert("bookDetailIns3",map3);	
	}
	
	@Override
	public void albumbookins4(Map<String, Object> map4) {
		this.SqlSession.insert("bookDetailIns4",map4);	
	}
	
	
	@Override
	public int albumNumberCount(BookDTO bdto) {
		return this.SqlSession.selectOne("numberCount", bdto);
	}
}
