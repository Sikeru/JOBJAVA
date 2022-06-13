package com.jobjava.JJ.counselor.vo;

import java.sql.Date;

public class SturegVO {
	private int ST_NO;
	private int CM_NO;
	private String ID;
	private int MG_NO;
	private String NAME;
	private String DEPT;
	private String MAC_ADDR;
	private Date BIRTH;
	private String U_NAME;
	private String EMAIL;
	private String HP;
	private String ADDR;
	
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
	public int getCM_NO() {
		return CM_NO;
	}
	public void setCM_NO(int cM_NO) {
		CM_NO = cM_NO;
	}
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
