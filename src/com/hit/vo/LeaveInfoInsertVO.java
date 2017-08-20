//郝丁魁
package com.hit.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class LeaveInfoInsertVO {
	//当前员工ID
	private int StaffId;
	//申请日期
	private Timestamp appdate;
	//当前员工姓名
	private String dname;
	//假期类型
	private int vtype;
	//剩余天数
	private String dno;
	//休假天数
	private int sno;
	//开始日期
	private Date sd1;
	//结束日期
	private Date ed1;

	
	public String getDname() {
		return dname;
	}
	public int getStaffId() {
		return StaffId;
	}
	public void setStaffId(int staffId) {
		StaffId = staffId;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}

	
	public Date getSd1() {
		return sd1;
	}
	public void setSd1(Date sd1) {
		this.sd1 = sd1;
	}
	public Date getEd1() {
		return ed1;
	}
	public void setEd1(Date ed1) {
		this.ed1 = ed1;
	}
	
	public int getVtype() {
		return vtype;
	}
	public void setVtype(int vtype) {
		this.vtype = vtype;
	}

	public String getDno() {
		return dno;
	}
	public void setDno(String dno) {
		this.dno = dno;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public Timestamp getAppdate() {
		return appdate;
	}
	public void setAppdate(Timestamp appdate) {
		this.appdate = appdate;
	}

}
