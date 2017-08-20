//�¶���
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
	
	//��ҳ����������ʾ
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
	
	//�ύ�������
	//vAddVacation.jsp �����ݼٽ���
	@RequestMapping("/submitLeaveInfo.action")
	@ResponseBody 
	public int submitLeaveInfo(ModelAndView mv, LeaveInfoInsertVO vo, HttpSession session) throws Exception{
		//����״̬���Ƿ񱣴�ɹ���
		int status = 0; 

		//��ȡ��ǰְ�����
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		vo.setStaffId(userId);
		//���������������ݿ�
		status = ls.saveLeaveInfo(vo, userId);
		
		return status;
	}
	
	//Ajax��ȡ��ǰԱ��ĳ�����ʣ������
	//vAddVacation.jsp �����ݼٽ���
	@RequestMapping("/getLeftDays.action")
	@ResponseBody
	public int getLeftDays(ModelAndView mv, @RequestParam(value="leaveType", required=false) int leaveType, HttpSession session) throws Exception{
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		int leftDays = ls.getLeftDays(leaveType, userId);
		return leftDays;
	}

	//Ajax��ȡ��ǰԱ��������
	@RequestMapping(value="/getStaffName.action")
	@ResponseBody
	public StaffNamePO getStaffName(ModelAndView mv, StaffNamePO staffNamePO, HttpSession session) throws Exception{
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		staffNamePO.setDname(ls.getStaffNameById(userId));
		return staffNamePO;
	}
	
	
	//��ѯ���������������
	//vWaitingAppList.jsp �����ݼٽ���
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
	
	//��ٵ�����ҳ
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
	
	//ͨ�����������������
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
	
	//���ش��������������
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
	
	//ͨ����������������루����ҳ�棩
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
	
	//���ش�������������루����ҳ�棩
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
