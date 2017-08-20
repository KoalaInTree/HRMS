package com.hit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hit.mapper.LoginMapper;
import com.hit.po.DepNamePO;
import com.hit.po.PosNamePO;
import com.hit.po.UserPO;
import com.hit.service.LoginService;
import com.hit.vo.DeptVO;
import com.hit.vo.EmployeeVO;
import com.hit.vo.JobVO;
import com.hit.vo.LeaveDayVO;
import com.hit.vo.UserLoginVO;
import com.hit.vo.VTypeVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginMapper mapper;
	
	@Override
	public UserPO getPassword(String LoginName) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getPassword(LoginName);
	}

	@Override
	public UserPO checkLogin(String LoginName, String password) throws Exception {
		// TODO Auto-generated method stub
		 /* 登陆验证 */
        //根据用户名实例化用户对象
        UserPO user;
		try {
			user = getPassword(LoginName);
			if (user != null && user.getPassword().equals(password)) {
	            return user;
	        }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;
	}

	@Override
	public void changePassword(UserLoginVO user) throws Exception {
		// TODO Auto-generated method stub
		mapper.changePassword(user);
	}

	@Override
	public void vAddType(VTypeVO type) throws Exception {
		// TODO Auto-generated method stub
		mapper.vAddType(type);
	}

	@Override
	public void addJob(JobVO job) throws Exception {
		// TODO Auto-generated method stub
		mapper.addJob(job);
	}

	@Override
	public void addDept(DeptVO dept) throws Exception {
		// TODO Auto-generated method stub
		mapper.addDept(dept);
	}

	@Override
	public void addEmp(EmployeeVO emp) throws Exception {
		// TODO Auto-generated method stub
		mapper.addEmp(emp);
	}

	@Override
	public LeaveDayVO selectId(EmployeeVO emp) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectId(emp);
	}

	@Override
	public void addLeftDays(LeaveDayVO leave) throws Exception {
		// TODO Auto-generated method stub
		mapper.addLeftDays(leave);
	}

	@Override
	public List<DepNamePO> getDepName() throws Exception {
		// TODO Auto-generated method stub
		return mapper.getDepName();
	}

	@Override
	public List<PosNamePO> getPosName() throws Exception {
		// TODO Auto-generated method stub
		return mapper.getPosName();
	}

}
