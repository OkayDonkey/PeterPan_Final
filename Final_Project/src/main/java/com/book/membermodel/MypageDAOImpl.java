package com.book.membermodel;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.book.model.BoardDTO;
import com.book.model.BookDTO;
import com.book.model.MemberDTO;
import com.book.model.PurchaseDTO;

@Repository
public class MypageDAOImpl implements MypageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BookDTO> getRecommendbookRandom() {
		return this.sqlSession.selectList("RecommendbookRandom");
	}

	@Override
	public int memberInfoModify(MemberDTO dto) {
		return this.sqlSession.update("memberInfoModify", dto);
	}

	@Override
	public int memberdelete(MemberDTO dto) {
		return this.sqlSession.delete("memberdelete", dto);
	}

	@Override
	public List<PurchaseDTO> purchasList(String memberId) {
		return this.sqlSession.selectList("purchasList", memberId);
	}

	@Override
	public List<BoardDTO> qnaList(int memberNo) {
		return this.sqlSession.selectList("totalqnaList", memberNo);
	}

	@Override
	public List<BoardDTO> noAnswerqnaList(int memberNo) {
		return this.sqlSession.selectList("qnaListnoanswer", memberNo);
	}

	@Override
	public List<BoardDTO> answerOkqnaList(int memberNo) {
		return this.sqlSession.selectList("qnaListanswerok", memberNo);
	}

}
