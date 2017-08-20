package com.hit.po;

import java.sql.Date;
import java.sql.Timestamp;

//请假单PO
public class LeaveInfoPO {
	//请假表ID
	private int leaveInfoId;
	//申请人ID
	private int staffId;
	//申请人姓名
	private String uname ;
	//休假类型
	private String leaveType;
	//请假天数
	private int leaveDays;
	//申请日期
	private Timestamp appDate;
	//开始日期
	private Date startDate;
	//结束日期
	private Date endDate;
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getLeaveType() {
		return leaveType;
	}
	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}
	public int getLeaveDays() {
		return leaveDays;
	}
	public void setLeaveDays(int leaveDays) {
		this.leaveDays = leaveDays;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getLeaveInfoId() {
		return leaveInfoId;
	}
	public void setLeaveInfoId(int leaveInfoId) {
		this.leaveInfoId = leaveInfoId;
	}
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	public Timestamp getAppDate() {
		return appDate;
	}
	public void setAppDate(Timestamp appDate) {
		this.appDate = appDate;
	}


	
}