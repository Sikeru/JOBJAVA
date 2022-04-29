package com.jobjava.JJ.member.vo;

import java.sql.Date;

public class NMemberVO {
	private String ID;
	private String PWD;
	private String HP;
	private String ADDR;
	private String EMAIL;
	private String AUTHORITY;
	private boolean ENABLED;
	private int NM_NO;
	private String NAME;
	private String J_SEARCH;
	private Date BIRTH;
	private String LAST_EDU;
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPWD() {
		return PWD;
	}
	public void setPWD(String pWD) {
		PWD = pWD;
	}
	public String getHP() {
		return HP;
	}
	public void setHP(String hP) {
		HP = hP;
	}
	public String getADDR() {
		return ADDR;
	}
	public void setADDR(String aDDR) {
		ADDR = aDDR;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getAUTHORITY() {
		return AUTHORITY;
	}
	public void setAUTHORITY(String aUTHORITY) {
		AUTHORITY = aUTHORITY;
	}
	public boolean isENABLED() {
		return ENABLED;
	}
	public void setENABLED(boolean eNABLED) {
		ENABLED = eNABLED;
	}
	public int getNM_NO() {
		return NM_NO;
	}
	public void setNM_NO(int nM_NO) {
		NM_NO = nM_NO;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getJ_SEARCH() {
		return J_SEARCH;
	}
	public void setJ_SEARCH(String j_SEARCH) {
		J_SEARCH = j_SEARCH;
	}
	public Date getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(Date bIRTH) {
		BIRTH = bIRTH;
	}
	public String getLAST_EDU() {
		return LAST_EDU;
	}
	public void setLAST_EDU(String lAST_EDU) {
		LAST_EDU = lAST_EDU;
	}

}
