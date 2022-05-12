package com.jobjava.JJ.counselor.dao;

import java.util.HashMap;

import com.jobjava.JJ.counselor.vo.JobregVO;

public interface CounselorDAO {
	public HashMap<String, String> JobDao();
	public HashMap<String, String> JobDao2();
	
	public void insertNewJob(HashMap<String, String> jobregVO);
	public String selectNewJobID(HashMap<String, String> jobregVO);
	
	public void insertNewUni(HashMap<String, String> UniregVO);
	public String selectUniID(HashMap<String, String> UniregVO);

}
