package com.hit.mapper;

import java.util.List;

import com.hit.po.ApproveFormPO;
import com.hit.po.LeaveFormPO;
import com.hit.po.LeaveTypePO;
import com.hit.vo.AppedListVO;
import com.hit.vo.MyVocationListSearchVO;
import com.hit.vo.TypelistVO;
import com.hit.vo.VModifyVO;

public interface MyVocation {

	
	public int getVocationListCount(MyVocationListSearchVO vo) throws Exception;
	public List<LeaveFormPO> getVocationList(MyVocationListSearchVO vo) throws Exception;
	//public int updateVocationType(String jname);
	public int getAppedListcount(AppedListVO vo);
	public List<LeaveFormPO> getAppedList(AppedListVO vo);
	public int getTypeListcount(TypelistVO vo);
	
	public List<LeaveTypePO> getTypeList(TypelistVO vo);
	public List<ApproveFormPO> getDetail(int pkey);
	public List<LeaveFormPO> getDetail2(int pkey);
	public void VModify(VModifyVO vo) throws Exception;
	public void setcondition1(int pkey);
	public void setcondition2(int pkey);
}
