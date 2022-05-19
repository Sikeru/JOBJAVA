package com.jobjava.JJ.main.service;

import java.util.HashMap;
import java.util.List;

public interface MainService {
	public void mnLog(String mnName);
	public List<HashMap<String,String>> selectBestCompany();
	public int insertBestCompany(String filename,String bc_name,String bc_hp);
	public void deleteBestCompany(String bc_no);
	public void updateBestCompany(HashMap<String, String> company);

}
