package com.jobjava.JJ.leader.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.leader.vo.AppVO;
import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.SearchCriteria;
import com.jobjava.JJ.leader.vo.SurveyVO;
import com.jobjava.JJ.leader.vo.UniVO;
import com.jobjava.JJ.leader.vo.UserVO;

public interface LeaderService {

	// 뉴리더 사업안내
	public void mnLog(String mnName);

	// 기업등록하기 insert
	public void insertCompany(HashMap<String, String> company);

	// 기업등록 select
	public List<CRegVO> selectlegister();

	public CRegVO selectCompanyInfo(String id);

	public CRegVO selectCompany(String id, int uniBNO);

	// 기업등록조회 리스트 페이징

	public CRegVO selectRegi(String regiNO);

	public int selectSvNO(String title);

	public void addQuestion(String ql, int svNO);

	public void addSurvery(int empNO, String title, String sDate, String eDate);

	public int selectEmpno(String parameter);

	public List<SurveyVO> SurveyList(SearchCriteria scri);
	
	public int SurveyListcnt();

	public List<SurveyVO> viewSurvey(int svNO);

	public SurveyVO surveyDetail(int svNO);

	public void addAnswer(int qno, String answer, String id);

	public UniVO bName(int uniBNO);

	public UserVO userInfo(String id);

	public int boardListCnt(SearchCriteria scri);

	public int boardListStuCnt(SearchCriteria scri);

	public List<Map<String, Object>> boardList(SearchCriteria scri);

	public List<Map<String, Object>> boardListStu(SearchCriteria scri);

	public void addApplication(String userID, int uniBNO, String hopeJob, String reason);

	public List<Integer> appCheck(String userID);

	public List<Integer> appCheckCom(String userID);

	public List<String> selectFileNO(String regiFileNO);

	public void legisterUpdate(CRegVO cRegVO);

	public void legisterDelete(int REGI_NO);

	public AppVO appInfo(String userID, int uniBNO);

	public void modStuApp(String hopeJob, String reason, int uniBNO, String userID);

	public void delStuApp(int uniBNO, String userID);

	public List<Map<String, Object>> viewCommuteList(SearchCriteria scri, String userID);

	public List<Map<String, Object>> dateSearchCommute(String userID, String sdate, String edate);

	public void goToWork(String userID, String toDate, String toDateTime);

	public void leaveWork(String userID, String toDate, String toDateTime);

	public int searchATT(String toDate, String uesrID);

	public int searchQUT(String toDate, String userID);

	public String checkMac(String userID);

	// 업무일지 조회
	public List<Map<String, Object>> viewJournal(String userID, SearchCriteria scri);
	
	// 업무일지전체리스트 갯수
	public int viewJournalCnt(String userID);

	// 업무일지 등록
	public void addJournal(String userID, String title, String content);

	// 업무일지 상세창조회
	public Map<String, Object> journalDetail(int jnNO);

	public void modJournal(String userID, String title, String content, int jnNO);

	public void deljournal(int jnNO, String userID);

	public String addCompany(Map articleMap, List<String> fileList) throws Exception;

	public void legisterFileUpdate(List<String> fileName, Map<String, Object> articleMap);

	public void legisterFileDel(Map<String, Object> articleMap);

	public List<Map<String, String>> file(int uniBNO);

	public int commuteListCnt(String userID);

	public void updatePermission(int uniBNO);

	public void updatePermissionDel(int uniBNO);

}
