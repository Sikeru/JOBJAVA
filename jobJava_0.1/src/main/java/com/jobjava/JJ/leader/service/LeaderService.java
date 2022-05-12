package com.jobjava.JJ.leader.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.Criteria;

public interface LeaderService {
	// 기업등록하기 insert
	public void insertCompany(HashMap<String, String> company);

	// 기업등록 select
	public List<CRegVO> selectlegister();

	// 기업등록조회 리스트 페이징
	public int boardListCnt();

	public List<Map<String, Object>> boardList(Criteria cri);

	public CRegVO selectRegi(String regiNO);
}
