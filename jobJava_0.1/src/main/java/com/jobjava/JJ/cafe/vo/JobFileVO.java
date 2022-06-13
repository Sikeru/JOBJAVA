package com.jobjava.JJ.cafe.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Date;


public class JobFileVO {
	private int JA_FILENO;
	private int JOB_APP_NO;
	private Date JA_DATE;
	private String JA_FILENAME;
	
	
	public int getJA_FILENO() {
		return JA_FILENO;
	}
	public void setJA_FILENO(int jA_FILENO) {
		JA_FILENO = jA_FILENO;
	}
	public int getJOB_APP_NO() {
		return JOB_APP_NO;
	}
	public void setJOB_APP_NO(int jOB_APP_NO) {
		JOB_APP_NO = jOB_APP_NO;
	}
	public Date getJA_DATE() {
		return JA_DATE;
	}
	public void setJA_DATE(Date jA_DATE) {
		JA_DATE = jA_DATE;
	}
	public String getJA_FILENAME() {
		try {
			if(JA_FILENAME!= null && JA_FILENAME.length()!=0) {
				this.JA_FILENAME = URLDecoder.decode(JA_FILENAME,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return JA_FILENAME;
	}
	public void setJA_FILENAME(String jA_FILENAME) {
		try {
			if(jA_FILENAME!= null && jA_FILENAME.length()!=0) {
				this.JA_FILENAME = URLDecoder.decode(jA_FILENAME,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	

}
	


