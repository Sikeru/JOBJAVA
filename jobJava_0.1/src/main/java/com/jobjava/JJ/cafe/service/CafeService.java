package com.jobjava.JJ.cafe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.jobjava.JJ.cafe.vo.Criteria;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.MyPageVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;


public interface CafeService{
	public void insertJob(JobAppVO jobAppVO);
	
public List<ProgramVO> boardList() throws DataAccessException;

	public int boardListCnt() throws Exception;

	public List<Map<String, Object>> boardList(Criteria cri) throws Exception;
	public void insertCompany(HashMap<String, String> company);
	
	public MyPageVO selectLegister(MyPageVO myPageVO);
	
	public List sDate(String date) throws Exception;
	public List dDate(String date) throws Exception;
}
