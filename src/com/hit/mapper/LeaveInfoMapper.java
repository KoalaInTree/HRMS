package com.hit.mapper;


import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.hit.po.ApproveFormPO;
import com.hit.po.LeaveFormPO;
import com.hit.po.LeaveInfoPO;
import com.hit.po.LeaveTypePO;
import com.hit.po.StaffPO;
import com.hit.vo.ApproveInfoInsertVO;
import com.hit.vo.LeaveInfoInsertVO;
import com.hit.vo.LeaveInfoSearchVO;

public interface LeaveInfoMapper {
	//vAddVaction.jsp
	public void insertLeaveInfo(LeaveInfoInsertVO vo) throws Exception;
	public int getLeftDays(int leaveType, int staffId) throws Exception;
	public String getStaffNameById(int staffId) throws Exception;
	public void updateLeftDays(int leaveType, int staffId, int leftDays) throws Exception;
	
	public void insertApproveInfo(int leaveInfoId, int approveLevel, int approverId) throws Exception;
	public LeaveFormPO getLastLeaveForm() throws Exception;
	public Integer getLeaderIdByStaffId(int staffId) throws Exception;
	public Integer getUpperLeaderIdByStaffId(int staffId) throws Exception;
	public List<ApproveFormPO> getApproveFormByLeaveFormId(int leaveFormId) throws Exception;
	public ApproveFormPO getApproveFormByLeaveFormIdAndApproverId(int leaveFormId, int approverId) throws Exception;
	
	
	//vWaitingAppList.jsp
	public List<LeaveInfoPO> getLeaveInfo(LeaveInfoSearchVO vo) throws Exception;
	public int getLeaveInfoCount(LeaveInfoSearchVO vo) throws Exception;
	
	public void updateApprovalToPassByStaffIdAndLeaveFormId(int staffId, int leaveFormId, Timestamp approveTime) throws Exception;
	public void updateLeaveFormToPassByLeaveFormId(int leaveFormId) throws Exception;
	
	public void updateApprovalToTurndownByStaffIdAndLeaveFormId(int staffId, int leaveFormId, Timestamp approveTime) throws Exception;
	public void updateLeaveFormToTurndownByLeaveFormId(int leaveFormId) throws Exception;
	
	public void updateApprovalToPassWithSuggestion(int staffId, int leaveFormId, String approveSuggestion, Timestamp approveTime) throws Exception;
	public void updateApprovalToTurndownWithSuggestion(int staffId, int leaveFormId, String approveSuggestion, Timestamp approveTime) throws Exception;
	

}
