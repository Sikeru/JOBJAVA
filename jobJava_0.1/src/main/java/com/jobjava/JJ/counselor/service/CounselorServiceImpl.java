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
	
	public List<HashMap<String, String>> JobList() {
		List<HashMap<String, String>> counselor = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
//		counselor.add(dao.JobDao());
//		counselor.add(dao.JobDao2());
//		System.out.println(counselor);
		return counselor;
	}
	/*
	 * public List<Map<String, Object>> boardList(CriteriaVO cri) { CounselorDAO dao
	 * = sqlSession.getMapper(CounselorDAO.class); return dao.boardList(cri); }
	 */
	

	// -- //

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
	
	
	// -- //
	
	public void insertUni(HashMap<String, String> uni) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		uni.put("UNI_B_NO", dao.selectUniID(uni));
//		dao.insertNewJob(job);
		
	}
	
	public UniregVO selectLegister(UniregVO uniregVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		UniregVO uniregVO1 = new UniregVO();
		return uniregVO1;
	}
	
	public void adduni(HashMap<String, String> uniregVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.insertNewUni(uniregVO);
	}
	
	public List<HashMap<String, String>> JobList2() {
		// 由ъ뒪�듃濡� 媛��졇�삤怨� �뒪�듃留� ���엯�씠�떎.
		List<HashMap<String, String>> counselor1 = new ArrayList<HashMap<String, String>>();
		//
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		// �씠由꾩쓣 dao濡� �븯寃좊떎. sql�쓽 �뜲�씠�꽣瑜� 媛��졇�삤寃좊떎.(寃쎈줈?)
		counselor1 = dao.JobDao3();
		// 由ъ뒪�듃 ���엯�쑝濡� JobDao3媛��졇�삤寃좊떎.
		System.out.println(counselor1);
		return counselor1;
		// 而⑦듃濡ㅻ윭濡� 媛�寃좊떎.
	}
	
	@Override
	public List<HashMap<String, String>> attendancelist() {
		List<HashMap<String, String>> attendanceCheck = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		attendanceCheck = dao.attendanceDao();
		System.out.println(attendanceCheck);
		return attendanceCheck;
	}
	
	@Override
	public List<HashMap<String, String>> commutelist(HashMap<String, String> commuteDate) {
		List<HashMap<String, String>> commuteController = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		commuteController = dao.commuteDao(commuteDate);
		System.out.println(commuteController);
		return commuteController;
	}

	// ���븰援� �벑濡� 紐⑸줉
	@Override
	public List<UniregVO> uniList() throws Exception {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.uniList();
	}
	
	
	@Override
	   public UniregVO selectProgram(String unibno)throws Exception {
	      CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
	      return dao.selectProgram(unibno);
	   }


	@Override
	public void modifyuniregState(HashMap<String, String> unireg) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.updatePermissionState(unireg);
	}


	@Override
	public void regcheck(HashMap<String, String> uniregVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);

	}
	

	@Override
	public void addUni(HashMap<String, String> UniregVO) {
		// TODO Auto-generated method stub
		
	}

	//일자리 매칭
	@Override
	public List<HashMap<String, Object>> selectAllBasketInfo(String user_id) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		List<HashMap<String, Object>> bInfo = new ArrayList<HashMap<String, Object>>();
		bInfo = dao.selectAllBasketInfo(user_id);
		return bInfo;
	}

	@Override
	public List<HashMap<String, String>> selectAllChMember(String user_id) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.selectAllChMember(user_id);
	}


	@Override
	public void memberMatching(HashMap<String, String> member) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		HashMap<String, String> _member = new HashMap<String, String>();
		_member.put("SHOP_NO", member.get("SHOP_NO"));
		for(int i=1;i<member.size();i++) {
			_member.put("CM_NO", member.get("CM_NO"+i));
			dao.memberMatching(_member);
		}
		
		
	}


}
