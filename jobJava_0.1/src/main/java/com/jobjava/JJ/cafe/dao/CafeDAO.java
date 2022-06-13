package com.jobjava.JJ.cafe.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.jobjava.JJ.cafe.vo.ApplyVO;
import com.jobjava.JJ.cafe.vo.FileVO;
import com.jobjava.JJ.cafe.vo.JobFileVO;
import com.jobjava.JJ.cafe.vo.JobInfoVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;
import com.jobjava.JJ.cafe.vo.ShopBasketVO;

public interface CafeDAO {

	// 구직등록 신청 (다중파일)
	public int JobinsertNewArticle(Map articleMap) throws DataAccessException;

	// 구직 id값 불러오기
	public String selectMemberID(Map articleMap);

	public int selectJOB_APP_NO(Map articleMap);

	public void JobinsertNewImage(List<JobFileVO> imageFileList) throws DataAccessException;

	public int JobselectNewImageFileNO();

	// 신청서
	public void apply(ApplyVO applyVO);

	public String selectMemberID2(ApplyVO applyVO);

	// 프로그램신청(다중파일)
	public int insertNewArticle(Map articleMap) throws DataAccessException;

	public void insertNewImage(List<FileVO> imageFileList) throws DataAccessException;

	public int selectNewImageFileNO();

	public int selectPROGRAM_NO(Map articleMap);

	// 기업 id값 불러오기
	public String selectCompanyID(Map articleMap);

	int selectAllArticlesList = 0;

	public List<ProgramVO> selcetProgram();

	public int selectTotArticles();

	// 페이징
	public List<Map<String, Object>> boardList(SearchCriteria scri);

	// 게시글 총 갯수
	public int boardListCnt(SearchCriteria scri);

	// 채용정보 상세조회
	public ProgramVO selectProgram(String PROGRAM_NO);

//	public List<String> selectProgramFile(String PROGRAM_NO);
	public List<Map<String, String>> selectProgramFile(String PROGRAM_NO);

	public List<String> selectFileNO(String empFileNO);

	// 채용정보 수정
	public void proupdate(ProgramVO programVO) throws Exception;

	public void updatefile2(List<FileVO> imageFileList);

	public void updatefile(String PROGRAM_NO, String FILENAME);

	// 채용정보 삭제
	public void prodelete(int PROGRAM_NO);

	// 채용정보 삭제
	public void deletefile(int PROGRAM_NO);

	// 캘린더
	public List selectSdata(String date);

	public List selectDdata(String date);

	// 취업컨설팅
	public List<Map<String, Object>> boardList2(SearchCriteria scri);

	public int boardListCnt2(SearchCriteria scri);

	// 취업특강
	public List<Map<String, Object>> boardList3(SearchCriteria scri);

	public int boardListCnt3(SearchCriteria scri);

	// 채용공고
	public int postingListCnt(SearchCriteria scri);

	// 채용공고
	public List<Map<String, String>> postingList(SearchCriteria scri);

	public List<JobInfoVO> selectJobPosting();

	public JobInfoVO selectJobPosting(int JOB_NO);

	// 채용공고 상세조회
	public JobInfoVO jobpostingdetail(int JOB_NO) throws Exception;

	// 채용공고 수정
	public void jobpostingupdate(JobInfoVO jobinfoVO) throws Exception;

	// 채용공고 삭제
	public void jobPostingDelete(int JOB_NO) throws Exception;

	// 장바구니
	public void jobPostingInCart(ShopBasketVO cart) throws Exception;

	// 장바구니 리스트
	public List<ShopBasketVO> selectCartList();

//	public List<Map<String, Object>> boardList3(SearchCriteria scri);

	// 장바구니 리스트
	public List<ShopBasketVO> jobPostingInCartList() throws Exception;

	// 장바구니 추가
	public void jobPostingInsertInCart(ShopBasketVO ShopBasketVO) throws Exception;

	public ShopBasketVO selectJobPostingInCart(ShopBasketVO shopBasketVO) throws Exception;

	public List<Integer> bascketList() throws Exception;

	public int empnoid(String ID) throws Exception;

	// 장바구니 삭제
	public int jobPostingInCartDelete(int JOB_NO) throws Exception;
	
//	// 기업 마이페이지 (프로그램 신청자 승인,조회)
//	public List<Map<String, Object>> companymypage();
	
	//기업마이페이지 리스트
	public List<ProgramVO> companymypagelist(String user_id) throws Exception;
	// 기업마이페이지 신청서 상세뷰
	public List<ProgramVO> selectpro(int PROGRAM_NO);

	// 기업마이페이지 승인여부수정
	public void companymypageupdate(String APP, String EMP_PAR_NO);

	// 학생마이페이지 리스트
	public List<ProgramVO> studentmypagelist(String user_id) throws Exception;
	// 학생마이페이지 리스트2
	public ProgramVO selectProgram2(String PROGRAM_NO);


}
