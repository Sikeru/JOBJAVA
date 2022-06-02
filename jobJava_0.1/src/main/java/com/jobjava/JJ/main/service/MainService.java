package com.jobjava.JJ.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.main.vo.SearchCriteria;

public interface MainService {
	public void mnLog(String mnName);
	public List<HashMap<String,String>> selectBestCompany();
	public int insertBestCompany(String filename,String bc_name,String bc_hp);
	public void deleteBestCompany(String bc_no);
	public void updateBestCompany(HashMap<String, String> company);
	public List<Map<String, Object>> selectAllF_BOARD(SearchCriteria scri);
	public int boardListCnt(SearchCriteria scri);
	public List<HashMap<String, String>> selectF_BoardTOP3();
}
