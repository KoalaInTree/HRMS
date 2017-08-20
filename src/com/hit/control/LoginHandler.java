package com.hit.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hit.po.DepNamePO;
import com.hit.po.PosNamePO;
import com.hit.po.UserPO;
import com.hit.service.LoginService;
import com.hit.util.FileUploadUtil;
import com.hit.vo.DeptVO;
import com.hit.vo.EmployeeVO;
import com.hit.vo.JobVO;
import com.hit.vo.LeaveDayVO;
import com.hit.vo.UserLoginVO;
import com.hit.vo.VTypeVO;

@Controller
@SessionAttributes("Save") //①将ModelMap中属性名为Login的属性 
public class LoginHandler {
	
	@Autowired
	private LoginService us;
	
	
	@RequestMapping("/login.action")
    public ModelAndView login(ModelAndView mv,UserLoginVO vo,HttpServletRequest request) throws Exception {
		UserPO user;
        user=us.checkLogin(vo.getUname(), vo.getPassword());
        if(user!=null){
        	HttpSession session=request.getSession();
        	session.setAttribute("UName", user.getUname());
        	session.setAttribute("Privilege", user.getPrivilege());
        	System.out.println("------------------------------------------------------"+user.getPkey());
        	session.setAttribute("UserId", user.getPkey());
        	System.out.println("privilege-----------------------------------------"+ user.getPrivilege());
        	if(user.getPrivilege().equals("2")){
        		mv.setViewName("/jsp/main.jsp");
        	}else if(user.getPrivilege().equals("1")){
        		mv.setViewName("/jsp/main.jsp");
        	}else{
        		mv.addObject("message","登录名和密码错误，请重新输入");
                mv.setViewName("/jsp/main.jsp");
        	}
        }else {
            //登录失败，设置失败信息，并调转到登录页面
            
            mv.addObject("message","登录名和密码错误，请重新输入");
            mv.setViewName("/jsp/login.jsp");
        }
        return mv;
    }
	
	@RequestMapping("/changePassword.action")
	@ResponseBody
	 public int changePassword(ModelAndView mv,UserLoginVO vo) throws Exception {
			
        	us.changePassword(vo);
        	int status = 1;
        return status;
    }
	
	@RequestMapping("/vAddType.action")
	@ResponseBody
	 public int vAddType(ModelAndView mv,VTypeVO vo) throws Exception {
			
        	us.vAddType(vo);
        	int status = 1;
        return status;
    }
	
	@RequestMapping("/addJob.action")
	@ResponseBody
	 public int addJob(ModelAndView mv,JobVO vo) throws Exception {
			
        	us.addJob(vo);
        	int status = 1;
        return status;
    }
	
	@RequestMapping("/addDept.action")
	@ResponseBody
	 public int addDept(ModelAndView mv,DeptVO vo) throws Exception {
        	us.addDept(vo);
        	int status = 1;
        return status;
    }
	
	@RequestMapping("/addEmp.action")
	@ResponseBody
	 public int addEmp(ModelAndView mv,EmployeeVO vo,HttpServletRequest request) throws Exception {
			List<String> list = FileUploadUtil.uploadFiles(request, "/img");
			for(String fname : list){
				System.out.println("新文件名:"+fname);
			}
			request.setAttribute("flist", list);
        	us.addEmp(vo);
//        	
//        	LeaveDayVO leave = us.selectId(vo);
//        	System.out.println("----------------------------------"+leave.getStaffid());
//        	us.addLeftDays(leave);
        	int status = 1;
        return status;
    }
	
	 @RequestMapping("/addEmpTmp.action")
	 public ModelAndView addEmpTmp(ModelAndView mv,EmployeeVO vo) throws Exception {
        	List<DepNamePO> DepList =  us.getDepName();
        	List<PosNamePO> PosList =  us.getPosName();
        	mv.addObject("deplist", DepList);
        	mv.addObject("poslist", PosList);
        	mv.setViewName("/jsp/addEmp.jsp");
        return mv;
    }
	 
	 @RequestMapping("/addDeptTmp.action")
	 public ModelAndView addDeptTmp(ModelAndView mv,EmployeeVO vo) throws Exception {
        	List<PosNamePO> PosList =  us.getPosName();
        	mv.addObject("poslist", PosList);
        	mv.setViewName("/jsp/addDept.jsp");
        return mv;
    }
	
}