package com.jobjava.JJ.leader.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

public class FileVO {
	private int REGI_FILENO;
	private int REGI_NO;
	private Date REGI_DATE;
	private String REGI_FILENAME;
	
	public int getREGI_FILENO() {
		return REGI_FILENO;
	}
	public void setREGI_FILENO(int rEGI_FILENO) {
		REGI_FILENO = rEGI_FILENO;
	}
	public int getREGI_NO() {
		return REGI_NO;
	}
	public void setREGI_NO(int rEGI_NO) {
		REGI_NO = rEGI_NO;
	}
	public Date getREGI_DATE() {
		return REGI_DATE;
	}
	public void setREGI_DATE(Date rEGI_DATE) {
		REGI_DATE = rEGI_DATE;
	}
	public String getREGI_FILENAME() {
		try {
			if(REGI_FILENAME!= null && REGI_FILENAME.length()!=0) {
				this.REGI_FILENAME = URLEncoder.encode(REGI_FILENAME,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return REGI_FILENAME;
	}
	public void setREGI_FILENAME(String rEGI_FILENAME) {
		try {
			if(rEGI_FILENAME!= null && rEGI_FILENAME.length()!=0) {
				this.REGI_FILENAME = URLEncoder.encode(rEGI_FILENAME,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	@Override
	public String toString() {
		return "FileVO [REGI_FILENO=" + REGI_FILENO + ", REGI_NO=" + REGI_NO + ", REGI_DATE=" + REGI_DATE
				+ ", REGI_FILENAME=" + REGI_FILENAME + "]";
	}
	
	
	
}
