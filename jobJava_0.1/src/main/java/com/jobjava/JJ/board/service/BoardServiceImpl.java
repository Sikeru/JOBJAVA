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
import com.jobjava.JJ.board.vo.EmploymentVO;
import com.jobjava.JJ.board.vo.OnlineVO;
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
	public void qnADeleteTable(int QNA_NO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.qnADeleteTable(QNA_NO);
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

	@Override
	public List<OnlineVO> onlineSelectAll(HashMap<String, Integer> paging) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<OnlineVO> qnavo = new ArrayList<OnlineVO>();
		qnavo = dao.onlineSelectAll(paging);
		return qnavo;
	}

	@Override
	public int onlineTotalTable() {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.onlineTotalTable();
	}

	@Override
	public void insertOnlineTable(OnlineVO onlineVO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.insertOnlineTable(onlineVO);
	}

	@Override
	public OnlineVO onlineSelectOne(int ON_COM_NO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.onlineSelectOne(ON_COM_NO);
	}

	@Override
	public void onlineDeleteTable(int ON_COM_NO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.onlineDeleteTable(ON_COM_NO);
	}

	@Override
	public void upDateonlineTable(OnlineVO onlineVO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.upDateonlineTable(onlineVO);
	}

	@Override
	public List<OnlineVO> onlineSelectSearch(HashMap<String, Object> paging) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.onlineSelectSearch(paging);
	}

	@Override
	public int onlineSelectTotalSearch(HashMap<String, Object> search) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.onlineSelectTotalSearch(search);
	}

	@Override
	public List<EmploymentVO> employmentSelectAll(HashMap<String, Integer> paging) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.employmentSelectAll(paging);
	}

	@Override
	public int employmentTotalTable() {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.employmentTotalTable();
	}

	@Override
	public EmploymentVO employmentSelectOne(int _EMP_CON_NO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.employmentSelectOne(_EMP_CON_NO);
	}

	@Override
	public void employmentDeleteTable(int EMP_CON_NO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.employmentDeleteTable(EMP_CON_NO);
	}

	@Override
	public void upDateemploymentTable(EmploymentVO _employmentVO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.upDateemploymentTable(_employmentVO);
	}

	@Override
	public void insertEmploymentTable(EmploymentVO _employmentVO) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.insertEmploymentTable(_employmentVO);
	}

	@Override
	public List<EmploymentVO> employmentSelectSearch(HashMap<String, Object> search) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.employmentSelectSearch(search);
	}

	@Override
	public int employmentSelectTotalSearch(HashMap<String, Object> search) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.employmentSelectTotalSearch(search);
	}
	

}