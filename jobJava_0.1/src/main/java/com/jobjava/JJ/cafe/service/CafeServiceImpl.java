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
import com.jobjava.JJ.cafe.vo.Criteria;
import com.jobjava.JJ.cafe.vo.FileVO;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;

@Service("cafeService")
@Transactional(propagation = Propagation.REQUIRED)
public class CafeServiceImpl implements CafeService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertJob(JobAppVO jobAppVO) {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		dao.jobAppresultAdd(jobAppVO);
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
	public ProgramVO selectProgram(int programNO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		return dao.selectProgram(programNO);
	}

	// 채용정보 수정
	@Override
	public void update(ProgramVO programVO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		dao.update(programVO);
	}
	// 채용정보 삭제

	@Override
	public void delete(ProgramVO programVO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		dao.delete(programVO);
	}

	@Override
	public void delete(int i) throws Exception {
		// TODO Auto-generated method stub

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
//			articleMap.put("B_NO", dao.selectCompanyID(articleMap));
//		     dao.insertNewArticle(articleMap);
//		     int pROGRAM_NO = dao.insertNewArticle(articleMap);
//		     articleMap.put("PROGRAM_NO", pROGRAM_NO);
//		     dao.insertNewImage(articleMap);
//			
		// return pROGRAM_NO;

		return eMP_FILE;
	}

	// 프로그램신청게시판 이미지 삭제 (수정)
	@Override
	public void removeModImage(FileVO fileVO) throws Exception {
		CafeDAO dao = sqlSession.getMapper(CafeDAO.class);
		dao.deleteModImage(fileVO);
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

}
