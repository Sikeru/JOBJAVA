package com.jobjava.JJ.leader.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.jobjava.JJ.leader.vo.UserVO;
import com.jobjava.JJ.leader.vo.AppVO;
import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.FileVO;
import com.jobjava.JJ.leader.vo.SearchCriteria;
import com.jobjava.JJ.leader.vo.SurveyVO;
import com.jobjava.JJ.leader.vo.UniVO;

public interface LeaderDAO {

	// 뉴리더 사업안내
	public void mnLog(String mnName);

	// 기업정보 등록
	public void legisterAdd(HashMap<String, String> company);

	// 기업 id값 불러오기
	public String selectCompanyID(Map articleMap);

	public String selectREGI_NO(Map articleMap);

	// 기업정보 조회(수정뷰에 씀)
	public CRegVO selectCompanyInfo(String id);

	// 기업신청수정뷰 정보 조회(C_MEMBER)
	public CRegVO selectNewArticle(String id, int uniBNO);

	// 기업신청 수정
	public void updateNewArticle(CRegVO cRegVO) throws DataAccessException;

	// 기업신청 파일수정
	public void legisterFileUpdate(String articleMap, List<String> fileName);

	// 기업신청 삭제
	public void legisterDelete(int REGI_NO);

	// 기업신청 파일삭제
	public void legisterFileDel(String REGI_NO, String delfile);

	// 기업등록조회
	public int insertLegisterArticle(Map articleMap) throws DataAccessException;

	public void insertNewImage(String rEGI_NO, String fileName) throws DataAccessException;

	public int selectNewImageFileNO();

	// 기업등록목록 조회
	public List<CRegVO> selectCompanyLegister();

	// 페이징
	public List<Map<String, Object>> boardList(SearchCriteria scri);
	
	public List<Map<String, Object>> boardListStu(SearchCriteria scri);

	// 게시글 총 갯수
	public int boardListCnt(SearchCriteria scri);
	
	public int boardListStuCnt(SearchCriteria scri);

	// 기업번호조회
	public CRegVO selectRegi(String regiNO);

	// 직원번호
	public int selectEmpNO(String id);

	// 학생정보
	public UserVO selectUserInfo(String id);

	// 사업명
	public UniVO selectbName(int uniBNO);

	// 사업신청 학생
	public void insertApplication(String userID, int uniBNO, String hopeJob, String reason);

	// 설문조사등록
	public void addSurvery(int empNO, String title, String sDate, String eDate);

	// 설문조사번호
	public int selectSvNO(String title);

	// 문항등록
	public void addQuestion(String ql, int svNO);

	// 설문조사조회
	public List<SurveyVO> selectAllSurveyList(SearchCriteria scri);
	
	// 설문조사글 총갯수
	public int selectAllSurveyListCount();

	// 문항내용디테일
	public List<SurveyVO> selectContent(int svNO);

	// 설문조사디테일
	public SurveyVO selectSurvey(int svNO);

	// 답변적음
	public void insertAnswer(int qno, String answer, String id);

	//

	// 업로드파일조회
	public List<Map<String, String>> selectFileName(int uniBNO);

	// 업로드 파일번호 조회
	public List<String> selectFileNO(String regiFileNO);

	// 신청여부확인
	public List<Integer> selectAppCount(String userID);

	public List<Integer> selectAppCountCom(String userID);

	// 사업신청정보(학생)
	public AppVO selectAppInfo(String userID, int uniBNO);

	public void updateStuApplication(String hopeJob, String reason, int uniBNO, String userID);

	public void deleteStuApplication(int uniBNO, String userID);

	public List<Map<String, Object>> selectAllCommute(SearchCriteria scri, String userID);

	public List<Map<String, Object>> selectSearchCommute(String userID, String sdate, String edate);

	public void insertgoToWork(String userID, String toDate, String toDateTime);

	public void updateleaveWork(String userID, String toDate, String toDateTime);

	public int selectATT(String toDate, String uesrID);

	public int selectQUT(String toDate, String uesrID);

	public String selectMacAddr(String userID);

	public List<Map<String, Object>> selectJournal(String userID, SearchCriteria scri);
	
	public int selectJournalCnt(String userID);

	public void insertJournal(String userID, String title, String content);

	public Map<String, Object> selectDetail(int jnNO);

	public void updateJournal(String userID, String title, String content, int jnNO);

	public void deleteJournal(String userID, int jnNO);

	public int commuteListCnt(String userID);
	
	public void updatePermission(int uniBNO);
	
	public void updatePermissionDel(int uniBNO);

	

}
