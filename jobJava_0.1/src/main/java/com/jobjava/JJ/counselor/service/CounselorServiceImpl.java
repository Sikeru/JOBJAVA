package com.jobjava.JJ.counselor.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobjava.JJ.counselor.dao.CounselorDAO;
import com.jobjava.JJ.counselor.vo.JobregVO;
import com.jobjava.JJ.counselor.vo.UniregVO;

@Service("CounselorService")
public class CounselorServiceImpl implements CounselorService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<HashMap<String, String>> JobList (){
		List<HashMap<String, String>> counselor = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		counselor.add(dao.JobDao());
		counselor.add(dao.JobDao2());
		return counselor;
	}

	public void insertJob(HashMap<String, String> job) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		job.put("JOB_NO", dao.selectNewJobID(job));
//		dao.insertNewJob(job);
		
	}

	public JobregVO selectLegister(JobregVO jobregVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		JobregVO jobregvo = new JobregVO();
		return jobregvo;
	}
	
	public void addJob(HashMap<String, String> jobregVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.insertNewJob(jobregVO);
	}
	
	public UniregVO selectUniID(JobregVO uniregVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		UniregVO uniregvo = new UniregVO();
		return uniregvo;
	}

	public void addUni(HashMap<String, String> uniregVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.insertNewUni(uniregVO);
	}
	
}
