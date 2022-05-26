package com.jobjava.JJ.admin.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jobjava.JJ.admin.dao.AdminDAO;
import com.jobjava.JJ.admin.vo.SearchCriteria;
import com.jobjava.JJ.member.vo.MemberVO;

@Service("AdminService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberVO> selectAllMember(SearchCriteria scri) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.selectAllMember(scri);
	}

	@Override
	public int selectAllMemberCnt(SearchCriteria scri) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.selectAllMemberCnt(scri);
	}

	@Override
	public void updateMember(MemberVO _memberVO) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		dao.updateMember(_memberVO);
	}

	@Override
	public int selectAllLoginStatisticsCnt(SearchCriteria scri) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.selectAllLoginStatisticsCnt(scri);
	}

	@Override
	public List<HashMap<String, String>> selectAllLoginStatistics(SearchCriteria scri) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.selectAllLoginStatistics(scri);
	}

	@Override
	public List<String> selectAuthorityStatistics() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.selectAuthorityStatistics();
	}

	@Override
	public List<HashMap<String, String>> selectAllMemuLog() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.selectAllMemuLog();
	}
	
	
}
