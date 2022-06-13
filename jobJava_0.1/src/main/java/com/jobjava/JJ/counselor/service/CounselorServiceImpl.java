package com.jobjava.JJ.counselor.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobjava.JJ.counselor.dao.CounselorDAO;
import com.jobjava.JJ.counselor.vo.ConsultationJournalVO;
import com.jobjava.JJ.counselor.vo.JobregVO;
import com.jobjava.JJ.counselor.vo.SalaryVO;
import com.jobjava.JJ.counselor.vo.SearchCriteria;
import com.jobjava.JJ.counselor.vo.UniregVO;
import com.jobjava.JJ.counselor.vo.AlarmVO;
import com.jobjava.JJ.counselor.vo.ComregVO;
import com.jobjava.JJ.counselor.vo.CriteriaVO;
import com.jobjava.JJ.counselor.vo.JobcheckVO;
import com.jobjava.JJ.counselor.vo.SturegVO;


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
	
	public void addJou(HashMap<String, String> consultationJournalVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.consultationJournalList(consultationJournalVO);
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
	
	
	// 등록된 기업 수정 삭제 기능
	public void jobupdate(JobregVO jobregVO) throws Exception{
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.jobupdate(jobregVO);
	}
	
	public void jobdelete(int JOB_NO) throws Exception{
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.jobdelete(JOB_NO);
	}
	@Override
	public List<Map<String, Object>> uniregList(CriteriaVO cri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.uniregList(cri);
	}
	
	@Override
	public int uniregListCnt(CriteriaVO cri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.uniregListCnt(cri);
	}
	// 대학교 목록
	@Override
	public List<UniregVO> uniList() throws Exception {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.uniList();
	}

//	@Override
//	public UniregVO selectProgram(String unibno) throws Exception {
//		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
//		return dao.selectProgram(unibno);
//	}
	
	@Override
	   public UniregVO selectProgram(int UNI_B_NO)throws Exception {
	      CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
	      return dao.selectProgram(UNI_B_NO);
	   }
	
	@Override
	public SturegVO selectStu(String CM_NO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.selectStu(CM_NO);
	}
	
	@Override
	public ComregVO selectCom(String CM_NO){
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.selectCom(CM_NO);
	}

	@Override
	public void regcheck(HashMap<String, String> uniregVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);

	}

	@Override
	public void addUni(HashMap<String, String> UniregVO) {
		// TODO Auto-generated method stub

	}

	public List<HashMap<String, String>> JobList2() {
		// 리스트로 가져오고 스트링 타입이다.
		List<HashMap<String, String>> counselor1 = new ArrayList<HashMap<String, String>>();
		//
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		// 이름을 dao로 하겠다. sql의 데이터를 가져오겠다.(경로?)
		counselor1 = dao.JobDao3();
		// 리스트 타입으로 JobDao3가져오겠다.
//		System.out.println(counselor1);
		return counselor1;
		// 컨트롤러로 가겠다.
	}
	
	@Override
	public List<HashMap<String, String>> attendancelist() {
		List<HashMap<String, String>> attendanceCheck = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		attendanceCheck = dao.attendanceDao();
//		System.out.println(attendanceCheck);
		return attendanceCheck;
	}

	@Override
	public void modifyuniregState(HashMap<String, String> uniregVO) {
		// TODO Auto-generated method stub

	}

	// 출석관리 이름검색 페이징

	@Override
	public int counseolrServiceCnt(SearchCriteria scri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.counseolrServiceCnt(scri);
	}

	public List<Map<String, Object>> boardList(SearchCriteria scri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.boardList(scri);
	}

	@Override
	public List<HashMap<String, String>> commutelist(HashMap<String, String> commuteDate) {
		List<HashMap<String, String>> commuteController = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		commuteController = dao.commuteDao(commuteDate);
	//	System.out.println(commuteController);
		return commuteController;
	}
	
	// 출석관리 날짜검색 페이징
	public List<Map<String, Object>> calendarList(SearchCriteria scri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.boardList(scri);
	}

	@Override
	public List<Map<String, Object>> calendarList(HashMap<String, String> commuteDate, SearchCriteria scri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return boardList(scri);
	}

	// 업무일지
	@Override
	public List<HashMap<String, String>> journalList() {
		List<HashMap<String, String>> counselor = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return counselor;
	}

	public List<HashMap<String, Object>> journalList(SearchCriteria scri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.journalList(scri);
	}

	// 학생 급여 조회
	@Override
	public List<HashMap<String, String>> studentSalaryList() {
		List<HashMap<String, String>> counselor = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return counselor;
	}

	public List<HashMap<String, Object>> studentSalaryList(SearchCriteria scri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.studentSalaryList(scri);
	}

	// 대학사업비 조회
	@Override
	public List<HashMap<String, String>> universitySalaryList() {
		List<HashMap<String, String>> counselor = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return counselor;
	}

	public List<HashMap<String, Object>> universitySalaryList(SearchCriteria scri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.universitySalaryList(scri);
	}
	// 학생 급여 조회
	@Override
	public List<HashMap<String, String>> consultationList() {
		List<HashMap<String, String>> counselor = new ArrayList<HashMap<String, String>>();
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return counselor;
	}

	public List<HashMap<String, Object>> consultationList(SearchCriteria scri) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.consultationList(scri);
	}

//	@Override
//	public UniregVO selectProgram(int programNO) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int counseolrServiceCnt2(SearchCriteria scri) throws Exception {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.counseolrServiceCnt2(scri);
	}

	@Override
	public List<Map<String, Object>> boardList2(SearchCriteria scri) throws Exception {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.boardList2(scri);
	}
	
	public void updateName(String process, String comNO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.updateNaem(process, comNO);
	}
	
	public void updateNameList(String permission, String unibNO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.updateNameList(permission,unibNO);
	}
	
	@Override
	public void studenupdate(SturegVO sturegVO) throws Exception {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.studenupdate(sturegVO);
	}
	@Override
	public void studenupdate2(SturegVO sturegVO) throws Exception {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.studenupdate2(sturegVO);
	}
	
	@Override
	public int studendelete(int CM_NO) throws Exception {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.studendelete(CM_NO);
	}
	
	// 기업 등록 목록
	@Override
	public List<ComregVO> comlist() throws Exception {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		return dao.comList();

	}
	// 기업 등록
	@Override
	public void addcompany(HashMap<String, String> comregVO) {
		CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		dao.insertNewCompany(comregVO);
	}
	
	// 기업 삭제<<수지!!!!!>>
		@Override
		public int companydelete(int CM_NO) throws Exception {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
				return dao.companydelete(CM_NO);
			}

		// 기업 수정<<수지!!!!!>>
		@Override
		public void companyupdate(ComregVO comregVO) throws Exception {
				CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
				dao.companyupdate(comregVO);
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
				if(member.get("CM_NO"+i) != null ) {
					_member.put("CM_NO", member.get("CM_NO"+i));
					dao.memberMatching(_member);
				}
			}
			
			
		}

		@Override
		public void checkID(SturegVO sturegVO) {
			 CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		      dao.checkID(sturegVO);
		   }
		@Override
		public List<HashMap <String, String>> JobcheckForm() {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			return dao.selectID();
		}


		@Override
		public void jobcheckAdd(JobcheckVO jobcheckVO) {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			dao.jobcheckAdd(jobcheckVO);
			}


		@Override
		public List<HashMap<String, String>> listAppNO(String id) {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			return dao.listAppNO(id);
		}


		


		@Override
		public List<Map<String, Object>> proList(CriteriaVO cri) {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			return dao.proList(cri);
				
			}
		
		@Override
		public int programListCnt(CriteriaVO cri) {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			return dao.programListCnt(cri);
		}
		
		@Override
		public List<Map<String, Object>> jobList(CriteriaVO cri) {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			return dao.jobList(cri);
		}
		
		
		public int jobListCnt(CriteriaVO cri) {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			return dao.jobListCnt(cri);
		}
		
		public JobregVO selectjob(int JOB_NO) throws Exception {
			 CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		      return dao.selectjob(JOB_NO);
		   }

	
		@Override
		public List<Map<String, Object>> programPermission(CriteriaVO cri) {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			return dao.programPermission(cri);
		}


		@Override
		public int proListCnt(CriteriaVO cri) {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			return dao.proListCnt(cri);
		}
		
		public void proNameList(String permission, String programNO) {
			 CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
		      dao.proNameList(permission,programNO);
		   }
		
		public void programList(String m_result, String regi_NO) {
			CounselorDAO dao = sqlSession.getMapper(CounselorDAO.class);
			dao.programList(m_result, regi_NO);
		}

}
