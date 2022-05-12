package com.jobjava.JJ.cafe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.cafe.vo.Criteria;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;

public interface CafeDAO {
	//�������� ���
	public void  jobAppresultAdd(JobAppVO jobAppVO);
	//���� id�� �ҷ�����
	public String selectMemberID(JobAppVO jobAppVO);
	//������� ���
	public void  mypageresultAdd(HashMap<String, String> myPageVO);
	//��� id�� �ҷ�����
	public String selectCompanyID(HashMap<String, String> myPageVO);
	
	int selectAllArticlesList = 0;

	public List<ProgramVO> selcetProgram();

	public int selectTotArticles();

	public List<Map<String, Object>> boardList(Criteria cri) throws Exception;

	public int boardListCnt() throws Exception;
	
	public List selectSdata(String date);
	public List selectDdata(String date);
}


