package com.jobjava.JJ.member.service;

import java.util.HashMap;

import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jobjava.JJ.member.vo.CMemberVO;
import com.jobjava.JJ.member.vo.EMemberVO;
import com.jobjava.JJ.member.vo.MMemberVO;
import com.jobjava.JJ.member.vo.MemberVO;
import com.jobjava.JJ.member.vo.NMemberVO;
import com.jobjava.JJ.member.vo.SMemberVO;

@Transactional(propagation=Propagation.REQUIRED)
public interface MemberService {
	public boolean insertUserInfo(MemberVO membervo) throws Exception;
	public MemberVO myInfo(String userId) throws Exception;
	public NMemberVO NUmyInfo(String userId) throws Exception;
	public SMemberVO SUmyInfo(String userId) throws Exception;
	public CMemberVO COMmyInfo(String userId) throws Exception;	
	public EMemberVO EMPmyInfo(String userId) throws Exception;
	public MMemberVO MAGmyInfo(String userID) throws Exception;
	public void upDateMember(HashMap<String, String> member, String AUTHORITY) throws Exception;
	public void logST_Logout() throws Exception;
	public String id_check(String userID) throws Exception;
	public String email_check(String email) throws Exception;
	public String idFind(String email) throws Exception;
	public void deleteMember(String userID) throws Exception;
}
