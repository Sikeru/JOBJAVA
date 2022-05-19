package com.jobjava.JJ.counselor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
 
import com.jobjava.JJ.counselor.vo.CriteriaVO;
import com.jobjava.JJ.counselor.vo.UniregVO;

public interface CounselorService {

	public List<HashMap<String, String>> JobList();

	public void addJob(HashMap<String, String> jobregVO);

	public void adduni(HashMap<String, String> uniregVO);

	public void regcheck(HashMap<String, String> uniregVO);

	public List<UniregVO> uniList() throws Exception;

	/* public UniregVO uniread(int UNI_B_NO); */

	public UniregVO selectProgram(String unibno) throws Exception;

	public void modifyuniregState(HashMap<String, String> uniregVO);

	public List<HashMap<String, String>> JobList2();

	public List<HashMap<String, String>> attendancelist();

	public List<HashMap<String, String>> commutelist(HashMap<String, String> commuteDate);

	public void addUni(HashMap<String, String> unireg);
	
	public List<HashMap<String, Object>> selectAllBasketInfo(String user_id);
	public List<HashMap<String, String>> selectAllChMember(String user_id);
	public void memberMatching(HashMap<String, String> member);

	/*
	 * public int boardListCnt();
	 * 
	 * public List<Map<String, Object>> boardList(CriteriaVO cri);
	 */

}
