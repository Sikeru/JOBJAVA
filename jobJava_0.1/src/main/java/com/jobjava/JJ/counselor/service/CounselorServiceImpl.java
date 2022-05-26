package com.jobjava.JJ.counselor.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobjava.JJ.counselor.dao.CounselorDAO;
import com.jobjava.JJ.counselor.vo.CriteriaVO;
import com.jobjava.JJ.counselor.vo.JobregVO;
import com.jobjava.JJ.counselor.vo.SearchCriteria;
import com.jobjava.JJ.counselor.vo.SturegVO;
import com.jobjava.JJ.counselor.vo.UniregVO;

@Service("CounselorService")
public class CounselorServiceImpl implements CounselorService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<HashMap<String, String>> JobList() {
		List<HashMap<String, String>> counselor = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		counselor = dao.JobDao();
		counselor.addAll(dao.JobDao2());
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
		// 리스트로 가져오고 스트링 타입이다.
		List<HashMap<String, String>> counselor1 = new ArrayList<HashMap<String, String>>();
		//
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		// 이름을 dao로 하겠다. sql의 데이터를 가져오겠다.(경로?)
		counselor1 = dao.JobDao3();
		// 리스트 타입으로 JobDao3가져오겠다.
		System.out.println(counselor1);
		return counselor1;
		// 컨트롤러로 가겠다.
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

	// 대학교 등록 목록 페이징 오류나면 살리기 (20220519(
	
//	  @Override public List<UniregVO> uniList() throws Exception { 
//		  CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class); 
//		  return dao.uniList(); 
//		  }
	 
	
	@Override
	   public UniregVO selectProgram(int UNI_B_NO)throws Exception {
	      CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
	      return dao.selectProgram(UNI_B_NO);
	   }

	@Override
	public void regcheck(HashMap<String, String> uniregVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);

	}
	

	@Override
	public void addUni(HashMap<String, String> UniregVO) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void modifyuniregState(HashMap<String, String> uniregVO) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public int counseolrServiceCnt(SearchCriteria scri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.counseolrServiceCnt(scri);
	}

	public List<Map<String, Object>> boardList(SearchCriteria scri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.boardList(scri);
	}
	
	//업무일지
	@Override
	public List<HashMap<String, String>> journalList() {
		List<HashMap<String, String>> journalCheck = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		journalCheck = dao.journalDao();
		System.out.println(journalCheck);
		return journalCheck;
	}
		
	public List<Map<String, Object>> journalList(SearchCriteria scri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.journalList(scri);
	}
	
	@Override
	public void update(UniregVO uniregVO) throws Exception {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.update(uniregVO);
	}

	  @Override
	  public void delete(int UNI_B_NO) throws Exception {
		  CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
	      dao.delete(UNI_B_NO);
	   }


	@Override
	public int uniregListCnt(CriteriaVO cri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.uniregListCnt(cri);
	}


	@Override
	public List<Map<String, Object>> uniregList(CriteriaVO cri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.uniregList(cri);
	}
	
	// 학생 등록
	public void addstu(HashMap<String, String> sturegVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
	   dao.insertNewStu(sturegVO);
			}
			
	// 학생 등록 목록
	@Override
	public List<SturegVO> stulist() throws Exception {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			return dao.stuList();
		}


	@Override
		public void addcompany(HashMap<String, String> comregVO) {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			dao.insertNewCompany(comregVO);
			}
	
	// 일자리 매칭
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