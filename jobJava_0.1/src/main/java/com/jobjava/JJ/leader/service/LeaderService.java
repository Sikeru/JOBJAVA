package com.jobjava.JJ.leader.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.leader.vo.AppVO;
import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.SearchCriteria;
import com.jobjava.JJ.leader.vo.SurveyVO;
import com.jobjava.JJ.leader.vo.UniVO;

public interface LeaderService {
	// 기업등록하기 insert
	public void insertCompany(HashMap<String, String> company);

	// 기업등록 select
	public List<CRegVO> selectlegister();

	// 기업등록조회 리스트 페이징

	public CRegVO selectRegi(String regiNO);

	public int selectSvNO(String title);

	public void addQuestion(String ql, int svNO);

	public void addSurvery(int empNO, String title, String sDate, String eDate);

	public int selectEmpno(String parameter);

	public List<SurveyVO> SurveyList();

	public List<SurveyVO> viewSurvey(int svNO);

	public SurveyVO surveyDetail(int svNO);
	
	public void addAnswer(int qno, String answer, String id);
	
	public UniVO bName(int uniBNO);
	
	public AppVO userInfo(String id);

	public int addCompany(Map articleMap) throws Exception;

	public int boardListCnt(SearchCriteria scri);
	
	public List<Map<String, Object>> boardList(SearchCriteria scri);

	public void addApplication(String userID, int uniBNO, String hopeJob, String reason, String fileName);
	
	public List<Integer> appCheck(String userID);
	
	public List<Map<String, String>> file(String regiNO);

	public List<String> selectFileNO(String regiFileNO);

	public void legisterUpdate(CRegVO cRegVO);

	public void legisterDelete(int REGI_NO);
}
