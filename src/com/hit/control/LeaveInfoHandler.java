//郝丁魁
package com.hit.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hit.util.PageUtil;
import com.hit.po.ApproveFormPO;
import com.hit.po.LeaveInfoPO;
import com.hit.service.LeaveService;
import com.hit.vo.LeaveInfoInsertVO;
import com.hit.vo.LeaveInfoSearchVO;
import com.hit.vo.StaffNamePO;

@Controller
public class LeaveInfoHandler {
	
	@Autowired
	private LeaveService ls;
	
	//首页待办事项提示
	//main.jsp
	@RequestMapping("/getLeaveInfoCount.action")
	@ResponseBody
	public int getLeaveInfoCount(ModelAndView mv, LeaveInfoSearchVO vo,HttpSession session) throws Exception{
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		vo.setStaffId(userId);
		int leaveInfoCount = ls.getLeaveInfoCount(vo);
		return leaveInfoCount;
	}
	
	//提交请假申请
	//vAddVacation.jsp 申请休假界面
	@RequestMapping("/submitLeaveInfo.action")
	@ResponseBody 
	public int submitLeaveInfo(ModelAndView mv, LeaveInfoInsertVO vo, HttpSession session) throws Exception{
		//保存状态（是否保存成功）
		int status = 0; 

		//获取当前职工编号
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		vo.setStaffId(userId);
		//将请假申请插入数据库
		status = ls.saveLeaveInfo(vo, userId);
		
		return status;
	}
	
	//Ajax获取当前员工某类假期剩余天数
	//vAddVacation.jsp 申请休假界面
	@RequestMapping("/getLeftDays.action")
	@ResponseBody
	public int getLeftDays(ModelAndView mv, @RequestParam(value="leaveType", required=false) int leaveType, HttpSession session) throws Exception{
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		int leftDays = ls.getLeftDays(leaveType, userId);
		return leftDays;
	}

	//Ajax获取当前员工的姓名
	@RequestMapping(value="/getStaffName.action")
	@ResponseBody
	public StaffNamePO getStaffName(ModelAndView mv, StaffNamePO staffNamePO, HttpSession session) throws Exception{
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		staffNamePO.setDname(ls.getStaffNameById(userId));
		return staffNamePO;
	}
	
	
	//查询待审批的请假申请
	//vWaitingAppList.jsp 审批休假界面
	@RequestMapping("/searchLeaveInfo.action")
	public ModelAndView searchLeaveInfo(ModelAndView mv, LeaveInfoSearchVO vo, Integer pagenum, HttpSession session) throws Exception{	
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		vo.setStaffId(userId);
		
		pagenum = pagenum == null ? 1 : pagenum;
		int total = ls.getLeaveInfoCount(vo);
		int maxpage = PageUtil.getMaxPageNum(total);
		List<LeaveInfoPO> leaveInfoList = ls.getLeaveInfo(vo, pagenum);
		mv.addObject("leaveInfoSearchVO", vo);
		mv.addObject("leaveInfoList", leaveInfoList);
		mv.addObject("pagenum", pagenum);
		mv.addObject("total", total);
		mv.addObject("maxpage", maxpage);
		mv.setViewName("/jsp/vWaitingAppList.jsp");
		return mv;
	}
	
	//请假单详情页
	//vApprovalDetail.jsp 
	@RequestMapping("/getDetails.action")
	@ResponseBody
	public ModelAndView getDetails(ModelAndView mv, LeaveInfoPO po) throws Exception {		
		int leaveFormId = po.getLeaveInfoId();
		List<ApproveFormPO> approvalDetails = ls.getApproveFormByLeaveFormId(leaveFormId);
		mv.addObject("approvalDetails", approvalDetails);
		mv.addObject("leaveInfoDetails", po);
		mv.setViewName("/jsp/vApprovalDetail.jsp");
		return mv;
	}
	
	//通过待审批的请假申请
	@RequestMapping("/passApp.action")
	@ResponseBody
	public int passApp(ModelAndView mv, LeaveInfoPO po, HttpSession session) throws Exception{
		int status = 0;
		int leaveFormId = po.getLeaveInfoId();
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		int approveLevel = ls.getApproveFormByLeaveFormIdAndApproverId(leaveFormId, userId).getApproveLevel();
		status = ls.updateApprovalInfoPass(userId, leaveFormId, approveLevel);
		return status;
	}
	
	//驳回待审批的请假申请
	@RequestMapping("/turndownApp.action")
	@ResponseBody
	public int turndownApp(ModelAndView mv, LeaveInfoPO po, HttpSession session) throws Exception{
		int status = 0;
		int leaveFormId = po.getLeaveInfoId();
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		int approveLevel = ls.getApproveFormByLeaveFormIdAndApproverId(leaveFormId, userId).getApproveLevel();
		status = ls.updateApprovalInfoTurndown(userId, leaveFormId, approveLevel);
		return status;
	}
	
	//通过待审批的请假申请（详情页面）
	@RequestMapping("passAppInDetailPage.action")
	@ResponseBody
	public ModelAndView passAppInDetailPage(ModelAndView mv, int leaveInfoId, String approveSuggestion, HttpSession session) throws Exception {
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		int approveLevel = ls.getApproveFormByLeaveFormIdAndApproverId(leaveInfoId, userId).getApproveLevel();
		ls.updateApprovalInfoPassWithSuggestion(userId, leaveInfoId, approveSuggestion, approveLevel);
		mv.setViewName("/jsp/vWaitingAppList.jsp");
		return mv;
	}
	
	//驳回待审批的请假申请（详情页面）
	@RequestMapping("turndownAppInDetailPage.action")
	@ResponseBody
	public ModelAndView turndownAppInDetailPage(ModelAndView mv, int leaveInfoId, String approveSuggestion, HttpSession session) throws Exception {
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		int approveLevel = ls.getApproveFormByLeaveFormIdAndApproverId(leaveInfoId, userId).getApproveLevel();
		ls.updateApprovalInfoTurndownWithSuggestion(userId, leaveInfoId, approveSuggestion, approveLevel);
		mv.setViewName("/jsp/vWaitingAppList.jsp");
		return mv;
	}
}
