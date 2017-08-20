package com.hit.po;

import java.sql.Date;

public class DepInfoPO {
	
	private int departmentid;
	private String departmentname;
	private String leader;
	private int leaderid;
	private int curpeople;
	private int maxpeople;
	private int mark;
	private String upperdepartmentname;
	private int upperdepartmentid;
	private Date establishtime;
	
	public int getCurpeople() {
		return curpeople;
	}
	public void setCurpeople(int curpeople) {
		this.curpeople = curpeople;
	}
	public int getLeaderid() {
		return leaderid;
	}
	public void setLeaderid(int leaderid) {
		this.leaderid = leaderid;
	}
	public int getDepartmentid() {
		return departmentid;
	}
	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public int getMaxpeople() {
		return maxpeople;
	}
	public void setMaxpeople(int maxpeople) {
		this.maxpeople = maxpeople;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	
	public String getUpperdepartmentname() {
		return upperdepartmentname;
	}
	public void setUpperdepartmentname(String upperdepartmentname) {
		this.upperdepartmentname = upperdepartmentname;
	}
	public Date getEstablishtime() {
		return establishtime;
	}
	public void setEstablishtime(Date establishtime) {
		this.establishtime = establishtime;
	}
	public int getUpperdepartmentid() {
		return upperdepartmentid;
	}
	public void setUpperdepartmentid(int upperdepartmentid) {
		this.upperdepartmentid = upperdepartmentid;
	}
	
}
