package com.jobjava.JJ.main.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jobjava.JJ.main.dao.MainDAO;

@Service("MainService")
public class MainServiceImpl implements MainService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void mnLog(String mnName) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		dao.mnLog(mnName);
	}

}
