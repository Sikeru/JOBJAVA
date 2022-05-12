package com.jobjava.JJ.cafe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jobjava.JJ.cafe.dao.CafeDAO;
import com.jobjava.JJ.cafe.vo.Criteria;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.MyPageVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;





@Service("cafeService")
@Transactional(propagation = Propagation.REQUIRED)
public class CafeServiceImpl implements CafeService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void insertJob(JobAppVO jobAppVO){
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		dao.jobAppresultAdd(jobAppVO);
	}
	
      public List<ProgramVO> boardList() throws DataAccessException {
			CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
			List<ProgramVO> provo = dao.selcetProgram();
			return provo;
		}

		
		// ÆäÀÌÂ¡//
		public int boardListCnt() throws Exception {
			CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
	        return dao.boardListCnt();
	 }
	 
	 public List<Map<String, Object>> boardList(Criteria cri) throws Exception {
		 CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
	        return dao.boardList(cri);
	}
	 @Override
		public void insertCompany(HashMap<String, String> company){
			CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
			company.put("B_NO", dao.selectCompanyID(company)); //value¿¡ select
			dao.mypageresultAdd(company);
		}

		@Override
		public MyPageVO selectLegister(MyPageVO myPageVO) {
			CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
			return myPageVO;

		
		}
		
		//Ä¶¸°´õ//
		public List sDate(String date) throws Exception{
			CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
			List sDatelist = null;
			sDatelist = dao.selectSdata(date);
			return sDatelist;
		}
		
		public List dDate(String date) throws Exception{
			CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
			List dDatelist = null;
			dDatelist = dao.selectDdata(date);
			return dDatelist;
		}

		
}	


