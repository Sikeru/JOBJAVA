package com.jobjava.JJ.cafe.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class ProgramVO {
	private int PROGRAM_NO;
	private int EMP_NO;
	private String TITLE;
	private String CONTENT;
	private Date S_DATE;
	private Date E_DATE;
	private String FILENAME;
	private String DIVISION;
	
	public int getPROGRAM_NO() {
		return PROGRAM_NO;
	}
	public void setPROGRAM_NO(int pROGRAM_NO) {
		PROGRAM_NO = pROGRAM_NO;
	}
	public int getEMP_NO() {
		return EMP_NO;
	}
	public void setEMP_NO(int eMP_NO) {
		EMP_NO = eMP_NO;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public Date getS_DATE() {
		return S_DATE;
	}
	public void setS_DATE(Date s_DATE) {
		S_DATE = s_DATE;
	}
	public Date getE_DATE() {
		return E_DATE;
	}
	public void setE_DATE(Date e_DATE) {
		E_DATE = e_DATE;
	}
	public String getFILENAME() {
		return FILENAME;
	}
	public void setFILENAME(String fILENAME) {
		FILENAME = fILENAME;
	}
	public String getDIVISION() {
		return DIVISION;
	}
	public void setDIVISION(String dIVISION) {
		DIVISION = dIVISION;
	}
	
	
	
	
//	private ArrayList<GrantedAuthority> authority;
	
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//		return authority;
//	}
//	
//	public void setAuthority(ArrayList<String> authList) {
//		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
//		for(int i=0;i<authList.size();i++) {
//			auth.add(new SimpleGrantedAuthority(authList.get(i)));
//		}
//		this.authority=auth;
//	}
	
	
}