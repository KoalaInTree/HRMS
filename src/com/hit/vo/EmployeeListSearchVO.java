package com.hit.vo;

import java.sql.Date;

public class EmployeeListSearchVO {


	private String uname;

	private String sex;

	private String positionname;
	private String departmentname;
	
	private Date inday;

	private Integer mark;//1-ÔÚÖ° 2-ÀëÖ° 
	
	
	private Date sdate;
	private Date edate;
	private int start;
	private int length;
	
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getPositionname() {
		return positionname;
	}
	public void setPositionname(String positionname) {
		this.positionname = positionname;
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
	public Date getInday() {
		return inday;
	}
	public void setInday(Date inday) {
		this.inday = inday;
	}
	
	public Integer getMark() {
		return mark;
	}
	public void setMark(Integer mark) {
		this.mark = mark;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	
}
