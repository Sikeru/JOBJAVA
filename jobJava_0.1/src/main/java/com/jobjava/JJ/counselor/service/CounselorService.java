package com.jobjava.JJ.counselor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.counselor.vo.SearchCriteria;
import com.jobjava.JJ.counselor.vo.UniregVO;
import com.jobjava.JJ.counselor.vo.AlarmVO;
import com.jobjava.JJ.counselor.vo.ComregVO;
import com.jobjava.JJ.counselor.vo.CriteriaVO;
import com.jobjava.JJ.counselor.vo.JobcheckVO;
import com.jobjava.JJ.counselor.vo.JobregVO;
import com.jobjava.JJ.counselor.vo.SturegVO;


public interface CounselorService {
	
	// 등록된 기업 리스트
	public List<Map<String, Object>> jobList(CriteriaVO cri);
	public int jobListCnt(CriteriaVO cri);
	
	// 승인할 프로그램 리스트
	public List<Map<String, Object>> programPermission(CriteriaVO cri);
	public int proListCnt(CriteriaVO cri);
		
	// 프로그램 신청 승인 (꿈터)
	public void proNameList(String permission, String programNO);
	public void programList(String m_result, String regi_NO);

			
	// 일자리 매칭
	public List<HashMap<String, Object>> selectAllBasketInfo(String user_id);
	public List<HashMap<String, String>> selectAllChMember(String user_id);
	public void memberMatching(HashMap<String, String> member);


	
	public void checkID(SturegVO sturegVO);

	public List<HashMap <String, String>> JobcheckForm();
	public List<HashMap <String, String>> listAppNO(String id);
	public void jobcheckAdd(JobcheckVO jobcheckVO);
	
	// 프로그램 이메일 리스트
	
	public List<Map<String, Object>> proList(CriteriaVO cri);
	public int programListCnt(CriteriaVO cri);
	
	// 학생 삭제
	public int studendelete(int CM_NO)throws Exception;

		// 학생 수정
	public void studenupdate(SturegVO sturegVO) throws Exception;

	public void studenupdate2(SturegVO sturegVO) throws Exception; 
		// 기업 수정
	public void companyupdate(ComregVO comregVO) throws Exception;
		
		// 기업 삭제
	public int companydelete(int CM_NO)throws Exception;
	
	public void addstu(HashMap<String, String> sturegVO);
	
	public List<SturegVO> stulist() throws Exception;
	
	public void addcompany(HashMap<String, String> comregVO);
	
	public List<ComregVO> comlist() throws Exception;

	public List<HashMap<String, String>> attendancelist();

	
		
	public JobregVO selectjob(int JOB_NO) throws Exception;
	
	public SturegVO selectStu(String CM_NO);
	public ComregVO selectCom(String CM_NO);
	
	
	// 20220519 페이징 부분
	public int uniregListCnt(CriteriaVO cri);
	
	public List<Map<String, Object>> uniregList(CriteriaVO cri);
	
	// 등록된 기업 수정 삭제 기능
	public void jobupdate(JobregVO jobregVO) throws Exception;
	
	public void jobdelete(int JOB_NO) throws Exception;
	
	public void delete(int UNI_B_NO) throws Exception;
	
	public void update(UniregVO uniregVO) throws Exception;

	public List<HashMap<String, String>> JobList();

	public void addJob(HashMap<String, String> jobregVO);
	
	public void addJou(HashMap<String, String> consultationJournalVO);
	
	/* public UniregVO uniread(int UNI_B_NO); */

	public void modifyuniregState(HashMap<String, String> uniregVO);
	
	public void adduni(HashMap<String, String> uniregVO);

	public void regcheck(HashMap<String, String> uniregVO);
	
	public List<UniregVO> uniList() throws Exception;

	public List<HashMap<String, String>> JobList2();

//	public int counseolrServiceCnt(SearchCriteria scri);
//	
//	public List<HashMap<String, Object>> boardList();
//
//	public List<Map<String, Object>> boardList(SearchCriteria scri);

//	public List<ProgramVO> boardList() throws DataAccessException;
	// 출석 조회
	public int counseolrServiceCnt(SearchCriteria scri) throws Exception;

	public int counseolrServiceCnt2(SearchCriteria scri) throws Exception;
	
	public List<Map<String, Object>> boardList(SearchCriteria scri) throws Exception;
	
	public List<Map<String, Object>> boardList2(SearchCriteria scri) throws Exception;
	
	public List<Map<String, Object>> calendarList(HashMap<String, String> commuteDate, SearchCriteria scri);

//	public List<Map<String, Object>> commutelist(HashMap<String, String> commuteDate, SearchCriteria scri);
	
	public List<HashMap<String, String>> commutelist(HashMap<String, String> commuteDate);

	// 업무일지
	public List<HashMap<String, Object>> journalList(SearchCriteria scri) throws Exception;

	public List<HashMap<String, String>> journalList();

	// 학생 급여 조회
	public List<HashMap<String, String>> studentSalaryList();

	public List<HashMap<String, Object>> studentSalaryList(SearchCriteria scri);

	// 대학사업비 조회
	public List<HashMap<String, String>> universitySalaryList();

	public List<HashMap<String, Object>> universitySalaryList(SearchCriteria scri);

//	public List<Map<String, Object>> boardList(SearchCriteria scri);
	
	//상담일지관리 등록
	public void addUni(HashMap<String, String> unireg);

	//상담 일지 관리 리스트
	public List<HashMap<String, String>> consultationList();

	public List<HashMap<String, Object>> consultationList(SearchCriteria scri);
	
	public UniregVO selectProgram(int UNI_B_NO) throws Exception;

	public void updateName(String process, String comNO);

	public void updateNameList(String permission, String unibNO);
	
	// 설문조사 리스트
	public List<SurveyVO> SurveyList(SearchCriteria scri);

	public int SurveyListcnt();

	// 설문조사등록을위해 직원번호가져오기
	public int selectEmpno(String Id);

	// 설문조사 정보등록
	public void addSurvery(int empNO, String title, String sDate, String eDate, String div);

	// 설문타이틀로 번호가져오기
	public int selectSvNO(String title);

	// 설문 문항등록
	public void addQuestion(String ql, int svNO);

	// 설문조사 상세
	public SurveyVO surveyDetail(int svNO);

	public List<SurveyVO> viewSurvey(int svNO);

	public List<Integer> firstQno(int svNO);

	public void modQue(int svNO, String qTxt, int qNO);

	public void delQue(int qn);

	public void delSur(int svNO);

	public List<Map<String, Object>> resultList(String svNO);
		
}
