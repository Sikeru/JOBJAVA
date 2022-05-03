package com.jobjava.JJ.cafe.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jobjava.JJ.main.dao.MainDAO;

@Service("CafeService")
public class CafeServiceImpl implements CafeService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void mnLog(String mnName) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		dao.mnLog(mnName);
	}

}
