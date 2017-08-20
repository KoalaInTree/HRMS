package com.hit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hit.mapper.MyVocation;
import com.hit.po.ApproveFormPO;
import com.hit.po.LeaveFormPO;
import com.hit.po.LeaveTypePO;
import com.hit.service.VocationService;
import com.hit.util.PageUtil;
import com.hit.vo.AppedListVO;
import com.hit.vo.MyVocationListSearchVO;
import com.hit.vo.TypelistVO;
import com.hit.vo.VModifyVO;


@Service
public class VocationServiceImpl implements VocationService {
	
	@Autowired
	private MyVocation mapper;
	
	@Override
	public int getVocationListCount(MyVocationListSearchVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getVocationListCount(vo);
	}

	@Override
	public List<LeaveFormPO> getVocationList(MyVocationListSearchVO vo, int pagenum) throws Exception {
		// TODO Auto-generated method stub
		int start = PageUtil.getSQLIndexByPageNum(pagenum);
		int length = PageUtil.EVERY_PAGE_ITEMS;
		vo.setStart(start);
		vo.setLength(length);
		return mapper.getVocationList(vo);
	}
	@Override
	public int getAppedListcount(AppedListVO vo){
		return mapper.getAppedListcount(vo);
		
	}
	@Override
	public List<LeaveFormPO> getAppedList(AppedListVO vo, Integer pagenum) throws Exception{
		
		int start = PageUtil.getSQLIndexByPageNum(pagenum);
		int length = PageUtil.EVERY_PAGE_ITEMS;
		vo.setStart(start);
		vo.setLength(length);
		return mapper.getAppedList(vo);
		
	}
	@Override
	public int getTypeListcount(TypelistVO vo) throws Exception{
		
		return mapper.getTypeListcount(vo);
		
	}
	@Override
	public List<LeaveTypePO> getTypeList(TypelistVO vo, Integer pagenum) throws Exception{
		int start = PageUtil.getSQLIndexByPageNum(pagenum);
		int length = PageUtil.EVERY_PAGE_ITEMS;
		vo.setStart(start);
		vo.setLength(length);
		return mapper.getTypeList(vo);
	}
	@Override
	public List<ApproveFormPO> getDetail(int pkey)throws Exception{
		return mapper.getDetail(pkey);
	}
	@Override
	public List<LeaveFormPO> getDetail2(int pkey)throws Exception{
		return mapper.getDetail2(pkey);
		
	}

	@Override
	public void VModify(VModifyVO vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.VModify(vo);
	}
	@Override
	public void setcondition1(int pkey)throws Exception{
		mapper.setcondition1(pkey);
		
		
	}
	@Override
	public void setcondition2(int pkey)throws Exception{
		mapper.setcondition2(pkey);
	}

}
