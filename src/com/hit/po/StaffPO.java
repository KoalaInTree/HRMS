package com.hit.po;

import java.sql.Date;

public class StaffPO {
	
	private int staffId;
	private String staffName;
	private String loginName;
	private String password;
	private String sex;
	private Date birthday;
	private Date inDay; 
	private int salary;
	private int privilege;
	private int curDepartment;
	private int curPosition;
	private int mark;
	private String marriage;
	private String school;
	private String education;
	
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Date getInDay() {
		return inDay;
	}
	public void setInDay(Date inDay) {
		this.inDay = inDay;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getPrivilege() {
		return privilege;
	}
	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}
	public int getCurDepartment() {
		return curDepartment;
	}
	public void setCurDepartment(int curDepartment) {
		this.curDepartment = curDepartment;
	}
	public int getCurPosition() {
		return curPosition;
	}
	public void setCurPosition(int curPosition) {
		this.curPosition = curPosition;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	public String getMarriage() {
		return marriage;
	}
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	

}
