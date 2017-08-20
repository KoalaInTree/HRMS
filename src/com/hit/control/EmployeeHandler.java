package com.hit.control;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hit.po.DepInfoPO;
import com.hit.po.DepNamePO;
import com.hit.po.EmpDepRecInfoPO;
import com.hit.po.EmpInDepPO;
import com.hit.po.EmpInPosPO;
import com.hit.po.EmpPosRecInfoPO;
import com.hit.po.EmployeeInfoPO;
import com.hit.po.PosInfoPO;
import com.hit.po.PosNamePO;
import com.hit.service.EmployeeService;
import com.hit.util.PageUtil;
import com.hit.vo.ChangeEmpVO;
import com.hit.vo.DepListSearchVO;
import com.hit.vo.DeptConditionVO;
import com.hit.vo.EmpConditionVO;
import com.hit.vo.EmployeeListSearchVO;
import com.hit.vo.EmployeeSearchVO;
import com.hit.vo.PosListSearchVO;
import com.hit.vo.PosiConditionVO;
import com.hit.vo.UpdateDeptVO;
import com.hit.vo.UpdateEmpVO;
import com.hit.vo.UpdatePosiVO;

@Controller
public class EmployeeHandler {
	
	@Autowired
	private EmployeeService us;
	
	@RequestMapping("/CurStaffInfo.action")
	public ModelAndView EntryCurEmployeeList(ModelAndView mv, EmployeeSearchVO vo,HttpSession session) throws Exception{
		String uname = (String)session.getAttribute("UName");
		vo.setUname(uname);
		List<EmployeeInfoPO> InfoList = us.getCurEmployee(vo);
		List<EmpDepRecInfoPO> DepRecInfo = us.getEmpDepRec(vo);
		List<EmpPosRecInfoPO> PosRecInfo = us.getEmpPosRec(vo);
		mv.addObject("posRecList",PosRecInfo);
		mv.addObject("depRecList",DepRecInfo);
		mv.addObject("ulist", InfoList);
		mv.setViewName("/jsp/empinfo.jsp");
		return mv;
	}
	
	@RequestMapping("/StaffInfo.action")
	public ModelAndView EntryEmployeeList(ModelAndView mv, EmployeeListSearchVO vo, Integer pagenum) throws Exception{
		pagenum = pagenum == null ? 1 : pagenum;
		int total = us.getEmployeeListCount(vo);
		int maxpage = PageUtil.getMaxPageNum(total);
		List<EmployeeInfoPO> EmpList = us.getEmployeeList(vo, pagenum);
		List<DepNamePO> DepList = us.getDepName();
		List<PosNamePO> PosList = us.getPosName();
		mv.addObject("emplist", EmpList);
		mv.addObject("deplist", DepList);
		mv.addObject("poslist", PosList);
		mv.addObject("svo", vo);
		mv.addObject("pagenum", pagenum);
		mv.addObject("total", total);
		mv.addObject("maxpage", maxpage);
		mv.setViewName("/jsp/emplist.jsp");
		return mv;
	}
	
	@RequestMapping("/DepInfo.action")
	public ModelAndView EntryCurDepList(ModelAndView mv,DepListSearchVO vo) throws Exception{
		List<DepInfoPO> DepList = us.getCurDep(vo);
		int CurPeople = us.getCurDepPeopleCount(vo);
		List<EmpInDepPO> EmpList = us.getEmpInDep(vo);
		mv.addObject("curdep", DepList);
		mv.addObject("empindep", EmpList);
		mv.addObject("curpeople",CurPeople);
		mv.addObject("svo", vo);
		mv.setViewName("/jsp/viewdeptinfo.jsp");
		return mv;
	}
	
	@RequestMapping("/PosInfo.action")
	public ModelAndView EntryCurPosList(ModelAndView mv,PosListSearchVO vo) throws Exception{
		List<PosInfoPO> PosList = us.getCurPos(vo);
		List<EmpInPosPO> EmpList = us.getEmpInPos(vo);
		mv.addObject("curpos", PosList);
		mv.addObject("empinpos", EmpList);
		mv.addObject("svo", vo);
		mv.setViewName("/jsp/viewjobinfo.jsp");
		return mv;
	}
	@RequestMapping("/DepRequest.action")
	public ModelAndView EntryDepList(ModelAndView mv,DepListSearchVO vo, Integer pagenum) throws Exception{
		pagenum = pagenum == null ? 1 : pagenum;
		int total = us.getDepInfoListCount(vo);
		int maxpage = PageUtil.getMaxPageNum(total);
		List<DepInfoPO> DepList = us.getDepInfoList(vo, pagenum);
		mv.addObject("deplist", DepList);
		mv.addObject("svo", vo);
		mv.addObject("pagenum", pagenum);
		mv.addObject("total", total);
		mv.addObject("maxpage", maxpage);
		mv.setViewName("/jsp/deptlist.jsp");
		return mv;
	}
	@RequestMapping("/PosRequest.action")
	public ModelAndView EntryPosList(ModelAndView mv,PosListSearchVO vo, Integer pagenum) throws Exception{
		pagenum = pagenum == null ? 1 : pagenum;
		int total = us.getPosInfoListCount(vo);
		int maxpage = PageUtil.getMaxPageNum(total);
		List<PosInfoPO> PosList = us.getPosInfoList(vo, pagenum);
		mv.addObject("poslist", PosList);
		mv.addObject("svo", vo);
		mv.addObject("pagenum", pagenum);
		mv.addObject("total", total);
		mv.addObject("maxpage", maxpage);
		mv.setViewName("/jsp/joblist.jsp");
		return mv;
	}
	@RequestMapping("/setdeptcondition.action")
	public ModelAndView SetDeptCondition(DeptConditionVO vo) throws Exception{
		
		us.SetDeptCondition(vo);
		return new ModelAndView("redirect:DepRequest.action");
	}
	@RequestMapping("/setposicondition.action")
	public ModelAndView SetPosiCondition(PosiConditionVO vo) throws Exception{
		us.SetPosiCondition(vo);
		return new ModelAndView("redirect:PosRequest.action");
	}
	@RequestMapping("/setempcondition.action")
	public ModelAndView SetEmpCondition(EmpConditionVO vo) throws Exception{
		
		us.SetEmpCondition(vo);
		return new ModelAndView("redirect:StaffInfo.action");
	}
	@RequestMapping("/updateposition.action")
	public ModelAndView UpdatePosition(ModelAndView mv,int pid,int mark,String posname)throws Exception{
		
		mv.addObject("pid", pid);
		mv.addObject("mark", mark);
		mv.addObject("posname", posname);
		mv.setViewName("/jsp/modifyJob.jsp");
		return mv;
		
	}
	
	@RequestMapping("/updateposi.action")
	@ResponseBody
	 public int UpdatePosi(ModelAndView mv,UpdatePosiVO vo) throws Exception {
        	us.UpdatePosi(vo);
        	int status = 1;
        return status;
    }
	
	@RequestMapping("/updatedepartment.action")
	public ModelAndView UpdateDepartment(ModelAndView mv, int depid, int leaderid,int maxpeople,String depname)throws Exception{
		List<DepNamePO> DepList = us.getDepName();
		mv.addObject("depid", depid);
		mv.addObject("deplist", DepList);
		mv.addObject("leaderid", leaderid);
		mv.addObject("depname", depname);
		mv.addObject("maxpeople", maxpeople);
		mv.setViewName("/jsp/modifydept.jsp");
		return mv;
		
	}
	
	@RequestMapping("/updatedept.action")
	@ResponseBody
	 public int UpdateDept(ModelAndView mv,UpdateDeptVO vo) throws Exception {
        	us.UpdateDept(vo);
        	int status = 1;
        return status;
	}
	
	@RequestMapping("/updateemployee.action")
	public ModelAndView UpdateEmployee(ModelAndView mv, EmployeeSearchVO vo)throws Exception{
		List<EmployeeInfoPO> InfoList = us.getCurEmployee(vo);
		mv.addObject("emplist", InfoList);
		mv.setViewName("/jsp/modifyEmp.jsp");
		return mv;
		
	}
	
	@RequestMapping("/updateemp.action")
	@ResponseBody
	 public int UpdateDept(ModelAndView mv,UpdateEmpVO vo) throws Exception {
        	us.UpdateEmp(vo);
        	int status = 1;
        return status;
	}
	@RequestMapping("/changeEmp.action")
	public ModelAndView ChangeEmp(ModelAndView mv,int pkey,String uname,String posiname,String depaname) throws Exception{
		
		
		List<DepNamePO> depList = us.getDepName();
		List<PosNamePO> posList = us.getPosName();
		mv.addObject("pkey", pkey);
		mv.addObject("uname", uname);
		mv.addObject("posiname", posiname);
		mv.addObject("depaname", depaname);
		mv.addObject("deplist", depList);
		mv.addObject("poslist", posList);
		mv.setViewName("/jsp/changeEmp.jsp");
		return mv;
	}
	@RequestMapping("/changeempdepa.action")
	@ResponseBody
	public int ChangeEmpDepa(ModelAndView mv,ChangeEmpVO vo) throws Exception{
		us.ChangeEmpDepa(vo);
		us.ChangeEmpDepa2(vo);
		us.ChangeEmpDepa3(vo);
    	int status = 1;
    return status;
	}
	@RequestMapping("/changeempposi.action")
	@ResponseBody
	public int ChangeEmpPosi(ModelAndView mv,ChangeEmpVO vo) throws Exception{
		us.ChangeEmpPosi(vo);
		us.ChangeEmpPosi2(vo);
		us.ChangeEmpPosi3(vo);
    	int status = 1;
    return status;
	}
}
