package com.hit.mapper;

import java.util.List;

import com.hit.po.DepNamePO;
import com.hit.po.PosNamePO;
import com.hit.po.UserPO;
import com.hit.vo.DeptVO;
import com.hit.vo.EmployeeVO;
import com.hit.vo.JobVO;
import com.hit.vo.LeaveDayVO;
import com.hit.vo.UserLoginVO;
import com.hit.vo.VTypeVO;

public interface LoginMapper {
	public UserPO getPassword(String LoginName) throws Exception;
	public void changePassword(UserLoginVO user) throws Exception;
	
	public void vAddType(VTypeVO type) throws Exception;
	public void addJob(JobVO job) throws Exception;
	public void addDept(DeptVO dept) throws Exception;
	public void addEmp(EmployeeVO emp) throws Exception;
	public LeaveDayVO selectId(EmployeeVO emp) throws Exception;
	public void addLeftDays(LeaveDayVO leave) throws Exception;
	public List<DepNamePO> getDepName() throws Exception;
	public List<PosNamePO> getPosName() throws Exception;
}
