package com.jobjava.JJ.leader.vo;

public class CRegVO {
	//C_MEMBER
	private String B_NO;	// 사업자번호
	private String ID;		//멤버아이디
	private String AGENT;	//대표자
	private String B_TYPE;	//업종
	private String C_DIV;	//기업구분
	private int EMP_NUM;	//근로자 수
	private String HOMEPAGE;	//홈페이지
	private String C_NAME; //회사명
	
	//C_REG
	private int REGI_NO; // 기업신청번호
	private int UNI_B_NO; // 대학사업번호
	private String FILENAME; // 파일이름
	private String M_RESULT; // 매칭결과
	
	
	public String getB_NO() {
		return B_NO;
	}
	public void setB_NO(String b_NO) {
		B_NO = b_NO;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getAGENT() {
		return AGENT;
	}
	public void setAGENT(String aGENT) {
		AGENT = aGENT;
	}
	public String getB_TYPE() {
		return B_TYPE;
	}
	public void setB_TYPE(String b_TYPE) {
		B_TYPE = b_TYPE;
	}
	public String getC_DIV() {
		return C_DIV;
	}
	public void setC_DIV(String c_DIV) {
		C_DIV = c_DIV;
	}
	public int getEMP_NUM() {
		return EMP_NUM;
	}
	public void setEMP_NUM(int eMP_NUM) {
		EMP_NUM = eMP_NUM;
	}
	public String getHOMEPAGE() {
		return HOMEPAGE;
	}
	public void setHOMEPAGE(String hOMEPAGE) {
		HOMEPAGE = hOMEPAGE;
	}
	public String getC_NAME() {
		return C_NAME;
	}
	public void setC_NAME(String c_NAME) {
		C_NAME = c_NAME;
	}
	public int getREGI_NO() {
		return REGI_NO;
	}
	public void setREGI_NO(int rEGI_NO) {
		REGI_NO = rEGI_NO;
	}
	public int getUNI_B_NO() {
		return UNI_B_NO;
	}
	public void setUNI_B_NO(int uNI_B_NO) {
		UNI_B_NO = uNI_B_NO;
	}
	public String getFILENAME() {
		return FILENAME;
	}
	public void setFILENAME(String fILENAME) {
		FILENAME = fILENAME;
	}
	public String getM_RESULT() {
		return M_RESULT;
	}
	public void setM_RESULT(String m_RESULT) {
		M_RESULT = m_RESULT;
	}
}
