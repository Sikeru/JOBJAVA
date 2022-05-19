package com.jobjava.JJ.main.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jobjava.JJ.main.dao.MainDAO;

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

}
