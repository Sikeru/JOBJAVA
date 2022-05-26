package com.jobjava.JJ.counselor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.counselor.vo.CriteriaVO;
import com.jobjava.JJ.counselor.vo.SearchCriteria;
import com.jobjava.JJ.counselor.vo.SturegVO;
import com.jobjava.JJ.counselor.vo.UniregVO;

public interface CounselorService {

	public List<HashMap<String, String>> JobList();

	public void addJob(HashMap<String, String> jobregVO);

	public void adduni(HashMap<String, String> uniregVO);

	public void regcheck(HashMap<String, String> uniregVO);

	// 페이징 오류나면 주석 살리기
	/* public List<UniregVO> uniList() throws Exception; */
	
	public void update(UniregVO uniregVO) throws Exception;
	
	public void delete(int UNI_B_NO) throws Exception;
	
	// 20220519 페이징 부분
	public int uniregListCnt(CriteriaVO cri);
	
	public List<Map<String, Object>> uniregList(CriteriaVO cri);
	


	/* public UniregVO uniread(int UNI_B_NO); */

	public UniregVO selectProgram(int UNI_B_NO) throws Exception;

	public void modifyuniregState(HashMap<String, String> uniregVO);

	public List<HashMap<String, String>> JobList2();

	public List<HashMap<String, String>> attendancelist();

	public List<HashMap<String, String>> commutelist(HashMap<String, String> commuteDate);

	public void addUni(HashMap<String, String> unireg);
	
	public void addstu(HashMap<String, String> sturegVO);
	
	public List<SturegVO> stulist() throws Exception;
	
	public void addcompany(HashMap<String, String> comregVO);
	

	 
	// 출석 조회
	 public int counseolrServiceCnt(SearchCriteria scri) throws Exception;

		public List<Map<String, Object>> boardList(SearchCriteria scri) throws Exception;

		// 업무일지
		public List<HashMap<String, String>> journalList() throws Exception;

		public List<Map<String, Object>> journalList(SearchCriteria scri) throws Exception;
		
	// 일자리 매칭
		public List<HashMap<String, Object>> selectAllBasketInfo(String user_id);
		public List<HashMap<String, String>> selectAllChMember(String user_id);
		public void memberMatching(HashMap<String, String> member);



	
}