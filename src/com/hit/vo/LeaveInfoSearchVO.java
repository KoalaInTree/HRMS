//ºÂ¶¡¿ý
package com.hit.vo;

import java.sql.Date;

public class LeaveInfoSearchVO {
	
	private String ename;
	private Date sdate;
	private Date edate;
	
	private int staffId; 
	
	private int start;
	private int length;
	
	public String getEname() {
		return ename;
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
	public void setEname(String ename) {
		this.ename = ename;
	}
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
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}


}
