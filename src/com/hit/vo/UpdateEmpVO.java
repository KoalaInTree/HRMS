package com.hit.vo;

import java.sql.Date;

public class UpdateEmpVO {
	private int pkey;
	private String empname;
	private String loginname;
	private String sex;
	private Date birthday;
	private Date inday;
	private double salary;
	private int privilege;
	
	public int getPkey() {
		return pkey;
	}
	public void setPkey(int pkey) {
		this.pkey = pkey;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
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
	public Date getInday() {
		return inday;
	}
	public void setInday(Date inday) {
		this.inday = inday;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public int getPrivilege() {
		return privilege;
	}
	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}
	
}
