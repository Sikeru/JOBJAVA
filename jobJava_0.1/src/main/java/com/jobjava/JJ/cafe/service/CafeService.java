package com.jobjava.JJ.cafe.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.jobjava.JJ.cafe.vo.ApplyVO;
import com.jobjava.JJ.cafe.vo.JobInfoVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;
import com.jobjava.JJ.cafe.vo.ShopBasketVO;

public interface CafeService {
//	public void insertJob(JobAppVO jobAppVO);

	// 구직등록 신청 (다중파일)
	public int JobaddResult(Map articleMap) throws Exception;

	public void apply(ApplyVO applyVO);

	// 프로그램 검색
	public List<ProgramVO> boardList() throws DataAccessException;

	public int boardListCnt(SearchCriteria scri) throws Exception;

	public List<Map<String, Object>> boardList(SearchCriteria scri) throws Exception;

	// 프로그램 상세조회
	public ProgramVO selectProgram(String PROGRAM_NO);

	public List<Map<String, String>> file(String PROGRAM_NO);

	public List<String> selectFileNO(String empFileNO);

	// 게시물 수정
	public int updatefile(Map articleMap);

	public int updatefile2(Map articleMap);

	public void proupdate(ProgramVO programVO) throws Exception;

	// 게시물 삭제
	public void deletefile(Map articleMap);

	public void prodelete(int PROGRAM_NO);

	// 기업프로그램신청 (다중파일)
	int addResult(Map articleMap) throws Exception;

	public ProgramVO selectLegister(ProgramVO programVO);

	// 캘린더
	public List sDate(String date) throws Exception;

	public List dDate(String date) throws Exception;

	// 취업컨설팅
	public List<Map<String, Object>> boardList2(SearchCriteria scri);

	public int boardListCnt2(SearchCriteria scri);

	// 취업특강
	public List<Map<String, Object>> boardList3(SearchCriteria scri);

	public int boardListCnt3(SearchCriteria scri);

	

	// 채용공고
	public int postingListCnt(SearchCriteria scri) throws Exception;

	// 채용공고
	public List<Map<String, String>> postingList(SearchCriteria scri) throws Exception;

	// 채용공고 조회
	public JobInfoVO selectJobPosting(int JOB_NO) throws Exception;

	// 채용공고 상세조회
	public JobInfoVO jobpostingdetail(int JOB_NO) throws Exception;

	// 채용공고 수정
	public void jobpostingupdate(JobInfoVO jobinfoVO) throws Exception;

	// 채용공고 삭제
	public void jobPostingDelete(int JOB_NO) throws Exception;

	// 장바구니 조회
	public ShopBasketVO selectJobPostingInCart(ShopBasketVO ShopBasketVO) throws Exception;

	// 장바구니 리스트
	public List jobPostingInCartList() throws Exception;

	// 장바구니 추가
	public void jobPostingInsertInCart(ShopBasketVO ShopBasketVO) throws Exception;

	// 장바구니 리스트 조회
	public List<Integer> bascketList() throws Exception;

	public int empnoid(String ID) throws Exception;

	// 장바구니 삭제
	public int jobPostingInCartDelete(int JOB_NO) throws Exception;
	
	// 기업 마이페이지(프로그램 신청자 확인)
	// public List<Map<String, Object>> companymypage();

	// 기업마이페이지리스트
	 public List<ProgramVO> companymypagelist(String user_id) throws Exception;

	// 기업마이페이지 신청서 상세뷰
	public List<ProgramVO> selectpro(int PROGRAM_NO);

	// 기업마이페이지 승인여부수정
	public void companymypageupdate(String APP, String EMP_PAR_NO);

	// 학생마이페이지리스트
	public List<ProgramVO> studentmypagelist(String user_id) throws Exception;
	public ProgramVO selectProgram2(String PROGRAM_NO);
	

}
