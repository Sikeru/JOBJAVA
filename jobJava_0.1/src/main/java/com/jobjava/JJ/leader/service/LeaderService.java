package com.jobjava.JJ.leader.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.Criteria;

public interface LeaderService {
	// �������ϱ� insert
	public void insertCompany(HashMap<String, String> company);

	// ������ select
	public List<CRegVO> selectlegister();

	// ��������ȸ ����Ʈ ����¡
	public int boardListCnt();

	public List<Map<String, Object>> boardList(Criteria cri);

	public CRegVO selectRegi(String regiNO);
}
