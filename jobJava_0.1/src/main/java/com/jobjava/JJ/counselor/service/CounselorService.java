package com.jobjava.JJ.counselor.service;

import java.util.HashMap;
import java.util.List;

import com.jobjava.JJ.counselor.vo.JobregVO;


public interface CounselorService {

	public List<HashMap<String, String>> JobList();
	public void addJob(HashMap<String, String> jobregVO);
	public void addUni(HashMap<String, String> UniregVO);
	
	
}