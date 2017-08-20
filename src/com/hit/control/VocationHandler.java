package com.hit.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.ant.VminfoTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hit.po.ApproveFormPO;
import com.hit.po.LeaveFormPO;
import com.hit.po.LeaveTypePO;
import com.hit.service.VocationService;
import com.hit.util.PageUtil;
import com.hit.vo.AddtypeVO;
import com.hit.vo.AppedListVO;
import com.hit.vo.MyVocationListSearchVO;
import com.hit.vo.TypelistVO;
import com.hit.vo.VModifyVO;


@Controller
public class VocationHandler {
	
	@Autowired
	private VocationService vs;
	
	@RequestMapping("/ulist.action")
	public ModelAndView entryVocationList(ModelAndView mv, MyVocationListSearchVO vo, Integer pagenum,HttpSession session) throws Exception{
		
		pagenum = pagenum == null ? 1 : pagenum;
		String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		vo.setStaffId(userId);
		int total = vs.getVocationListCount(vo);
		int maxpage = PageUtil.getMaxPageNum(total);
		List<LeaveFormPO> list = vs.getVocationList(vo, pagenum);
		mv.addObject("ulist", list);
		mv.addObject("svo", vo);
		System.out.println(vo.getStart());
		System.out.println(vo.getLength());
	
		mv.addObject("pagenum", pagenum);
		mv.addObject("total", total);
		mv.addObject("maxpage", maxpage);
		mv.setViewName("/jsp/vMyVocation.jsp");
		
		return mv;
		
	}
	/*@RequestMapping("/vAddType.action")
	public int addType(ModelAndView mv, String jname) throws Exception{
		
		int yan=vs.updateVocationType(jname);
		return yan;
		
		
	}*/
	
	@RequestMapping("/apped.action")
	public ModelAndView appedList(ModelAndView mv, AppedListVO vo, Integer pagenum,HttpSession session)throws Exception{
        pagenum = pagenum == null ? 1 : pagenum;
        String Id = (String)session.getAttribute("UserId");
		int userId = Integer.parseInt(Id);
		vo.setApproverId(userId);
		int total = vs.getAppedListcount(vo);
		int maxpage = PageUtil.getMaxPageNum(total);
		List<LeaveFormPO> list = vs.getAppedList(vo, pagenum);
		mv.addObject("ulist", list);
		mv.addObject("svo", vo);
		mv.addObject("pagenum", pagenum);
		mv.addObject("total", total);
		mv.addObject("maxpage", maxpage);
		mv.setViewName("/jsp/vAppedList.jsp");
		
		return mv;
	}
	
	@RequestMapping("/typelist.action")
	public ModelAndView typelist(ModelAndView mv, TypelistVO vo, Integer pagenum)throws Exception{
		pagenum = pagenum == null ? 1 : pagenum;
		
		System.out.println(vo.getEflag());
		int total = vs.getTypeListcount(vo);
		int maxpage = PageUtil.getMaxPageNum(total);
		List<LeaveTypePO> list = vs.getTypeList(vo, pagenum);
		mv.addObject("ulist", list);
		mv.addObject("svo", vo);
	
		mv.addObject("pagenum", pagenum);
		mv.addObject("total", total);
		mv.addObject("maxpage", maxpage);
		mv.setViewName("/jsp/vtypelist.jsp");
		
		return mv;
	}
	
	@RequestMapping("/getdetail.action")
	public ModelAndView getdetail(ModelAndView mv,int pkey)throws Exception{
		System.out.println(pkey);
		
		List<ApproveFormPO> list = vs.getDetail(pkey);
		List<LeaveFormPO> mist = vs.getDetail2(pkey);
		mv.addObject("ulist", list);
		mv.addObject("oklist", mist);
		mv.setViewName("/jsp/vVocationDetail.jsp");
		return mv;
	}
	
	@RequestMapping("/modify.action")
	public ModelAndView modifytype(ModelAndView mv,int pkey,String typename)throws Exception{
		mv.addObject("pkey", pkey);
		mv.addObject("typename", typename);
		mv.setViewName("/jsp/vModifyType.jsp");
		return mv;
		
	}
	
	@RequestMapping("/VModify.action")
	@ResponseBody
	 public int addEmp(ModelAndView mv,VModifyVO vo) throws Exception {
        	vs.VModify(vo);
        	System.out.println(vo.getPkey());
        	int status = 1;
        return status;
    }
	
	@RequestMapping("/setcondition.action")
	public ModelAndView setcondition(ModelAndView mv,int pkey,short eflag) throws Exception{
		System.out.println(eflag);
		if(eflag==1){
			vs.setcondition1(pkey);
			
		}
		if(eflag==2){
			vs.setcondition2(pkey);
		}
		
		/*mv.setViewName("typelist.action");
		return mv;*/
		return new ModelAndView("redirect:typelist.action");
	}

}
