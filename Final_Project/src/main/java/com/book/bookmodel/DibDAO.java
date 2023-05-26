package com.book.bookmodel;

import com.book.model.DibsDTO;

public interface DibDAO {
	
	DibsDTO checkDibs(DibsDTO DDto);
	
	int insertDibs(DibsDTO DDto);
	
	int deleteDibs(DibsDTO DDto);
}
