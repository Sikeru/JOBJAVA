package com.jobjava.JJ.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jobjava.JJ.member.vo.MemberVO;
import com.jobjava.JJ.member.vo.NMemberVO;
import com.jobjava.JJ.member.vo.SMemberVO;


public interface memberDAO {
	public MemberVO loginselectUser(String username);
	public MemberVO selectUser(MemberVO membervo);
	public ArrayList<String> getAuthList(String username);
	public void giveAuth(String username, String authority);
	public void userSignUp(MemberVO membervo);
	public void NuserSignUp(MemberVO membervo);
	public void SuserSignUp(MemberVO membervo);
	public MemberVO selectUserInfo(String userId);
	public NMemberVO selectNUserInfo(String userId);
	public SMemberVO selectSUserInfo(String userId);
	public void upDateU(HashMap member);
	public void upDateNU(HashMap member);
	public void upDateSU(HashMap member);
}