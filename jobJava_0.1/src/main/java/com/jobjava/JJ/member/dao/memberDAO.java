package com.jobjava.JJ.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jobjava.JJ.member.vo.CMemberVO;
import com.jobjava.JJ.member.vo.EMemberVO;
import com.jobjava.JJ.member.vo.MMemberVO;
import com.jobjava.JJ.member.vo.MemberVO;
import com.jobjava.JJ.member.vo.NMemberVO;
import com.jobjava.JJ.member.vo.SMemberVO;

@Repository
public interface memberDAO {
	public MemberVO loginselectUser(String username);
	public MemberVO selectUser(MemberVO membervo);
	public ArrayList<String> getAuthList(String username);
	public void giveAuth(String username, String authority);
	public void userSignUp(MemberVO membervo);
	public void NuserSignUp(MemberVO membervo);
	public void SuserSignUp(MemberVO membervo);
	public void EuserSignUp(MemberVO membervo);
	public void MuserSignUp(MemberVO membervo);
	public void CuserSignUp(MemberVO membervo);
	public MemberVO selectUserInfo(String userId);
	public NMemberVO selectNUserInfo(String userId);
	public SMemberVO selectSUserInfo(String userId);
	public CMemberVO selectCOMInfo(String userId);
	public EMemberVO selectEMPInfo(String userId);
	public MMemberVO selectMAGInfo(String userId);
	public void upDateU(HashMap member);
	public void upDateNU(HashMap member);
	public void upDateSU(HashMap member);
	public void upDateCOM(HashMap member);
	public void upDateEMP(HashMap member);
	public void upDateMAG(HashMap member);
	public void log_Login(String userId);
	public void log_Logout(String userId);
	public String id_check(String userID);
	public String email_check(String email);
	public String idFind(String email);
	public void deleteMember(String userID);
}