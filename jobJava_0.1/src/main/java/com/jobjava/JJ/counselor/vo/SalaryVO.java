package com.jobjava.JJ.counselor.vo;

import java.sql.Date;

public class SalaryVO {
	
	private String ID;
	private Date COM_DATE;
	private int SAL;
	private String PROCESS;
	private static int COM_NO;
	
	
	public static int getCOM_NO() {
		return COM_NO;
	}
	public void setCOM_NO(int cOM_NO) {
		COM_NO = cOM_NO;
	}
	public Date getCOM_DATE() {
		return COM_DATE;
	}
	public String getID() {
		return ID;
	}
	public String getPROCESS() {
		return PROCESS;
	}
	public int getSAL() {
		return SAL;
	}
	public void setCOM_DATE(Date cOM_DATE) {
		COM_DATE = cOM_DATE;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public void setPROCESS(String pROCESS) {
		PROCESS = pROCESS;
	}
	public void setSAL(int sAL) {
		SAL = sAL;
	}
}