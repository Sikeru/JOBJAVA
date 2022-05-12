package com.jobjava.JJ.leader.vo;

import java.sql.Date;

public class CRegVO {
	private int REGI_NO;
	private String B_NO;
	private String TITLE;
	private String CONTENT;
	private String FILENAME;
	private Date S_DATE;
	private Date E_DATE;
	
	public int getREGI_NO() {
		return REGI_NO;
	}
	public void setREGI_NO(int rEGI_NO) {
		REGI_NO = rEGI_NO;
	}
	public String getB_NO() {
		return B_NO;
	}
	public void setB_NO(String b_NO) {
		B_NO = b_NO;
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
	public String getFILENAME() {
		return FILENAME;
	}
	public void setFILENAME(String fILENAME) {
		FILENAME = fILENAME;
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
	
}
