package com.jobjava.JJ.leader.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobjava.JJ.leader.dao.LeaderDAO;
import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.Criteria;

@Service("leaderService")
public class LeaderServiceImpl implements LeaderService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// ������ insert
	@Override
	public void insertCompany(HashMap<String, String> company) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		company.put("B_NO", dao.selectCompanyID(company)); // value�� select
		dao.legisterAdd(company);
	}

	@Override
	// ������ select
	public List<CRegVO> selectlegister() {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectCompanyLegister();

	}

	@Override
	// ��������ȸ ����Ʈ ����¡
	public int boardListCnt() {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.boardListCnt();
	}

	public List<Map<String, Object>> boardList(Criteria cri) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.boardList(cri);
	}


	@Override
	public CRegVO selectRegi(String regiNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectRegi(regiNO);
	}
}
