package com.hit.po;

import java.sql.Date;
import java.sql.Timestamp;

public class LeaveFormPO {
	
	
	private int leaveFormId;
	private int staffld;
	private int leaveTypeId;
	private int leaveDays;
	private Timestamp appDate;
	private Date startDate;
	private Date endDate;
	private String reason;
	private int mark;
	private ApproveFormPO afpo;
	private StaffPO staffpo;
	private LeaveTypePO leavetypepo;
	
	
	public int getLeaveFormId() {
		return leaveFormId;
	}
	public void setLeaveFormId(int leaveFormId) {
		this.leaveFormId = leaveFormId;
	}
	public int getStaffld() {
		return staffld;
	}
	public void setStaffld(int staffld) {
		this.staffld = staffld;
	}
	public int getLeaveTypeId() {
		return leaveTypeId;
	}
	public void setLeaveTypeId(int leaveTypeId) {
		this.leaveTypeId = leaveTypeId;
	}
	public int getLeaveDays() {
		return leaveDays;
	}
	public void setLeaveDays(int leaveDays) {
		this.leaveDays = leaveDays;
	}
	public Timestamp getAppDate() {
		return appDate;
	}
	public void setAppDate(Timestamp appDate) {
		this.appDate = appDate;
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
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	public ApproveFormPO getAfpo() {
		return afpo;
	}
	public void setAfpo(ApproveFormPO afpo) {
		this.afpo = afpo;
	}
	public StaffPO getStaffpo() {
		return staffpo;
	}
	public void setStaffpo(StaffPO staffpo) {
		this.staffpo = staffpo;
	}
	public LeaveTypePO getLeavetypepo() {
		return leavetypepo;
	}
	public void setLeavetypepo(LeaveTypePO leavetypepo) {
		this.leavetypepo = leavetypepo;
	}
	

	

}
