package com.jobjava.JJ.admin.service;

import java.util.HashMap;
import java.util.List;

import com.jobjava.JJ.admin.vo.SearchCriteria;
import com.jobjava.JJ.member.vo.MemberVO;

public interface AdminService {
	public List<MemberVO> selectAllMember(SearchCriteria scri);
	public int selectAllMemberCnt(SearchCriteria scri);
	public void updateMember(MemberVO _memberVO);
	public int selectAllLoginStatisticsCnt(SearchCriteria scri);
	public List<HashMap <String,String>> selectAllLoginStatistics(SearchCriteria scri);
	public List<String> selectAuthorityStatistics();
	public List<HashMap <String,String>> selectAllMemuLog();

}
