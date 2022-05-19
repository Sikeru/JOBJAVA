package com.jobjava.JJ.board.vo;

import java.sql.Date;

public class EmploymentVO {
	private int RECNUM;
	private int EMP_CON_NO;
	private String TITLE;
	private String CONTENT;
	private Date EC_DATE;
	private String ID;
	private String ANSWER;
	private String RESPON;
	private String PROCESS;
	
	public int getRECNUM() {
		return RECNUM;
	}
	public void setRECNUM(int rECNUM) {
		RECNUM = rECNUM;
	}
	
	public int getEMP_CON_NO() {
		return EMP_CON_NO;
	}
	public void setEMP_CON_NO(int eMP_CON_NO) {
		EMP_CON_NO = eMP_CON_NO;
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
	public Date getEC_DATE() {
		return EC_DATE;
	}
	public void setEC_DATE(Date eC_DATE) {
		EC_DATE = eC_DATE;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getANSWER() {
		return ANSWER;
	}
	public void setANSWER(String aNSWER) {
		ANSWER = aNSWER;
	}
	public String getRESPON() {
		return RESPON;
	}
	public void setRESPON(String rESPON) {
		RESPON = rESPON;
	}
	public String getPROCESS() {
		return PROCESS;
	}
	public void setPROCESS(String pROCESS) {
		PROCESS = pROCESS;
	}

}
