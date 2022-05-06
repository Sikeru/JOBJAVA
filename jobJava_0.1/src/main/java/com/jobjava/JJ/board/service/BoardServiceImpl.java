package com.jobjava.JJ.board.service;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobjava.JJ.board.dao.BoardDAO;
import com.jobjava.JJ.board.vo.QnAVO;

@Service("BoardService")
public class BoardServiceImpl  implements BoardService{
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<QnAVO> qnaSelectAll() {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<QnAVO> qnavo = new ArrayList<QnAVO>();
		qnavo = dao.qnaSelectAll();
		return qnavo;
	}

	@Override
	public void insertQnATable(QnAVO qnAVO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.insertQnATable(qnAVO);	
	}

	@Override
	public QnAVO qnaSelectOne(int _QNA_NO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.qnaSelectOne(_QNA_NO);
	}

	@Override
	public void upDateQnATable(QnAVO qnAVO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.upDateQnATable(qnAVO);
	}
	
}