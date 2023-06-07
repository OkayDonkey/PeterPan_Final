package com.book.album;

import java.util.List;

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
	
	/*
	 * @Override public List<AlbumDTO> getalbum() { return
	 * this.SqlSession.selectList("alist"); }
	 */
	

}
