package com.jobjava.JJ.leader.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.jobjava.JJ.leader.vo.AppVO;
import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.FileVO;
import com.jobjava.JJ.leader.vo.SearchCriteria;
import com.jobjava.JJ.leader.vo.SurveyVO;
import com.jobjava.JJ.leader.vo.UniVO;

public interface LeaderDAO {
	// 기업정보 등록
		public void legisterAdd(HashMap<String, String> company);

		// 기업 id값 불러오기
		public String selectCompanyID(Map articleMap);

		public int selectREGI_NO(Map articleMap);

		// 기업등록조회
		public int insertNewArticle(Map articleMap) throws DataAccessException;

		public void insertNewImage(List<FileVO> imageFileList) throws DataAccessException;

		public int selectNewImageFileNO();

		// 기업등록목록 조회
		public List<CRegVO> selectCompanyLegister();

		// 기업등록 수정
		public void legisterUpdate(CRegVO cRegVO);

		// 기업등록 삭제
		public void legisterDelete(int REGI_NO);

		// 페이징
		public List<Map<String, Object>> boardList(SearchCriteria scri);

		// 게시글 총 갯수
		public int boardListCnt(SearchCriteria scri);

		// 기업번호조회
		public CRegVO selectRegi(String regiNO);

		// 직원번호
		public int selectEmpNO(String id);

		// 학생정보
		public AppVO selectUserInfo(String id);

		// 사업명
		public UniVO selectbName(int uniBNO);

		// 사업신청 학생
		public void insertApplication(String userID, int uniBNO, String hopeJob, String reason, String fileName);

		// 설문조사등록
		public void addSurvery(int empNO, String title, String sDate, String eDate);

		// 설문조사번호
		public int selectSvNO(String title);

		// 문항등록
		public void addQuestion(String ql, int svNO);

		// 설문조사조회
		public List<SurveyVO> selectAllSurveyList();

		// 문항내용디테일
		public List<SurveyVO> selectContent(int svNO);

		// 설문조사디테일
		public SurveyVO selectSurvey(int svNO);

		// 답변적음
		public void insertAnswer(int qno, String answer, String id);

	//	

		// 업로드파일조회
		public List<Map<String, String>> selectFileName(String regiNO);

		// 업로드 파일번호 조회
		public List<String> selectFileNO(String regiFileNO);
		
		//신청여부확인
		public List<Integer> selectAppCount(String userID);
}
