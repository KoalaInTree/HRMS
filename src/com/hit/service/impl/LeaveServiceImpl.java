package com.hit.service.impl;


import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hit.util.PageUtil;
import com.hit.mapper.LeaveInfoMapper;
import com.hit.po.ApproveFormPO;
import com.hit.po.LeaveFormPO;
import com.hit.po.LeaveInfoPO;
import com.hit.po.LeaveTypePO;
import com.hit.po.StaffPO;
import com.hit.service.LeaveService;
import com.hit.vo.ApproveInfoInsertVO;
import com.hit.vo.LeaveInfoInsertVO;
import com.hit.vo.LeaveInfoSearchVO;

@Service
public class LeaveServiceImpl implements LeaveService {
	
	@Autowired
	private LeaveInfoMapper mapper;
	
	@Override
	public void insertLeaveInfo(LeaveInfoInsertVO vo) throws Exception{
		
		mapper.insertLeaveInfo(vo);
	}
	
	@Override
	public int getLeftDays(int leaveType, int staffId) throws Exception{
		return mapper.getLeftDays(leaveType, staffId);
	}
	
	@Override
	public String getStaffNameById(int staffId) throws Exception{
		return mapper.getStaffNameById(staffId);
	}
	
	@Override
	public void updateLeftDays(int leaveType, int staffId, int leftDays) throws Exception{
		mapper.updateLeftDays(leaveType, staffId, leftDays);
	}

	@Override
	public List<LeaveInfoPO> getLeaveInfo(LeaveInfoSearchVO vo, int pagenum) throws Exception{
		int start = PageUtil.getSQLIndexByPageNum(pagenum);
		int length = PageUtil.EVERY_PAGE_ITEMS;
		vo.setStart(start);
		vo.setLength(length);
		return mapper.getLeaveInfo(vo);
	}
	
	@Override
	public int getLeaveInfoCount(LeaveInfoSearchVO vo) throws Exception{
		return mapper.getLeaveInfoCount(vo);
	}
	
	@Override
	public void insertApproveInfo(int leaveInfoId, int approveLevel, int approverId) throws Exception{
		mapper.insertApproveInfo(leaveInfoId, approveLevel, approverId);
	}
	
	@Override
	public LeaveFormPO getLastLeaveForm() throws Exception{
		return mapper.getLastLeaveForm();
	}
	
	@Override
	public Integer getLeaderIdByStaffId(int staffId) throws Exception{
		return mapper.getLeaderIdByStaffId(staffId);
	}
	
	@Override
	public Integer getUpperLeaderIdByStaffId(int staffId) throws Exception{
		return mapper.getUpperLeaderIdByStaffId(staffId);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int saveLeaveInfo(LeaveInfoInsertVO leaveInfoInsertVO, int staffId) throws Exception {
		int status = 0;
		
		//设置申请日期
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp nowTime = new java.sql.Timestamp(date.getTime());
		leaveInfoInsertVO.setAppdate(nowTime);
		
		//添加请假申请表
		mapper.insertLeaveInfo(leaveInfoInsertVO);
		if(leaveInfoInsertVO.getVtype() == 3 || leaveInfoInsertVO.getVtype() == 4) {
			mapper.updateLeftDays(leaveInfoInsertVO.getVtype(), staffId, leaveInfoInsertVO.getSno());
		}
		
		//获取最新添加的请假申请表
		LeaveFormPO lastLeaveForm = mapper.getLastLeaveForm();
		int leaveFormId = lastLeaveForm.getLeaveFormId();

		//添加请假审批表
		if(lastLeaveForm.getLeaveTypeId() == 3 || lastLeaveForm.getLeaveTypeId() == 4 || lastLeaveForm.getLeaveDays() <= 2) {
			int leaderId = mapper.getLeaderIdByStaffId(staffId);
			int approverId1 = leaderId;
			//如果自己是负责人，请上级部门负责人审批
			if(staffId == leaderId) {
				int upperLeaderId = mapper.getUpperLeaderIdByStaffId(staffId);
				int approveLevel1 = 1;
				mapper.insertApproveInfo(leaveFormId, approveLevel1, upperLeaderId);
			}
			//否则请本部门负责人审批
			else {
				int approveLevel1 = 1;
				mapper.insertApproveInfo(leaveFormId, approveLevel1, approverId1);
			}
		}
		else{			
			int leaderId = mapper.getLeaderIdByStaffId(staffId);
			int upperLeaderId = mapper.getUpperLeaderIdByStaffId(staffId);
			
			//无上级部门，则自己审批自己 一级审批
			if(staffId == leaderId && staffId == upperLeaderId) {
				int approverId1 = leaderId;
				int approveLevel1 = 1;
				mapper.insertApproveInfo(leaveFormId, approveLevel1, approverId1);
			}
			//有上级部门，而且自己是本部门负责人, 则其上级部门负责人审批     一级审批
			else if(staffId == leaderId && staffId != upperLeaderId)
			{
				int approverId1 = upperLeaderId;
				int approveLevel1 = 1;
				mapper.insertApproveInfo(leaveFormId, approveLevel1, approverId1);
			}
			else {
				int approverId1 = leaderId;
				int approveLevel1 = 1;
				mapper.insertApproveInfo(leaveFormId, approveLevel1, approverId1); //一级审批
				
			}
		}
		status = 1;
		return status;
	}
	
	@Override
	public List<ApproveFormPO> getApproveFormByLeaveFormId(int leaveFormId) throws Exception{
		return mapper.getApproveFormByLeaveFormId(leaveFormId);
	}
	
	@Override
	public ApproveFormPO getApproveFormByLeaveFormIdAndApproverId(int leaveFormId, int approverId) throws Exception{
		return mapper.getApproveFormByLeaveFormIdAndApproverId(leaveFormId, approverId);
	}

	@Override
	public void updateApprovalToPassByStaffIdAndLeaveFormId(int staffId, int leaveFormId, Timestamp approveTime) throws Exception {
		mapper.updateApprovalToPassByStaffIdAndLeaveFormId(staffId, leaveFormId, approveTime);
		
	}

	@Override
	public void updateLeaveFormToPassByLeaveFormId(int leaveFormId) throws Exception {
		mapper.updateLeaveFormToPassByLeaveFormId(leaveFormId);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int updateApprovalInfoPass(int staffId, int leaveFormId, int approveLevel) throws Exception{
		int status = 0;
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp approveTime = new java.sql.Timestamp(date.getTime());
		mapper.updateApprovalToPassByStaffIdAndLeaveFormId(staffId, leaveFormId, approveTime);
		if(approveLevel == 1) {
			int upperLeaderId = mapper.getUpperLeaderIdByStaffId(staffId);
			int approverId2 = upperLeaderId;
			int approveLevel2 = 2;
			mapper.insertApproveInfo(leaveFormId, approveLevel2, approverId2);
		}
		if(approveLevel == 2 || staffId == 1003) {
			mapper.updateLeaveFormToPassByLeaveFormId(leaveFormId);
		}
		status = 1;
		
		return status;
	}

	
	@Override
	public void updateApprovalToTurndownByStaffIdAndLeaveFormId(int staffId, int leaveFormId, Timestamp approveTime) throws Exception {
		mapper.updateApprovalToTurndownByStaffIdAndLeaveFormId(staffId, leaveFormId, approveTime);
		
	}

	@Override
	public void updateLeaveFormToTurndownByLeaveFormId(int leaveFormId) throws Exception {
		mapper.updateLeaveFormToTurndownByLeaveFormId(leaveFormId);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int updateApprovalInfoTurndown(int staffId, int leaveFormId, int approveLevel) throws Exception{
		int status = 0;
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp approveTime = new java.sql.Timestamp(date.getTime());
		mapper.updateApprovalToTurndownByStaffIdAndLeaveFormId(staffId, leaveFormId, approveTime);
		mapper.updateLeaveFormToTurndownByLeaveFormId(leaveFormId);
		status = 1;
		return status;
	}

	
	@Override
	public void updateApprovalToPassWithSuggestion(int staffId, int leaveFormId, String approveSuggestion, Timestamp approveTime) throws Exception {
		mapper.updateApprovalToPassWithSuggestion(staffId, leaveFormId, approveSuggestion, approveTime);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void updateApprovalInfoPassWithSuggestion(int staffId, int leaveFormId, String approveSuggestion, int approveLevel) throws Exception {
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp approveTime = new java.sql.Timestamp(date.getTime());
		mapper.updateApprovalToPassWithSuggestion(staffId, leaveFormId, approveSuggestion, approveTime);
		if(approveLevel == 1) {
			int upperLeaderId = mapper.getUpperLeaderIdByStaffId(staffId);
			int approverId2 = upperLeaderId;
			int approveLevel2 = 2;
			mapper.insertApproveInfo(leaveFormId, approveLevel2, approverId2);
		}
		if(approveLevel == 2 || staffId == 1003) {
			mapper.updateLeaveFormToPassByLeaveFormId(leaveFormId);
		}
	}
	
	@Override
	public void updateApprovalToTurndownWithSuggestion(int staffId, int leaveFormId, String approveSuggestion, Timestamp approveTime) throws Exception {
		mapper.updateApprovalToTurndownWithSuggestion(staffId, leaveFormId, approveSuggestion, approveTime);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void updateApprovalInfoTurndownWithSuggestion(int staffId, int leaveFormId, String approveSuggestion, int approveLevel) throws Exception {
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp approveTime = new java.sql.Timestamp(date.getTime());
		mapper.updateApprovalToTurndownWithSuggestion(staffId, leaveFormId, approveSuggestion, approveTime);
		mapper.updateLeaveFormToTurndownByLeaveFormId(leaveFormId);
	}
}
