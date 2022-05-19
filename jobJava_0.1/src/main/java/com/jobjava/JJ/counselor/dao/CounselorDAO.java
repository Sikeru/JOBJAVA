package com.jobjava.JJ.counselor.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
 
import com.jobjava.JJ.counselor.vo.CriteriaVO;
import com.jobjava.JJ.counselor.vo.UniregVO;


public interface CounselorDAO {
	public HashMap<String, String> JobDao();
	public HashMap<String, String> JobDao2();

	public void insertNewJob(HashMap<String, String> jobregVO);
	public String selectNewJobID(HashMap<String, String> jobregVO);
	
	public void insertNewUni(HashMap<String, String> uniregVO);
	public String selectUniID(HashMap<String, String> uniregVO);
	
	
	// 참여목록
	public List<UniregVO> uniList() throws Exception;
	
	/* public UniregVO uniread(String UNI_B_NO); */
	public UniregVO selectProgram(String unibno) throws Exception;
	
	public void updatePermissionState(HashMap unireg);

	public List<HashMap<String, String>> JobDao3();

	public List<HashMap<String, String>> attendanceDao();

	public List<HashMap<String, String>> commuteDao(HashMap<String, String> commuteDate);
	
	/* public List<Map<String, Object>> boardList(CriteriaVO cri); */

	/* public int boardListCnt(); */
	
	public List<HashMap<String, Object>> selectAllBasketInfo(String user_id);
	public List<HashMap<String, String>> selectAllChMember(String user_id);
	public void memberMatching(HashMap<String, String> member);
	
}
