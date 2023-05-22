package com.book.bookmodel;

import java.util.List;

import com.book.model.DibsDTO;

public interface DibDAO {
	
	DibsDTO checkDibs(DibsDTO DDto);
	
	int insertDibs(DibsDTO DDto);
	
	int deleteDibs(DibsDTO DDto);
}
