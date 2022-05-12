package com.jobjava.JJ.cafe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.cafe.vo.Criteria;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;

public interface CafeDAO {
	//구직정보 등록
	public void  jobAppresultAdd(JobAppVO jobAppVO);
	//구직 id값 불러오기
	public String selectMemberID(JobAppVO jobAppVO);
	//기업정보 등록
	public void  mypageresultAdd(HashMap<String, String> myPageVO);
	//기업 id값 불러오기
	public String selectCompanyID(HashMap<String, String> myPageVO);
	
	int selectAllArticlesList = 0;

	public List<ProgramVO> selcetProgram();

	public int selectTotArticles();

	public List<Map<String, Object>> boardList(Criteria cri) throws Exception;

	public int boardListCnt() throws Exception;
	
	public List selectSdata(String date);
	public List selectDdata(String date);
}


