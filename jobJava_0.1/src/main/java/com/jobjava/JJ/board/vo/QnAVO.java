package com.jobjava.JJ.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

public class QnAVO {
	private int RECNUM;
	private int QNA_NO;
	private String TITLE;
	private String CONTENT;
	private Date QNA_DATE;
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
	public int getQNA_NO() {
		return QNA_NO;
	}
	public void setQNA_NO(int qNA_NO) {
		QNA_NO = qNA_NO;
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
	public Date getQNA_DATE() {
		return QNA_DATE;
	}
	public void setQNA_DATE(Date qNA_DATE) {
		QNA_DATE = qNA_DATE;
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
