package com.jobjava.JJ.cafe.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.jobjava.JJ.cafe.vo.Criteria;
import com.jobjava.JJ.cafe.vo.FileVO;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;

public interface CafeDAO {
	// 구직정보 등록
	public void jobAppresultAdd(JobAppVO jobAppVO);

	// 구직 id값 불러오기
	public String selectMemberID(JobAppVO jobAppVO);

	// 프로그램신청(다중파일)
	public int insertNewArticle(Map articleMap) throws DataAccessException;

	public void insertNewImage(List<FileVO> imageFileList) throws DataAccessException;

	public int selectNewImageFileNO();

	public int selectPROGRAM_NO(Map articleMap);

	// 프로그램신청 파일삭제
	void deleteModImage(FileVO fileVO) throws DataAccessException;

	// 프로그램신청 파일수정
	void updateImageFile(Map articleMap) throws DataAccessException;

	// 프로그램신청 파일추가
	void insertModNewImage(Map articleMap) throws DataAccessException;

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
	public ProgramVO selectProgram(int programNO)throws Exception;

	// 채용정보 수정
	public void update(ProgramVO programVO) throws Exception;

	// 채용정보 삭제
	public void delete(ProgramVO programVO) throws Exception;

	// 캘린더
	public List selectSdata(String date);

	public List selectDdata(String date);

}
