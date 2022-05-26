package com.jobjava.JJ.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jobjava.JJ.main.dao.MainDAO;
import com.jobjava.JJ.main.vo.SearchCriteria;

@Service("MainService")
@Transactional(propagation=Propagation.REQUIRED)
public class MainServiceImpl implements MainService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void mnLog(String mnName) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		dao.mnLog(mnName);
	}

	@Override
	public List<HashMap<String, String>> selectBestCompany() {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.selectBestCompany();
	}

	@Override
	public int insertBestCompany(String filename, String bc_name,String bc_hp) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		dao.insertBestCompany(bc_name,filename,bc_hp);
		return dao.selectBCNO();
	}

	@Override
	public void deleteBestCompany(String bc_no) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		dao.deleteBestCompany(bc_no);
	}

	@Override
	public void updateBestCompany(HashMap<String, String> company) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		dao.updateBestCompany(company);
	}

	@Override
	public List<Map<String, Object>> selectAllF_BOARD(SearchCriteria scri) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.selectAllF_BOARD(scri);
	}

	@Override
	public int boardListCnt(SearchCriteria scri) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.boardListCnt(scri);
	}

}
