package com.hit.service;

import java.util.List;

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

public interface EmployeeService {

	public List<EmployeeInfoPO> getCurEmployee(EmployeeSearchVO vo) throws Exception;
	public List<EmpPosRecInfoPO> getEmpPosRec(EmployeeSearchVO vo) throws Exception;
	public List<EmpDepRecInfoPO> getEmpDepRec(EmployeeSearchVO vo) throws Exception;
	public List<EmployeeInfoPO> getEmployeeList(EmployeeListSearchVO vo, int pagenum) throws Exception;
	public int getEmployeeListCount(EmployeeListSearchVO vo) throws Exception;
	public List<DepNamePO> getDepName() throws Exception;
	public List<PosNamePO> getPosName() throws Exception;
	public void SetEmpCondition(EmpConditionVO vo) throws Exception;
	public void UpdateEmp(UpdateEmpVO vo) throws Exception;
		
	public List<DepInfoPO> getDepInfoList(DepListSearchVO vo, int pagenum) throws Exception;
	public int getDepInfoListCount(DepListSearchVO vo) throws Exception;
	public List<DepInfoPO> getCurDep(DepListSearchVO vo) throws Exception;
	public int getCurDepPeopleCount(DepListSearchVO vo) throws Exception;
	public List<EmpInDepPO> getEmpInDep(DepListSearchVO vo) throws Exception;
	public void SetDeptCondition(DeptConditionVO vo) throws Exception;
	public void UpdateDept(UpdateDeptVO vo) throws Exception;
	
	public List<PosInfoPO> getPosInfoList(PosListSearchVO vo, int pagenum) throws Exception;
	public int getPosInfoListCount(PosListSearchVO vo) throws Exception;
	public List<PosInfoPO> getCurPos(PosListSearchVO vo) throws Exception;
	public List<EmpInPosPO> getEmpInPos(PosListSearchVO vo) throws Exception;
	public void SetPosiCondition(PosiConditionVO vo) throws Exception;	
	public void UpdatePosi(UpdatePosiVO vo) throws Exception;
	public void ChangeEmpDepa(ChangeEmpVO vo) throws Exception;
	public void ChangeEmpDepa2(ChangeEmpVO vo) throws Exception;
	public void ChangeEmpDepa3(ChangeEmpVO vo) throws Exception;
	public void ChangeEmpPosi(ChangeEmpVO vo) throws Exception;
	public void ChangeEmpPosi2(ChangeEmpVO vo) throws Exception;
	public void ChangeEmpPosi3(ChangeEmpVO vo) throws Exception;
	
	


}
