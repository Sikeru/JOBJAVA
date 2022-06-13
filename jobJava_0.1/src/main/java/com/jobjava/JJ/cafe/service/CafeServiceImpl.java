package com.jobjava.JJ.cafe.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jobjava.JJ.cafe.dao.CafeDAO;
import com.jobjava.JJ.cafe.vo.ApplyVO;
import com.jobjava.JJ.cafe.vo.FileVO;
import com.jobjava.JJ.cafe.vo.JobFileVO;
import com.jobjava.JJ.cafe.vo.JobInfoVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;
import com.jobjava.JJ.cafe.vo.ShopBasketVO;

@Service("cafeService")
@Transactional(propagation = Propagation.REQUIRED)
public class CafeServiceImpl implements CafeService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 구직등록 다중 이미지 추가하기(다중파일)
	@Override
	public int JobaddResult(Map articleMap) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		List<JobFileVO> imageFileList = (ArrayList) articleMap.get("imageFileList");
		articleMap.put("ID", dao.selectMemberID(articleMap));
		articleMap.put("JOB_APP_NO", dao.selectJOB_APP_NO(articleMap));

		int iD = dao.JobinsertNewArticle(articleMap);
		int jOB_APP_NO = (Integer) articleMap.get("JOB_APP_NO");

		System.out.println("jOB_APP_NO" + jOB_APP_NO);
		int jA_FILENO = dao.JobselectNewImageFileNO();

		if (imageFileList != null && imageFileList.size() != 0) {
			for (JobFileVO jobFileVO : imageFileList) {
				jobFileVO.setJA_FILENO(++jA_FILENO);
				jobFileVO.setJOB_APP_NO(jOB_APP_NO);

			}
			dao.JobinsertNewImage(imageFileList);
		}

		return jA_FILENO;
	}

	// 프로그램조회
	public List<ProgramVO> boardList() throws DataAccessException {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		List<ProgramVO> provo = dao.selcetProgram();
		return provo;
	}

	// 프로그램 페이징//
	@Override
	public int boardListCnt(SearchCriteria scri) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.boardListCnt(scri);
	}

	// 검색//
	@Override
	public List<Map<String, Object>> boardList(SearchCriteria scri) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.boardList(scri);
	}

	@Override
	public ProgramVO selectProgram(String PROGRAM_NO) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.selectProgram(PROGRAM_NO);
	}

	// 프로그램 파일보여주기
	@Override
	public List<Map<String, String>> file(String PROGRAM_NO) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.selectProgramFile(PROGRAM_NO);
	}

	// 채용정보 수정
	@Override
	public int updatefile(Map articleMap) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		for (int i = 0; i < articleMap.size(); i++) {
			if (articleMap.get("delete" + i) != null) {
				dao.updatefile((String) articleMap.get("PROGRAM_NO"), (String) articleMap.get("delete" + i));
			}
		}

		return 1;
	}

	// 채용정보 수정
	public int updatefile2(Map articleMap) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		List<FileVO> imageFileList = (ArrayList) articleMap.get("imageFileList");

		int pROGRAM_NO = (Integer) articleMap.get("PROGRAM_NO");

		System.out.println("pROGRAM_NO" + pROGRAM_NO);
		int eMP_FILE = dao.selectNewImageFileNO();

		if (imageFileList != null && imageFileList.size() != 0) {
			for (FileVO fileVO : imageFileList) {
				fileVO.setEMP_FILE(++eMP_FILE);
				fileVO.setPROGRAM_NO(pROGRAM_NO);

			}
			dao.updatefile2(imageFileList);
		}

		return eMP_FILE;
	}

	// 채용정보 삭제

	@Override
	public void prodelete(int PROGRAM_NO) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		dao.prodelete(PROGRAM_NO);
	}

	// 채용정보 삭제

	@Override
	public void deletefile(Map articleMap) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);

	}

	// 프로그램신청 다중 이미지 추가하기(다중파일)
	@Override
	public int addResult(Map articleMap) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		List<FileVO> imageFileList = (ArrayList) articleMap.get("imageFileList");
		articleMap.put("B_NO", dao.selectCompanyID(articleMap));
		articleMap.put("PROGRAM_NO", dao.selectPROGRAM_NO(articleMap));
		int b_NO = dao.insertNewArticle(articleMap);
		int pROGRAM_NO = (Integer) articleMap.get("PROGRAM_NO");
		int eMP_FILE = dao.selectNewImageFileNO();

		if (imageFileList != null && imageFileList.size() != 0) {
			for (FileVO fileVO : imageFileList) {
				fileVO.setEMP_FILE(++eMP_FILE);
				fileVO.setPROGRAM_NO(pROGRAM_NO);

			}
			dao.insertNewImage(imageFileList);
		}

		return eMP_FILE;
	}

	@Override
	public ProgramVO selectLegister(ProgramVO programVO) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return programVO;

	}

	// 캘린더//
	public List sDate(String date) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		List sDatelist = null;
		sDatelist = dao.selectSdata(date);
		return sDatelist;
	}

	public List dDate(String date) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		List dDatelist = null;
		dDatelist = dao.selectDdata(date);
		return dDatelist;
	}

	@Override
	public List<String> selectFileNO(String empFileNO) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.selectFileNO(empFileNO);
	}

//취업컨설팅
	@Override
	public List<Map<String, Object>> boardList2(SearchCriteria scri) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.boardList2(scri);
	}

	@Override
	public int boardListCnt2(SearchCriteria scri) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.boardListCnt2(scri);
	}

	// 취업특강

	@Override
	public List<Map<String, Object>> boardList3(SearchCriteria scri) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.boardList3(scri);
	}

	@Override
	public int boardListCnt3(SearchCriteria scri) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.boardListCnt3(scri);
	}

	// 채용공고 조회
	public List<JobInfoVO> postingList() throws DataAccessException {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		List<JobInfoVO> joninfo = dao.selectJobPosting();
		return joninfo;
	}

	// 채용공고
	public int postingListCnt(SearchCriteria scri) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.postingListCnt(scri);
	}

	// 채용공고
	public List<Map<String, String>> postingList(SearchCriteria scri) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		System.out.println(dao.toString());
		return dao.postingList(scri);
	}

	// 채용공고 조회
	public JobInfoVO selectJobPosting(int JOB_NO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.selectJobPosting(JOB_NO);
	}

	// 채용공고 상세조회
	public JobInfoVO jobpostingdetail(int JOB_NO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.jobpostingdetail(JOB_NO);
	}

	// 채용공고 수정
	public void jobpostingupdate(JobInfoVO jobinfoVO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		dao.jobpostingupdate(jobinfoVO);
	}

	// 채용공고 삭제
	public void jobPostingDelete(int JOB_NO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		dao.jobPostingDelete(JOB_NO);
	}

	// 장바구니 리스트
	public List jobPostingInCartList() throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		List<ShopBasketVO> list = dao.jobPostingInCartList();
		return list;
	}

	// 장바구니 추가
	@Override
	public void jobPostingInsertInCart(ShopBasketVO ShopBasketVO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		dao.jobPostingInsertInCart(ShopBasketVO);

	}

	@Override
	public ShopBasketVO selectJobPostingInCart(ShopBasketVO ShopBasketVO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.selectJobPostingInCart(ShopBasketVO);

	}

	public List<Integer> bascketList() throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.bascketList();
	}

	public int empnoid(String ID) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.empnoid(ID);
	}

	public int jobPostingInCartDelete(int JOB_NO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.jobPostingInCartDelete(JOB_NO);
	}

	@Override
	public void apply(ApplyVO applyVO) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		dao.apply(applyVO);

	}

	@Override
	public void proupdate(ProgramVO programVO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		dao.proupdate(programVO);
	}
	
	//기업마이페이지 리스트
	@Override
	public List<ProgramVO> companymypagelist(String user_id) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.companymypagelist(user_id);
		
	}
		//기업마이페이지 신청서 상세뷰
		@Override
		public List<ProgramVO> selectpro(int PROGRAM_NO) {
			CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
			return dao.selectpro(PROGRAM_NO);
		}
		//기업마이페이지 상태수정
		public void companymypageupdate(String APP, String EMP_PAR_NO){
		      CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		      dao.companymypageupdate(APP,EMP_PAR_NO);
		   }
		
		//학생마이페이지 리스트
			@Override
			public List<ProgramVO> studentmypagelist(String user_id) throws Exception {
				CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
				return dao.studentmypagelist(user_id);

			}
			//학생마이페이지 리스트
			@Override
			public ProgramVO selectProgram2(String PROGRAM_NO) {
				CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
				return dao.selectProgram2(PROGRAM_NO);
			}

}
