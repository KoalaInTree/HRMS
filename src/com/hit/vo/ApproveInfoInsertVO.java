//ºÂ¶¡¿ý
package com.hit.vo;

import java.sql.Timestamp;

public class ApproveInfoInsertVO {
	private int approveInfoId;
	private int leaveInfoId;
	private int approveLevel;
	private int approverId;
	private int approveResult;
	private Timestamp approveTime;
	private String approveSuggestion;
	
	public int getApproveInfoId() {
		return approveInfoId;
	}
	public void setApproveInfoId(int approveInfoId) {
		this.approveInfoId = approveInfoId;
	}
	public int getLeaveInfoId() {
		return leaveInfoId;
	}
	public void setLeaveInfoId(int leaveInfoId) {
		this.leaveInfoId = leaveInfoId;
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
	public int getApproveResult() {
		return approveResult;
	}
	public void setApproveResult(int approveResult) {
		this.approveResult = approveResult;
	}
	public Timestamp getApproveTime() {
		return approveTime;
	}
	public void setApproveTime(Timestamp approveTime) {
		this.approveTime = approveTime;
	}
	public String getApproveSuggestion() {
		return approveSuggestion;
	}
	public void setApproveSuggestion(String approveSuggestion) {
		this.approveSuggestion = approveSuggestion;
	}
}
