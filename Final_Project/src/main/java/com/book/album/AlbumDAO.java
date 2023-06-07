package com.book.album;

import java.util.List;
import java.util.Map;

import com.book.model.AlbumCommentDTO;
import com.book.model.AlbumDTO;
import com.book.model.AlbumLikeDTO;
import com.book.model.BookDTO;
import com.book.model.DibsDTO;
import com.book.model.PageDTO;

public interface AlbumDAO {

	int getAlbumCount();

	List<AlbumDTO> getAlbumList(PageDTO pdto);

	int insertalbumCover(BookDTO dto);

	BookDTO getBookAlbum(int bookNo);

	int albumInsert(AlbumDTO dto);
	
	/*
	 * List<AlbumDTO> getalbum();
	 */	
	
	List<AlbumDTO> getAlbumNoList(int no);

	AlbumLikeDTO checkLike(AlbumLikeDTO dto);

	int insertLike(AlbumLikeDTO dto);

	int deleteLike(AlbumLikeDTO dto);

	int getLikeCount(int num);

	List<AlbumCommentDTO> getAlbumComment(int num);
	
	

	List<AlbumDTO> getTotalAlbum(int albumNo);

	//책의 이름을 가지고 책정보(책번호)를 뽑는 함수
	BookDTO getBookNamealbum(String bookname1);


	
	int albumNumberCount(BookDTO bdto);


	
	void albumbookins1(Map<String, Object> map1);

	void albumbookins2(Map<String, Object> map2);

	void albumbookins3(Map<String, Object> map3);
	
	void albumbookins4(Map<String, Object> map4);

}
