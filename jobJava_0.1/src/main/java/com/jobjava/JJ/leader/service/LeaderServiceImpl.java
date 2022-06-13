package com.jobjava.JJ.leader.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobjava.JJ.leader.dao.LeaderDAO;
import com.jobjava.JJ.leader.vo.UserVO;
import com.jobjava.JJ.leader.vo.AppVO;
import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.FileVO;
import com.jobjava.JJ.leader.vo.SearchCriteria;
import com.jobjava.JJ.leader.vo.SurveyVO;
import com.jobjava.JJ.leader.vo.UniVO;

@Service("leaderService")
public class LeaderServiceImpl implements LeaderService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void mnLog(String mnName) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.mnLog(mnName);
	}

	// 기업등록 insert
	@Override
	public void insertCompany(HashMap<String, String> company) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		company.put("B_NO", dao.selectCompanyID(company)); // value占쏙옙 select
		dao.legisterAdd(company);
	}

	// 다중 이미지 추가하기
	@Override
	public String addCompany(Map articleMap, List<String> fileList) throws Exception {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
//		List<FileVO> imageFileList = (ArrayList) articleMap.get("imageFileList");
//		articleMap.put("B_NO", dao.selectCompanyID(articleMap));

//		dao.updateNewArticle(articleMap);
		dao.insertLegisterArticle(articleMap);

		// 파일번호
		// int rEGI_FILENO = dao.selectNewImageFileNO();

		// C_REG REGI_NO 들고오기
		// 기업신청번호
		String rEGI_NO = dao.selectREGI_NO(articleMap);

		if (fileList != null && fileList.size() != 0) {
			for (String fileName : fileList) {
				dao.insertNewImage(rEGI_NO, fileName);
			}

		}
//			articleMap.put("B_NO", dao.selectCompanyID(articleMap));
//		     dao.insertNewArticle(articleMap);
//		     int pROGRAM_NO = dao.insertNewArticle(articleMap);
//		     articleMap.put("PROGRAM_NO", pROGRAM_NO);
//		     dao.insertNewImage(articleMap);
//			
		// return pROGRAM_NO;
		return rEGI_NO;
	}

	// 기업등록 select
	@Override
	public List<CRegVO> selectlegister() {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectCompanyLegister();

	}

	// 기업정보 select 아이디로 조회(기업신청등록 기업정보 select)
	public CRegVO selectCompanyInfo(String id) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		System.out.println(id);
		return dao.selectCompanyInfo(id);
	}

	// 기업정보 select 아이디로 조회(기업신청 수정뷰 select)
	public CRegVO selectCompany(String id, int uniBNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		System.out.println(id);
		return dao.selectNewArticle(id, uniBNO);
	}

	// 기업등록조회 리스트 페이징
	@Override
	public int boardListCnt(SearchCriteria scri) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.boardListCnt(scri);
	}

	public List<Map<String, Object>> boardList(SearchCriteria scri) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.boardList(scri);
	}
	
	@Override
	public List<Map<String, Object>> boardListStu(SearchCriteria scri) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.boardListStu(scri);
	}
	
	@Override
	public int boardListStuCnt(SearchCriteria scri) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.boardListStuCnt(scri);
	}

	// 기업번호조회
	@Override
	public CRegVO selectRegi(String regiNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectRegi(regiNO);
	}

	// 사원아이디로 사원번호 조회
	@Override
	public int selectEmpno(String Id) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectEmpNO(Id);
	}

	@Override
	public UserVO userInfo(String id) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectUserInfo(id);
	}

	// 사업 신청(학생)
	@Override
	public void addApplication(String userID, int uniBNO, String hopeJob, String reason) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.insertApplication(userID, uniBNO, hopeJob, reason);
	}

	@Override
	public AppVO appInfo(String userID, int uniBNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectAppInfo(userID, uniBNO);
	}

	// 사업신청수정(학생)
	@Override
	public void modStuApp(String hopeJob, String reason, int uniBNO, String userID) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.updateStuApplication(hopeJob, reason, uniBNO, userID);
	}

	// 사업신청삭제(학생)
	@Override
	public void delStuApp(int uniBNO, String userID) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.deleteStuApplication(uniBNO, userID);
	}

	// 설문조사 정보등록
	@Override
	public void addSurvery(int empNO, String title, String sDate, String eDate) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.addSurvery(empNO, title, sDate, eDate);
	}

	// 설문타이틀로 번호가져오기
	@Override
	public int selectSvNO(String title) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectSvNO(title);
	}

	// 설문 문항등록
	@Override
	public void addQuestion(String ql, int svNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.addQuestion(ql, svNO);
	}

	// 설문리스트조회
	@Override
	public List<SurveyVO> SurveyList(SearchCriteria scri) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		List<SurveyVO> list = dao.selectAllSurveyList(scri);
		return list;
	}
	
	// 설문리스트 총갯수
	@Override
	public int SurveyListcnt() {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectAllSurveyListCount();
	}

	// 설문문항 조회
	@Override
	public List<SurveyVO> viewSurvey(int svNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		List<SurveyVO> list = dao.selectContent(svNO);
		return list;
	}

	// 설문조사 번호로 상세페이지조회
	@Override
	public SurveyVO surveyDetail(int svNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectSurvey(svNO);
	}

	// 답변등록
	@Override
	public void addAnswer(int qno, String answer, String id) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.insertAnswer(qno, answer, id);
	}

	// 대학사업번호로 제목,날짜조회
	public UniVO bName(int uniBNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectbName(uniBNO);
	}

	// 사업신청확인 (학생)
	public List<Integer> appCheck(String userID) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectAppCount(userID);
	}

	// 사업신청확인 (기업)
	public List<Integer> appCheckCom(String userID) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectAppCountCom(userID);
	}

	/* 파일업로드 */

	@Override
	public List<Map<String, String>> file(int uniBNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectFileName(uniBNO);
	}

	@Override
	public List<String> selectFileNO(String regiFileNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectFileNO(regiFileNO);
	}

	// 기업신청수정
	@Override
	public void legisterUpdate(CRegVO cRegVO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.updateNewArticle(cRegVO);
	}

	// 기업신청 파일수정
	@Override
	public void legisterFileUpdate(List<String> fileName, Map<String, Object> articleMap) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.legisterFileUpdate((String) articleMap.get("REGI_NO"), fileName);
	}

	// 기업신청삭제
	@Override
	public void legisterDelete(int REGI_NO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.legisterDelete(REGI_NO);
	}

	// 기업신청 파일삭제
	@Override
	public void legisterFileDel(Map<String, Object> articleMap) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		System.out.println((String) articleMap.get("REGI_NO") + (String) articleMap.get("delfile1"));
		for (int i = 0; i < articleMap.size(); i++) {
			if (articleMap.get("delfile" + i) != null) {
				dao.legisterFileDel((String) articleMap.get("REGI_NO"), (String) articleMap.get("delfile" + i));
			}
		}
	}
	
	//출퇴근글갯수조회
	@Override
	public int commuteListCnt(String userID) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.commuteListCnt(userID);
	}
	
	// 출퇴근전체조회
	@Override
	public List<Map<String, Object>> viewCommuteList(SearchCriteria scri, String userID) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectAllCommute(scri, userID);
	}

	// 출퇴근기간별조회
	@Override
	public List<Map<String, Object>> dateSearchCommute(String userID, String sdate, String edate) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectSearchCommute(userID, sdate, edate);
	}

	// 출근등록
	public void goToWork(String userID, String toDate, String toDateTime) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.insertgoToWork(userID, toDate, toDateTime);
	}

	// 퇴근등록
	public void leaveWork(String userID, String toDate, String toDateTime) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.updateleaveWork(userID, toDate, toDateTime);
	}

	// 출근여부확인
	public int searchATT(String toDate, String uesrID) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectATT(toDate, uesrID);
	}

	// 퇴근여부확인
	public int searchQUT(String toDate, String userID) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectQUT(toDate, userID);
	}

	// 맥주소확인
	public String checkMac(String userID) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectMacAddr(userID);
	}

	// 업무일지 조회
	@Override
	public List<Map<String, Object>> viewJournal(String userID, SearchCriteria scri) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectJournal(userID, scri);
	}
	
	// 업무일지전체리스트 갯수
	public int viewJournalCnt(String userID) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectJournalCnt(userID);
	}

	// 업무일지 등록
	@Override
	public void addJournal(String userID, String title, String content) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.insertJournal(userID, title, content);
	}

	// 업무일지 상세창조회
	@Override
	public Map<String, Object> journalDetail(int jnNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectDetail(jnNO);
	}

	@Override
	public void modJournal(String userID, String title, String content, int jnNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.updateJournal(userID, title, content, jnNO);
	}

	@Override
	public void deljournal(int jnNO, String userID) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.deleteJournal(userID, jnNO);
	}
	
	public void updatePermission(int uniBNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.updatePermission(uniBNO);
	}
	
	public void updatePermissionDel(int uniBNO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.updatePermissionDel(uniBNO);
	}

}
