package com.jobjava.JJ.member.service;

import java.util.HashMap;

import com.jobjava.JJ.member.vo.MemberVO;
import com.jobjava.JJ.member.vo.NMemberVO;
import com.jobjava.JJ.member.vo.SMemberVO;

public interface MemberService {
	public boolean insertUserInfo(MemberVO membervo);
	public MemberVO myInfo(String userId);
	public NMemberVO NUmyInfo(String userId);
	public SMemberVO SUmyInfo(String userId);
	public void upDateMember(HashMap<String, String> member, String AUTHORITY);
}
