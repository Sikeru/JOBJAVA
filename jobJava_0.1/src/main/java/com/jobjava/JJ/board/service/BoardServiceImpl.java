package com.jobjava.JJ.board.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jobjava.JJ.board.dao.BoardDAO;
import com.jobjava.JJ.board.vo.QnAVO;

@Service("BoardService")
public class BoardServiceImpl  implements BoardService{
	@Autowired
	private SqlSession sqlSession;
	
	
	public QnAVO qnaSelectAll() {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		QnAVO qnavo = dao.qnaSelectAll();
		return qnavo;
	}
	
}