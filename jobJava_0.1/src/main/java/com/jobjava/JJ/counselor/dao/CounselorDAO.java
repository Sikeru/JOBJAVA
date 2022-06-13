package com.jobjava.JJ.counselor.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.counselor.vo.ComregVO;
import com.jobjava.JJ.counselor.vo.CriteriaVO;
import com.jobjava.JJ.counselor.vo.JobcheckVO;
import com.jobjava.JJ.counselor.vo.JobregVO;
import com.jobjava.JJ.counselor.vo.SearchCriteria;
import com.jobjava.JJ.counselor.vo.SturegVO;
import com.jobjava.JJ.counselor.vo.UniregVO;
import com.jobjava.JJ.leader.vo.SurveyVO;

public interface CounselorDAO {
	public List<HashMap<String, String>> JobDao();

	public List<HashMap<String, String>> JobDao2();

	public void insertNewJob(HashMap<String, String> jobregVO);
	
	public HashMap<String, String> selectOnefileName(String MAT_NO);
	
	
	//상담일지관리 등록
	public void consultationJournalList(HashMap<String, String> consultationJournalVO);

	public String selectNewJobID(HashMap<String, String> jobregVO);

	// 대학 등록
	public void insertNewUni(HashMap<String, String> uniregVO);

	// 아이디 선택
	public String selectUniID(HashMap<String, String> uniregVO);

	// 참여목록
	public List<UniregVO> uniList() throws Exception;

	/* public UniregVO uniread(String UNI_B_NO); */
	public UniregVO selectProgram(String unibno) throws Exception;

	public void updatePermissionState(HashMap unireg);

	public List<HashMap<String, Object>> calendarList();

	// 게시글 총 갯수
	public int counseolrServiceCnt(SearchCriteria scri);

	public int counseolrServiceCnt2(SearchCriteria scri);
	
	public List<Map<String, Object>> boardList2(SearchCriteria scri);
	
	// 학생 급여 조회
	public List<HashMap<String, Object>> studentSalaryList(SearchCriteria scri);

	// 대학사업비 조회
	public List<HashMap<String, Object>> universitySalaryList(SearchCriteria scri);
	
	//상담일지관리리스트
	public List<HashMap<String, Object>> consultationList(SearchCriteria scri);

	public void updateNaem(String process, String comNO);

	public void updateNameList(String permission, String unibNO);
	
	public UniregVO selectProgram(int UNI_B_NO) throws Exception;
	public SturegVO selectStu(String CM_NO);
	public ComregVO selectCom(String CM_NO) ;

	public List<HashMap<String, String>> JobDao3();

	public List<HashMap<String, String>> commuteDao(HashMap<String, String> commuteDate);
	
	// 페이징
	public List<HashMap<String, Object>> boardList();
	
	// 게시글 총 갯수
	public int boardListCnt(SearchCriteria scri);
	public List<Map<String, Object>> boardList(SearchCriteria scri);
	
	//업무일지
		public List<HashMap<String, String>> journalDao();

		public List<HashMap<String, Object>> journalList(SearchCriteria scri);
	
		public List<HashMap<String, String>> selectAllMouList();


	// 기업번호조회
//	public CRegVO selectRegi(String regiNO);
	public List<HashMap<String, String>> attendanceDao();

	
	public List<Map<String, Object>> uniregList(CriteriaVO cri);
	public int uniregListCnt(CriteriaVO cri);

	
	public void update(UniregVO uniregVO) throws Exception;
	public void delete(int UNI_B_NO) throws Exception;
	
	// 뉴리더 학생, 기업 등록 리스트 및 폼 작성
	public void insertNewStu(HashMap<String, String> sturegVO);
	public void studenupdate(SturegVO sturegVO) throws Exception;
	public void studenupdate2(SturegVO sturegVO) throws Exception;
	public int studendelete(int CM_NO)throws Exception;
	
	public List<SturegVO> stuList() throws Exception;
	
	public void insertNewCompany(HashMap<String, String> comregVO);
	public void companyupdate(ComregVO comregVO) throws Exception;
	public int companydelete(int CM_NO)throws Exception;
	public List<ComregVO> comList() throws Exception; 
	
	// 프로그램 신청 리스트
	public List<Map<String, Object>> proList(CriteriaVO cri);
	public int programListCnt(CriteriaVO cri);
	
	// 등록된 기업 리스트
	public List<Map<String, Object>> jobList(CriteriaVO cri);
	public int jobListCnt(CriteriaVO cri);
	public JobregVO selectjob(int JOB_NO) throws Exception;
	
	// 등록된 기업 수정 삭제 기능
	public void jobupdate(JobregVO jobregVO) throws Exception;
		
	public void jobdelete(int JOB_NO) throws Exception;
	
	
	// 프로그램 승인할 리스트
	public List<Map<String, Object>> programPermission(CriteriaVO cri);
	public int proListCnt(CriteriaVO cri);
	
	
	
	// 프로그램 신청 승인 (꿈터)
	public void proNameList(String permission, String programNO);
	public void programList(String m_result, String regi_NO);
	
	/* public AlarmVO selectproID(String PROGRAM_NO) throws Exception; */

	// 직무체험점검
	public void jobcheckAdd(JobcheckVO jobcheckVO); 
	public List<HashMap <String, String>> selectID();
	
	// 일자리 매칭
	public List<HashMap<String, Object>> selectAllBasketInfo(String user_id);
	public List<HashMap<String, String>> selectAllChMember(String user_id);
	public void memberMatching(HashMap<String, String> member);
	public List<HashMap <String, String>> listAppNO(String id);
	
	public String checkID(SturegVO sturegVO);
	
	// 설문조사조회
	public List<SurveyVO> selectAllSurveyList(SearchCriteria scri);

	// 설문조사글 총갯수
	public int selectAllSurveyListCount();

	// 직원번호조회
	public int selectEmpNO(String id);

	// 설문조사 정보등록
	public void addSurvery(int empNO, String title, String sDate, String eDate, String div);

	// 설문타이틀로 번호가져오기
	public int selectSvNO(String title);

	// 설문조사 문항등록
	public void addQuestion(String ql, int svNO);

	// 설문조사상세
	public SurveyVO selectSurvey(int svNO);

	public List<SurveyVO> selectContent(int svNO);

	public List<Integer> selectQno(int svNO);

	public void updateQue(int svNO, String qTxt, int qn);

	public void deleteQue(int qn);

	public void deleteSur(int svNO);

	public List<Map<String, Object>> selectSurveyResult(String svNO);
	

}
