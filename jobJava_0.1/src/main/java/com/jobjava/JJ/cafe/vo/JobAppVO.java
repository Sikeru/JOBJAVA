package com.jobjava.JJ.cafe.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Date;

public class JobAppVO {
	private int JOB_APP_NO;
	private String ID;
	private String FILENAME;
	private String AREA;
	private Date E_DATE;
	private String OCC_TYPE;
	private String F_FAMILY;
	private String DISCLOSURE;
	private String DISABILITY;
	private String MILITARY;
	
	
	public int getJOB_APP_NO() {
		return JOB_APP_NO;
	}


	public void setJOB_APP_NO(int jOB_APP_NO) {
		JOB_APP_NO = jOB_APP_NO;
	}

	public String getID() {
		return ID;
	}


	public void setID(String iD) {
		ID = iD;
	}


	public String getFILENAME() {
		try {
			if(FILENAME!= null && FILENAME.length()!=0) {
				this.FILENAME = URLDecoder.decode(FILENAME,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return FILENAME;
	}

	public void setFILENAME(String fILENAME) {
		try {
			if(fILENAME!= null && fILENAME.length()!=0) {
				this.FILENAME = URLDecoder.decode(fILENAME,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}


	public String getAREA() {
		return AREA;
	}


	public void setAREA(String aREA) {
		AREA = aREA;
	}


	public Date getE_DATE() {
		return E_DATE;
	}


	public void setE_DATE(Date e_DATE) {
		E_DATE = e_DATE;
	}


	public String getOCC_TYPE() {
		return OCC_TYPE;
	}


	public void setOCC_TYPE(String oCC_TYPE) {
		OCC_TYPE = oCC_TYPE;
	}


	public String getF_FAMILY() {
		return F_FAMILY;
	}


	public void setF_FAMILY(String f_FAMILY) {
		F_FAMILY = f_FAMILY;
	}


	public String getDISCLOSURE() {
		return DISCLOSURE;
	}


	public void setDISCLOSURE(String dISCLOSURE) {
		DISCLOSURE = dISCLOSURE;
	}


	public String getDISABILITY() {
		return DISABILITY;
	}


	public void setDISABILITY(String dISABILITY) {
		DISABILITY = dISABILITY;
	}


	public String getMILITARY() {
		return MILITARY;
	}


	public void setMILITARY(String mILITARY) {
		MILITARY = mILITARY;
	}


	public void write(JobAppVO jobAppVO) {
		// TODO Auto-generated method stub
		
	}
}
	
	
	
