package com.jobjava.JJ.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

public class OnlineVO {
	private int RECNUM;
	private int ON_COM_NO;
	private String TITLE;
	private String CONTENT;
	private Date OCA_DATE;
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

	public int getON_COM_NO() {
		return ON_COM_NO;
	}
	public void setON_COM_NO(int oN_COM_NO) {
		ON_COM_NO = oN_COM_NO;
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

	public Date getOCA_DATE() {
		return OCA_DATE;
	}
	public void setOCA_DATE(Date oCA_DATE) {
		OCA_DATE = oCA_DATE;
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
