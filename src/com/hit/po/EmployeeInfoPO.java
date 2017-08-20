package com.hit.po;

import java.sql.Date;

public class EmployeeInfoPO {

	private int pkey;
	private String uName;
	private String loginname;
	private String sex;
	private Date birthday;
	private Date inDay;
	private String departmentname;
	private String positionname;
	private int mark;//1-‘⁄÷∞ 2-¿Î÷∞
	private String marriage;
	private String school;
	private double salary;
	private String education;
	private Date graduateTime;
	private String image;
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public int getPkey() {
		return pkey;
	}
	public void setPkey(int pkey) {
		this.pkey = pkey;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
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

	
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
	public String getPositionname() {
		return positionname;
	}
	public void setPositionname(String positionname) {
		this.positionname = positionname;
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
	public Date getGraduateTime() {
		return graduateTime;
	}
	public void setGraduateTime(Date graduateTime) {
		this.graduateTime = graduateTime;
	}
	
}