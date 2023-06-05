package com.book.membermodel;

import java.util.List;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.CouponDTO;
import com.book.model.MemberDTO;
import com.book.model.PurchaseDTO;

public interface MypageDAO {

	List<BookDTO> getRecommendbookRandom();

	int memberInfoModify(MemberDTO dto);

	int memberdelete(MemberDTO dto);

	List<PurchaseDTO> purchasList(String memberId);

	List<BoardDTO> qnaList(int memberNo);

	List<BoardDTO> noAnswerqnaList(int memberNo);

	List<BoardDTO> answerOkqnaList(int memberNo);

	List<CouponDTO> getcoupon(String memberId);

}
