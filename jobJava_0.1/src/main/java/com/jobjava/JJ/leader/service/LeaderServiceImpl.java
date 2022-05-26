package com.jobjava.JJ.leader.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobjava.JJ.leader.dao.LeaderDAO;
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

	// 기업등록 insert
	@Override
	public void insertCompany(HashMap<String, String> company) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		company.put("B_NO", dao.selectCompanyID(company)); // value占쏙옙 select
		dao.legisterAdd(company);
	}

	// 다중 이미지 추가하기
	@Override
	public int addCompany(Map articleMap) throws Exception {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		List<FileVO> imageFileList = (ArrayList) articleMap.get("imageFileList");
		articleMap.put("B_NO", dao.selectCompanyID(articleMap));
//			articleMap.put("PROGRAM_NO", dao.selectPROGRAM_NO(articleMap));
		articleMap.put("REGI_NO", dao.selectREGI_NO(articleMap));

		int b_NO = dao.insertNewArticle(articleMap);
		int rEGI_NO = (Integer) articleMap.get("REGI_NO");
		int rEGI_FILENO = dao.selectNewImageFileNO();

		if (imageFileList != null && imageFileList.size() != 0) {
			for (FileVO fileVO : imageFileList) {
				fileVO.setREGI_FILENO(++rEGI_FILENO);
				fileVO.setREGI_NO(rEGI_NO);

			}
			dao.insertNewImage(imageFileList);
		}
//			articleMap.put("B_NO", dao.selectCompanyID(articleMap));
//		     dao.insertNewArticle(articleMap);
//		     int pROGRAM_NO = dao.insertNewArticle(articleMap);
//		     articleMap.put("PROGRAM_NO", pROGRAM_NO);
//		     dao.insertNewImage(articleMap);
//			
		// return pROGRAM_NO;
		return rEGI_FILENO;
	}

	// 기업등록 select
	@Override
	public List<CRegVO> selectlegister() {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectCompanyLegister();

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
	public AppVO userInfo(String id) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectUserInfo(id);
	}
	
	//사업 신청(학생)
	@Override
	public void addApplication(String userID, int uniBNO, String hopeJob, String reason, String fileName) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.insertApplication(userID, uniBNO, hopeJob, reason, fileName);
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
	public List<SurveyVO> SurveyList() {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		List<SurveyVO> list = dao.selectAllSurveyList();
		return list;
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
	
/* 파일업로드 */
	
	@Override
	public List<Map<String, String>> file(String regiNO){
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectFileName(regiNO);
	}
	
	@Override
	public List<String> selectFileNO(String regiFileNO){
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		return dao.selectFileNO(regiFileNO);
	}
	
	//기업신청수정
	@Override
	public void legisterUpdate(CRegVO cRegVO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.legisterUpdate(cRegVO);
	}
	
	//기업신청삭제
	@Override
	public void legisterDelete(int REGI_NO) {
		LeaderDAO dao = sqlSession.getMapper(LeaderDAO.class);
		dao.legisterDelete(REGI_NO);
	}
}
