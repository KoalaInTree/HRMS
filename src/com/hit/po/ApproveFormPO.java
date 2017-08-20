package com.hit.po;

import java.sql.Timestamp;

public class ApproveFormPO {
	
	private int approveFormId;
	private String approverName;
	private int leaveFormId;
	private int approveLevel;
	private int approverId;
	private int approveRes;
	private Timestamp approveDate;
	private String approveSuggestion;
	
	public int getApproveFormId() {
		return approveFormId;
	}
	public void setApproveFormId(int approveFormId) {
		this.approveFormId = approveFormId;
	}
	public String getApproverName() {
		return approverName;
	}
	public void setApproverName(String approverName) {
		this.approverName = approverName;
	}
	public int getLeaveFormId() {
		return leaveFormId;
	}
	public void setLeaveFormId(int leaveFormId) {
		this.leaveFormId = leaveFormId;
	}
	public int getApproveLevel() {
		return approveLevel;
	}
	public void setApproveLevel(int approveLevel) {
		this.approveLevel = approveLevel;
	}
	public int getApproverId() {
		return approverId;
	}
	public void setApproverId(int approverId) {
		this.approverId = approverId;
	}
	public int getApproveRes() {
		return approveRes;
	}
	public void setApproveRes(int approveRes) {
		this.approveRes = approveRes;
	}
	public Timestamp getApproveDate() {
		return approveDate;
	}
	public void setApproveDate(Timestamp approveDate) {
		this.approveDate = approveDate;
	}
	public String getApproveSuggestion() {
		return approveSuggestion;
	}
	public void setApproveSuggestion(String approveSuggestion) {
		this.approveSuggestion = approveSuggestion;
	}
}
