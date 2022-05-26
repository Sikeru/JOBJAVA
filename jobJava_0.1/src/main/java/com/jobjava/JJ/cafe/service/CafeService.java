package com.jobjava.JJ.cafe.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.jobjava.JJ.cafe.vo.FileVO;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.JobInfoVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;

public interface CafeService {
	public void insertJob(JobAppVO jobAppVO);

	// 프로그램 검색
	public List<ProgramVO> boardList() throws DataAccessException;

	public int boardListCnt(SearchCriteria scri) throws Exception;

	public List<Map<String, Object>> boardList(SearchCriteria scri) throws Exception;

	// 프로그램 상세조회
	public ProgramVO selectProgram(String programNO);

	public List<Map<String, String>> file(String programNO);

	public List<String> selectFileNO(String empFileNO);

	// 게시물 수정
	public void update(ProgramVO programVO) throws Exception;

	// 게시물 삭제
	public void delete(int programNO) throws Exception;

	// 기업프로그램신청 (다중파일)
	int addResult(Map articleMap) throws Exception;

	public ProgramVO selectLegister(ProgramVO programVO);

	// 프로그램신청이미지삭제
	public void removeModImage(FileVO fileVO) throws Exception;

	// 캘린더
	public List sDate(String date) throws Exception;

	public List dDate(String date) throws Exception;

	// 취업컨설팅
	public List<Map<String, Object>> boardList2(SearchCriteria scri);

	public int boardListCnt2(SearchCriteria scri);

	// 채용공고
	public int postingListCnt(SearchCriteria scri) throws Exception;

	// 채용공고
	public List<Map<String, Object>> postingList(SearchCriteria scri) throws Exception;

	// 채용공고 조회
	public JobInfoVO selectJobPosting(int JOB_NO) throws Exception;

	// 채용공고 상세조회
	public JobInfoVO jobpostingdetail(int JOB_NO) throws Exception;

	// 채용공고 수정
	public void jobpostingupdate(JobInfoVO jobinfoVO) throws Exception;

	// 채용공고 삭제
	public void jobPostingDelete(int JOB_NO) throws Exception;

}
