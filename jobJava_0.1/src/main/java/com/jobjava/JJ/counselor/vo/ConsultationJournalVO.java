package com.jobjava.JJ.counselor.vo;

import java.sql.Date;

public class ConsultationJournalVO {

	private int CON_NO;
	private int EMP_NO;
	private String ID;
	private String CONTENT;
	private Date CJ_DATE;

	public Date getCJ_DATE() {
		return CJ_DATE;
	}

	public int getCON_NO() {
		return CON_NO;
	}

	public String getCONTENT() {
		return CONTENT;
	}

	public int getEMP_NO() {
		return EMP_NO;
	}

	public String getID() {
		return ID;
	}

	public void setCJ_DATE(Date cJ_DATE) {
		CJ_DATE = cJ_DATE;
	}

	public void setCON_NO(int cON_NO) {
		CON_NO = cON_NO;
	}

	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}

	public void setEMP_NO(int eMP_NO) {
		EMP_NO = eMP_NO;
	}

	public void setID(String iD) {
		ID = iD;
	}
}
