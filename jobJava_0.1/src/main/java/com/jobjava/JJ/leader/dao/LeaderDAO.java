package com.jobjava.JJ.leader.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.Criteria;

public interface LeaderDAO {
	// ������� ���
	public void legisterAdd(HashMap<String, String> cRegVO);

	// ��� id�� �ҷ�����
	public String selectCompanyID(HashMap<String, String> cRegVO);

	// ������ ��ȸ
	public List<CRegVO> selectCompanyLegister();

	// ����¡
	public List<Map<String, Object>> boardList(Criteria cri);

	public int boardListCnt();

	// �����ȣ��ȸ
	public CRegVO selectRegi(String regiNO);
}
