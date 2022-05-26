package com.jobjava.JJ.counselor.vo;

import java.sql.Date;
import java.util.List;

public class UniregVO {
	private int UNI_B_NO;
	private int MG_NO;
	private String U_NAME;
	private String UNI_HP;
	private String UNI_ADDR;
	private String B_NAME;
	private int B_EXPENSE;
	private Date S_DATE;
	private Date E_DATE;
	private String B_CONTENT;
	private String PERMISSION;

	public String getPERMISSION() {
		return PERMISSION;
	}

	public void setPERMISSION(String pERMISSION) {
		PERMISSION = pERMISSION;
	}

	public int getUNI_B_NO() {
		return UNI_B_NO;
	}

	public void setUNI_B_NO(int uNI_B_NO) {
		UNI_B_NO = uNI_B_NO;
	}

	public int getMG_NO() {
		return MG_NO;
	}

	public void setMG_NO(int mG_NO) {
		MG_NO = mG_NO;
	}

	public String getU_NAME() {
		return U_NAME;
	}

	public void setU_NAME(String u_NAME) {
		U_NAME = u_NAME;
	}

	public String getUNI_HP() {
		return UNI_HP;
	}

	public void setUNI_HP(String uNI_HP) {
		UNI_HP = uNI_HP;
	}

	public String getUNI_ADDR() {
		return UNI_ADDR;
	}

	public void setUNI_ADDR(String uNI_ADDR) {
		UNI_ADDR = uNI_ADDR;
	}

	public String getB_NAME() {
		return B_NAME;
	}

	public void setB_NAME(String b_NAME) {
		B_NAME = b_NAME;
	}

	public int getB_EXPENSE() {
		return B_EXPENSE;
	}

	public void setB_EXPENSE(int b_EXPENSE) {
		B_EXPENSE = b_EXPENSE;
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

	public String getB_CONTENT() {
		return B_CONTENT;
	}

	public void setB_CONTENT(String b_CONTENT) {
		B_CONTENT = b_CONTENT;
	}

	public List<UniregVO> uniregList() {
		// TODO Auto-generated method stub
		return null;
	}

}
