package com.jobjava.JJ.leader.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.leader.vo.AppVO;
import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.Criteria;
import com.jobjava.JJ.leader.vo.SearchCriteria;
import com.jobjava.JJ.leader.vo.SurveyVO;

public interface LeaderService {
	// �������ϱ� insert
	public void insertCompany(HashMap<String, String> company);

	// ������ select
	public List<CRegVO> selectlegister();

	// ��������ȸ ����Ʈ ����¡

	public CRegVO selectRegi(String regiNO);

	public int selectSvNO(String title);

	public void addQuestion(String ql, int svNO);

	public void addSurvery(int empNO, String title, String sDate, String eDate);

	public int selectEmpno(String parameter);

	public List<SurveyVO> SurveyList();

	public List<SurveyVO> viewSurvey(int svNO);

	public SurveyVO surveyDetail(int svNO);
	
	public void addAnswer(int qno, String answer, String id);
	
	public String cregTitle(int regiNO);
	
	public AppVO userInfo(String id);

	public int addCompany(Map articleMap) throws Exception;

	public int boardListCnt(SearchCriteria scri);
	
	public List<Map<String, Object>> boardList(SearchCriteria scri);
}
