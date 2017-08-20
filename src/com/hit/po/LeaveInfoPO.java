package com.hit.po;

import java.sql.Date;
import java.sql.Timestamp;

//��ٵ�PO
public class LeaveInfoPO {
	//��ٱ�ID
	private int leaveInfoId;
	//������ID
	private int staffId;
	//����������
	private String uname ;
	//�ݼ�����
	private String leaveType;
	//�������
	private int leaveDays;
	//��������
	private Timestamp appDate;
	//��ʼ����
	private Date startDate;
	//��������
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