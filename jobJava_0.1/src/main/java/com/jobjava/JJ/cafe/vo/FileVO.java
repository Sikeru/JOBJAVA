package com.jobjava.JJ.cafe.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;


public class FileVO {
	private int EMP_FILE;
	private int PROGRAM_NO;
	private String EMP_FILENAME;
	private Date EMP_DATE;
	
	
	public int getEMP_FILE() {
		return EMP_FILE;
	}
	public void setEMP_FILE(int eMP_FILE) {
		EMP_FILE = eMP_FILE;
	}
	public int getPROGRAM_NO() {
		return PROGRAM_NO;
	}
	public void setPROGRAM_NO(int pROGRAM_NO) {
		PROGRAM_NO = pROGRAM_NO;
	}
	public String getEMP_FILENAME() {
		try {
			if(EMP_FILENAME!= null && EMP_FILENAME.length()!=0) {
				this.EMP_FILENAME = URLEncoder.encode(EMP_FILENAME,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return EMP_FILENAME;
	}
	public void setEMP_FILENAME(String eMP_FILENAME) {
		try {
			if(eMP_FILENAME!= null && eMP_FILENAME.length()!=0) {
				this.EMP_FILENAME = URLEncoder.encode(eMP_FILENAME,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	public Date getEMP_DATE() {
		return EMP_DATE;
	}
	public void setEMP_DATE(Date eMP_DATE) {
		EMP_DATE = eMP_DATE;
	}

}
	
	
	