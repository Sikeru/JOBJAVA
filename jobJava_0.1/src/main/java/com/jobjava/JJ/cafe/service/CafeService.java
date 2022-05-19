package com.jobjava.JJ.cafe.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.jobjava.JJ.cafe.vo.FileVO;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;

public interface CafeService {
	public void insertJob(JobAppVO jobAppVO);

	// 채용정보검색
	public List<ProgramVO> boardList() throws DataAccessException;

	public int boardListCnt(SearchCriteria scri) throws Exception;

	public List<Map<String, Object>> boardList(SearchCriteria scri) throws Exception;

	// 채용정보 상세조회
	public ProgramVO selectProgram(int programNO) throws Exception;

	// 게시물 수정
	public void update(ProgramVO programVO) throws Exception;

	// 게시물 삭제
	public void delete(int i) throws Exception;

	void delete(ProgramVO programVO) throws Exception;

	
	// 기업프로그램신청 (다중파일)
	int addResult(Map articleMap) throws Exception;

	public ProgramVO selectLegister(ProgramVO programVO);

	// 프로그램신청이미지삭제
	public void removeModImage(FileVO fileVO) throws Exception;

	// 캘린더
	public List sDate(String date) throws Exception;

	public List dDate(String date) throws Exception;

}
