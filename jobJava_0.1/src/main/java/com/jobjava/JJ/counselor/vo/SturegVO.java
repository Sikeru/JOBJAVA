package com.jobjava.JJ.counselor.vo;

import java.sql.Date;

public class SturegVO {
	private int ST_NO;
	private String ID;
	private int MG_NO;
	private String NAME;
	private String DEPT;
	private String MAC_ADDR;
	private Date BIRTH;
	private String U_NAME;
	
	public int getST_NO() {
		return ST_NO;
	}
	public void setST_NO(int sT_NO) {
		ST_NO = sT_NO;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public int getMG_NO() {
		return MG_NO;
	}
	public void setMG_NO(int mG_NO) {
		MG_NO = mG_NO;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getDEPT() {
		return DEPT;
	}
	public void setDEPT(String dEPT) {
		DEPT = dEPT;
	}
	public String getMAC_ADDR() {
		return MAC_ADDR;
	}
	public void setMAC_ADDR(String mAC_ADDR) {
		MAC_ADDR = mAC_ADDR;
	}
	public Date getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(Date bIRTH) {
		BIRTH = bIRTH;
	}
	public String getU_NAME() {
		return U_NAME;
	}
	public void setU_NAME(String u_NAME) {
		U_NAME = u_NAME;
	}

}
