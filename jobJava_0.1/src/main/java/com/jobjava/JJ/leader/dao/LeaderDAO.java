package com.jobjava.JJ.leader.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.Criteria;

public interface LeaderDAO {
	// 기업정보 등록
	public void legisterAdd(HashMap<String, String> cRegVO);

	// 기업 id값 불러오기
	public String selectCompanyID(HashMap<String, String> cRegVO);

	// 기업등록 조회
	public List<CRegVO> selectCompanyLegister();

	// 페이징
	public List<Map<String, Object>> boardList(Criteria cri);

	public int boardListCnt();

	// 기업번호조회
	public CRegVO selectRegi(String regiNO);
}
