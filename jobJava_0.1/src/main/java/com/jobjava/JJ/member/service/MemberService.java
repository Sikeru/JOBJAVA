package com.jobjava.JJ.member.service;

import java.util.HashMap;

import com.jobjava.JJ.member.vo.CMemberVO;
import com.jobjava.JJ.member.vo.EMemberVO;
import com.jobjava.JJ.member.vo.MemberVO;
import com.jobjava.JJ.member.vo.NMemberVO;
import com.jobjava.JJ.member.vo.SMemberVO;

public interface MemberService {
	public boolean insertUserInfo(MemberVO membervo);
	public MemberVO myInfo(String userId);
	public NMemberVO NUmyInfo(String userId);
	public SMemberVO SUmyInfo(String userId);
	public CMemberVO COMmyInfo(String userId);	
	public EMemberVO EMPmyInfo(String userId);
	public void upDateMember(HashMap<String, String> member, String AUTHORITY);
	public void logST_Logout();
}
