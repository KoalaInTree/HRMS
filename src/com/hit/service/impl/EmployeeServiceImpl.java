package com.hit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hit.mapper.EmployeeMapper;
import com.hit.po.DepInfoPO;
import com.hit.po.DepNamePO;
import com.hit.po.EmpDepRecInfoPO;
import com.hit.po.EmpInDepPO;
import com.hit.po.EmpInPosPO;
import com.hit.po.EmpPosRecInfoPO;
import com.hit.po.EmployeeInfoPO;
import com.hit.po.PosInfoPO;
import com.hit.po.PosNamePO;
import com.hit.po.UserPO;
import com.hit.service.EmployeeService;
import com.hit.util.PageUtil;
import com.hit.vo.ChangeEmpVO;
import com.hit.vo.DepListSearchVO;
import com.hit.vo.DeptConditionVO;
import com.hit.vo.DeptVO;
import com.hit.vo.EmpConditionVO;
import com.hit.vo.EmployeeListSearchVO;
import com.hit.vo.EmployeeSearchVO;
import com.hit.vo.EmployeeVO;
import com.hit.vo.JobVO;
import com.hit.vo.LeaveDayVO;
import com.hit.vo.PosListSearchVO;
import com.hit.vo.PosiConditionVO;
import com.hit.vo.UpdateDeptVO;
import com.hit.vo.UpdateEmpVO;
import com.hit.vo.UpdatePosiVO;
import com.hit.vo.UserLoginVO;
import com.hit.vo.VTypeVO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeMapper mapper;

	@Override
	public List<EmployeeInfoPO> getCurEmployee(EmployeeSearchVO vo) throws Exception {
		return mapper.getCurEmployee(vo);
	}	
	public List<EmpPosRecInfoPO> getEmpPosRec(EmployeeSearchVO vo) throws Exception{
    	
		return mapper.getEmpPosRec(vo);
	}   
	public List<EmpDepRecInfoPO> getEmpDepRec(EmployeeSearchVO vo) throws Exception{
		return mapper.getEmpDepRec(vo);
	}
	public List<EmployeeInfoPO> getEmployeeList(EmployeeListSearchVO vo, int pagenum) throws Exception{
		int start = PageUtil.getSQLIndexByPageNum(pagenum);
		int length = PageUtil.EVERY_PAGE_ITEMS;
		vo.setStart(start);
		vo.setLength(length);
		return mapper.getEmployeeList(vo);
	}
	
	public int getEmployeeListCount(EmployeeListSearchVO vo) throws Exception{
		return mapper.getEmployeeListCount(vo);
	}
	
	public List<DepNamePO> getDepName() throws Exception{
		return mapper.getDepName();
	}
	public List<PosNamePO> getPosName() throws Exception{
		return mapper.getPosName();
	}
	public void SetEmpCondition(EmpConditionVO vo) throws Exception{
		mapper.SetEmpCondition(vo);
	}
	public void UpdateEmp(UpdateEmpVO vo) throws Exception{
		mapper.UpdateEmp(vo);
	}
	
	public List<DepInfoPO> getDepInfoList(DepListSearchVO vo, int pagenum) throws Exception{
		
		int start = PageUtil.getSQLIndexByPageNum(pagenum);
		int length = PageUtil.EVERY_PAGE_ITEMS;
		vo.setStart(start);
		vo.setLength(length);
		return mapper.getDepInfoList(vo);	

	}
	public int getDepInfoListCount(DepListSearchVO vo) throws Exception{
		return mapper.getDepInfoListCount(vo);
	}
	public List<DepInfoPO> getCurDep(DepListSearchVO vo) throws Exception{
		return mapper.getCurDep(vo);	
	}
	public int getCurDepPeopleCount(DepListSearchVO vo) throws Exception{
		return mapper.getCurDepPeopleCount(vo);
	}
	public List<EmpInDepPO> getEmpInDep(DepListSearchVO vo) throws Exception{
		return mapper.getEmpInDep(vo);
	}
	
	public List<PosInfoPO> getPosInfoList(PosListSearchVO vo, int pagenum) throws Exception{
		
		int start = PageUtil.getSQLIndexByPageNum(pagenum);
		int length = PageUtil.EVERY_PAGE_ITEMS;
		vo.setStart(start);
		vo.setLength(length);
		return mapper.getPosInfoList(vo);
	}
	public int getPosInfoListCount(PosListSearchVO vo) throws Exception{
		return mapper.getPosInfoListCount(vo);
	}
	public List<PosInfoPO> getCurPos(PosListSearchVO vo) throws Exception{
		return mapper.getCurPos(vo);
	}
	public List<EmpInPosPO> getEmpInPos(PosListSearchVO vo) throws Exception{
		return mapper.getEmpInPos(vo);
	}
	public void SetDeptCondition(DeptConditionVO vo) throws Exception{
		mapper.SetDeptCondition(vo);
	}
	public void SetPosiCondition(PosiConditionVO vo) throws Exception{
		mapper.SetPosiCondition(vo);
	}
	public void UpdatePosi(UpdatePosiVO vo) throws Exception{
		mapper.UpdatePosi(vo);
	}
	public void UpdateDept(UpdateDeptVO vo) throws Exception{
		mapper.UpdateDept(vo);
	}
	public void ChangeEmpDepa(ChangeEmpVO vo) throws Exception{
		mapper.ChangeEmpDepa(vo);
	}
	public void ChangeEmpDepa2(ChangeEmpVO vo) throws Exception{
		mapper.ChangeEmpDepa2(vo);
	}
	public void ChangeEmpDepa3(ChangeEmpVO vo) throws Exception{
		mapper.ChangeEmpDepa3(vo);
	}
	public void ChangeEmpPosi(ChangeEmpVO vo) throws Exception{
		mapper.ChangeEmpPosi(vo);
	}
	public void ChangeEmpPosi2(ChangeEmpVO vo) throws Exception{
		mapper.ChangeEmpPosi2(vo);
	}
	public void ChangeEmpPosi3(ChangeEmpVO vo) throws Exception{
		mapper.ChangeEmpPosi3(vo);
	}
	
}
