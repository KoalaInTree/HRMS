//¡∫ È∫∆
package com.hit.service;

import java.util.List;

import com.hit.po.ApproveFormPO;
import com.hit.po.LeaveFormPO;
import com.hit.po.LeaveTypePO;
import com.hit.vo.AppedListVO;
import com.hit.vo.MyVocationListSearchVO;
import com.hit.vo.TypelistVO;
import com.hit.vo.VModifyVO;

public interface VocationService {
	public int getVocationListCount(MyVocationListSearchVO vo) throws Exception;
	public List<LeaveFormPO> getVocationList(MyVocationListSearchVO vo, int pagenum) throws Exception;
	//public int updateVocationType(String jname);
	public int getAppedListcount(AppedListVO vo) throws Exception;
	public List<LeaveFormPO> getAppedList(AppedListVO vo, Integer pagenum) throws Exception;
	public int getTypeListcount(TypelistVO vo) throws Exception;
	public List<LeaveTypePO> getTypeList(TypelistVO vo, Integer pagenum) throws Exception;
	public List<ApproveFormPO> getDetail(int pkey)throws Exception;
	public List<LeaveFormPO> getDetail2(int pkey)throws Exception;
	public void VModify(VModifyVO vo)throws Exception;
	public void setcondition1(int pkey)throws Exception;
	public void setcondition2(int pkey)throws Exception;
	

}
