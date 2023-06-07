package com.book.album;

import java.util.List;

import com.book.model.AlbumDTO;
import com.book.model.BookDTO;
import com.book.model.PageDTO;

public interface AlbumDAO {

	int getAlbumCount();

	List<AlbumDTO> getAlbumList(PageDTO pdto);

	int insertalbumCover(BookDTO dto);

	BookDTO getBookAlbum(int bookNo);

	int albumInsert(AlbumDTO dto);

}
