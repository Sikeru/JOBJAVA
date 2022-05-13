package com.jobjava.JJ.board.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jobjava.JJ.board.dao.BoardDAO;
import com.jobjava.JJ.board.vo.QnAVO;

@Service("BoardService")
@Transactional(propagation=Propagation.REQUIRED)
public class BoardServiceImpl  implements BoardService{
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<QnAVO> qnaSelectAll(HashMap<String, Integer> paging) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<QnAVO> qnavo = new ArrayList<QnAVO>();
		qnavo = dao.qnaSelectAll(paging);
		return qnavo;
	}

	@Override
	public int qnaTotalTable() {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.qnaTotalTable();
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
		if(qnAVO.getANSWER() != null) {
			qnAVO.setRESPON(dao.selectEmpName(qnAVO));
		}
		dao.upDateQnATable(qnAVO);
	}

	@Override
	public List<QnAVO> qnaSelectSearch(HashMap<String, Object> search) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<QnAVO> qnavo = new ArrayList<QnAVO>();
		qnavo = dao.qnaSelectSearch(search);
		return qnavo;
	}

	@Override
	public int qnaSelectTotalSearch(HashMap<String, Object> search) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.qnaSelectTotalSearch(search);
	}	

}