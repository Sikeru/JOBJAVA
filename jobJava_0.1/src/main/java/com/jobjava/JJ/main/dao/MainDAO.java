package com.jobjava.JJ.main.dao;

import java.util.HashMap;
import java.util.List;

public interface MainDAO {
	public void mnLog(String mnName);
	public List<HashMap<String, String>> selectBestCompany();
	public void insertBestCompany(String bc_name, String filename,String bc_hp);
	public int selectBCNO();
	public void deleteBestCompany(String bc_no);
	public void updateBestCompany(HashMap<String, String> company);
}