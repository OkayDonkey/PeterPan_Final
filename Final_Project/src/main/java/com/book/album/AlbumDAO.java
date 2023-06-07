package com.book.album;

import java.util.List;

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
	
	/* List<AlbumDTO> getalbum(); */
	
	List<AlbumDTO> getAlbumNoList(int no);

	AlbumLikeDTO checkLike(AlbumLikeDTO dto);

	int insertLike(AlbumLikeDTO dto);

	int deleteLike(AlbumLikeDTO dto);

	int getLikeCount(int num);

	List<AlbumCommentDTO> getAlbumComment(int num);
	
	List<AlbumDTO> getTotalAlbum(int albumNo);


}
