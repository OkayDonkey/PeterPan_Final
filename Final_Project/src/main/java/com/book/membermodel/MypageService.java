package com.book.membermodel;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.MemberDTO;
import com.book.model.PurchaseDTO;

public interface MypageService {

	List<BookDTO> getRecommendbookRandom();

	String sendEmail(String email, HttpSession session) throws Exception;

	int memberInfoModify(MemberDTO dto);

	int memberdelete(MemberDTO dto);

	List<PurchaseDTO> purchaseList(String memberId);

	List<BoardDTO> qnaList(int memberId);

	List<BoardDTO> noAnswerqnaList(int memberNo);

	List<BoardDTO> answerOkqnaList(int memberNo);

}
