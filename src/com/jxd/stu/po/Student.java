package com.jxd.stu.po;

import java.util.Date;

public class Student {

	private long ID;
	private String NAME;
	private String SEX;
	private Date DATETIME;
	private long PHONE;
	private String CLASS;
	private long CHINESE;
	private long MATHS;
	private long ENGLISH;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(long iD, String nAME, String sEX, Date dATETIME, long pHONE,
			String cLASS, long cHINESE, long mATHS, long eNGLISH) {
		super();
		ID = iD;
		NAME = nAME;
		SEX = sEX;
		DATETIME = dATETIME;
		PHONE = pHONE;
		CLASS = cLASS;
		CHINESE = cHINESE;
		MATHS = mATHS;
		ENGLISH = eNGLISH;
	}
	
	public Student(String nAME, String sEX, Date dATETIME, long pHONE,
			String cLASS, long cHINESE, long mATHS, long eNGLISH) {
		super();
		NAME = nAME;
		SEX = sEX;
		DATETIME = dATETIME;
		PHONE = pHONE;
		CLASS = cLASS;
		CHINESE = cHINESE;
		MATHS = mATHS;
		ENGLISH = eNGLISH;
	}
	public long getID() {
		return ID;
	}
	public void setID(long iD) {
		ID = iD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getSEX() {
		return SEX;
	}
	public void setSEX(String sEX) {
		SEX = sEX;
	}
	public Date getDATETIME() {
		return DATETIME;
	}
	public void setDATETIME(Date dATETIME) {
		DATETIME = dATETIME;
	}
	public long getPHONE() {
		return PHONE;
	}
	public void setPHONE(long pHONE) {
		PHONE = pHONE;
	}
	public String getCLASS() {
		return CLASS;
	}
	public void setCLASS(String cLASS) {
		CLASS = cLASS;
	}
	public long getCHINESE() {
		return CHINESE;
	}
	public void setCHINESE(long cHINESE) {
		CHINESE = cHINESE;
	}
	public long getMATHS() {
		return MATHS;
	}
	public void setMATHS(long mATHS) {
		MATHS = mATHS;
	}
	public long getENGLISH() {
		return ENGLISH;
	}
	public void setENGLISH(long eNGLISH) {
		ENGLISH = eNGLISH;
	}
	@Override
	public String toString() {
		return "Student [ID=" + ID + ", NAME=" + NAME + ", SEX=" + SEX
				+ ", DATETIME=" + DATETIME + ", PHONE=" + PHONE + ", CLASS="
				+ CLASS + ", CHINESE=" + CHINESE + ", MATHS=" + MATHS
				+ ", ENGLISH=" + ENGLISH + "]";
	}
	
	
	
	
}
