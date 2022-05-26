package com.jobjava.JJ.counselor.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.counselor.vo.CriteriaVO;
import com.jobjava.JJ.counselor.vo.SearchCriteria;
import com.jobjava.JJ.counselor.vo.SturegVO;
import com.jobjava.JJ.counselor.vo.UniregVO;

public interface CounselorDAO {
	public List<HashMap<String, String>> JobDao();

	public List<HashMap<String, String>> JobDao2();

	public void insertNewJob(HashMap<String, String> jobregVO);

	public String selectNewJobID(HashMap<String, String> jobregVO);

	public void insertNewUni(HashMap<String, String> uniregVO);

	public String selectUniID(HashMap<String, String> uniregVO);
	
	public void update(UniregVO uniregVO) throws Exception;
	
	public void delete(int UNI_B_NO) throws Exception;

	/* public UniregVO uniread(String UNI_B_NO); */
	public UniregVO selectProgram(int UNI_B_NO) throws Exception;

	public void updatePermissionState(HashMap unireg);

	public List<HashMap<String, String>> JobDao3();

	public List<HashMap<String, String>> commuteDao(HashMap<String, String> commuteDate);
	
	// 페이징
	public List<HashMap<String, Object>> boardList();
	
	// 게시글 총 갯수
	public int boardListCnt(SearchCriteria scri);
	public List<Map<String, Object>> boardList(SearchCriteria scri);
	
	//업무일지
		public List<HashMap<String, String>> journalDao();

		public List<Map<String, Object>> journalList(SearchCriteria scri);
	
	


	// 기업번호조회
//	public CRegVO selectRegi(String regiNO);

	public int counseolrServiceCnt(SearchCriteria scri);

	public List<HashMap<String, String>> attendanceDao();
	
	// 오류나면 지우기 (20220519)
	
	public List<Map<String, Object>> uniregList(CriteriaVO cri);
	public int uniregListCnt(CriteriaVO cri);
	
	// 뉴리더 학생, 기업 등록 리스트 및 폼 작성
	public void insertNewStu(HashMap<String, String> sturegVO);
	
	public List<SturegVO> stuList() throws Exception;
	
	public void insertNewCompany(HashMap<String, String> comregVO);
	
	// 일자리 매칭
	public List<HashMap<String, Object>> selectAllBasketInfo(String user_id);
	public List<HashMap<String, String>> selectAllChMember(String user_id);
	public void memberMatching(HashMap<String, String> member);



}