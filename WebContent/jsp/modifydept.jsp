<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业人事管理平台</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="/HRMS/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/HRMS/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="/HRMS/css/uniform.css" />
		<link rel="stylesheet" href="/HRMS/css/datepicker.css" />	
		<link rel="stylesheet" href="/HRMS/css/unicorn.main.css" />
		<link rel="stylesheet" href="/HRMS/css/unicorn.grey.css" class="skin-color" />			
		<script src="/HRMS/js/jquery.min.js"></script>
        <script src="/HRMS/js/jquery.ui.custom.js"></script>
        <script src="/HRMS/js/bootstrap.min.js"></script>
        <script src="/HRMS/js/jquery.uniform.js"></script>
        <script src="/HRMS/js/bootstrap-datepicker.js"></script>
        <script src="/HRMS/js/jquery.validate.js"></script>
        <script src="/HRMS/js/unicorn.js"></script> 
        <script type="text/javascript">
        	$(document).ready(function (){
        		$("form input").blur(function (){
        			validateInput(this);
        		});
        		$("form").submit(function (){
        			var f = true;

        			var a = $("form input"); 
        			
        			for(var i = 0; i < a.size(); i++){
        				var t = validateInput(a.get(i));
        				f = f && t;
        			}
        			return f;
        		});
        		$("#userid").bind("input", function (){
        			var userid = $(this).val();
        			if(userid == 1045){
        				$("#span1").html("李建国");
        			}else{
        				$("#span1").html("员工姓名");
        			}
        		})
        	});

        	function validateInput(obj){
        		var v = $(obj).val();
    			if(v == ""){
    				$(obj).parent().parent().removeClass("success");
					$(obj).parent().parent().addClass("error");
					return false;
    			}else{
    				$(obj).parent().parent().removeClass("error");
					$(obj).parent().parent().addClass("success");
					return true;
    			}
        	}
        </script>          
</head>
<body>
<div id="header"><h1></h1></div>
		
        <div id="user-nav" class="navbar navbar-inverse">
            <ul class="nav btn-group">
                <li class="btn btn-inverse">
                    <a href="#">
                        <i class="icon icon-user"></i>
                        <span class="text">
                            <%=session.getAttribute("UName")%>
                        </span>
                    </a>
                </li>
                <li class="btn btn-inverse">
                    <a href="/HRMS/jsp/login.jsp">
                        <i class="icon icon-share-alt"></i>
                        <span class="text">注销</span>
                    </a>
                </li>
            </ul>
        </div>
        <div id="sidebar">
            <ul>
                <li>
                    <a href="/HRMS/jsp/main.jsp">
                        <i class="icon icon-home"></i> 
                        <span>首页</span>
                    </a>
                </li>
                <li>
                    <a href="/HRMS/CurStaffInfo.action">
                        <i class="icon icon-tag"></i> 
                        <span>查看个人信息</span>
                    </a>
                </li>
                <li>
                    <a href="/HRMS/jsp/changePassword.jsp">
                        <i class="icon icon-ok-circle"></i> 
                        <span>修改登录密码</span>
                    </a>
                </li>
                <li class="submenu">
                    <a href="#">
                        <i class="icon icon-time"></i> 
                        <span>休假管理</span> 
                        <!--
                        <span class="label">2</span>
                        -->
                    </a>
                    <ul>
                        <li><a href="/HRMS/jsp/vAddVacation.jsp">申请休假</a></li>
                        <li id="WaitList"><a href="/HRMS/searchLeaveInfo.action">审批休假</a></li>
                        <li><a href="/HRMS/ulist.action">查看休假记录</a></li>
                        <li id="AppList"><a href="/HRMS/apped.action">查看审批记录</a></li>
                        <li id="TypeList"><a href="/HRMS/typelist.action">假期类型管理</a></li>
                    </ul>
                </li>
                <li id="staffInfo">
                    <a href="/HRMS/StaffInfo.action">
                        <i class="icon icon-user"></i> 
                        <span>员工信息管理</span> 
                    </a>
                </li>
                <li id="deptInfo" class="active">
                    <a href="/HRMS/DepRequest.action">
                        <i class="icon icon-flag"></i> 
                        <span>部门信息管理</span> 
                    </a>
                </li> 
                <li id="positionInfo">
                    <a href="/HRMS/PosRequest.action">
                        <i class="icon icon-briefcase"></i> 
                        <span>职位信息管理</span> 
                    </a>
                </li>
            </ul>
        </div>
		<div id="content">
			<div id="content-header">
				<h1>修改部门</h1>
			</div>
			<div id="breadcrumb">
				<a href="/HRMS/jsp/main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>
                                                    首页
                </a>
				<a href="/HRMS/DepRequest.action">部门列表</a>
				<a href="#" class="current">修改部门</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
						<div class="span12">
							<div class="widget-box">
								<div class="widget-title">
									<span class="icon">
										<i class="icon-align-justify"></i>									
									</span>
									<h5>部门信息</h5>
								</div>
								<div class="widget-content nopadding">
									<form id="eform" action="#" class="form-horizontal" method="post" />
	                                    <div id="info1" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	部门名称:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="text" name="dname" id="dname" value="${depname}" />
	                                        </div>
	                                    </div>
	                                    <div id="info2" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	负责人员工编号:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="text" name="userid" id="userid" value="${leaderid}" />
	                                            <span id="span1">${leadername}</span>
	                                        </div>
	                                    </div>
	                                    <div id="info3" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	部门编制:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="number" name="dno" id="dno" value="${maxpeople}" />
	                                        </div>
	                                    </div>
	                                    <div id="info4" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	上级部门:
	                                        </label>
	                                        <div class="controls">
	                                            <select id="uplevel" name="uplevel">
	                                            	<option value="" selected>无上级部门</option>
	                                            	<c:forEach var="dl" items="${deplist}">                                    	                                  	
									                <option value="${dl.departmentid}">${dl.departmentname}</option>
								                 	</c:forEach>
	                                            </select>
	                                        </div>
	                                    </div>
	                                    <div class="form-actions">
	                                        <input id="coco_submit" type="button" value="提交" class="btn btn-primary" />
	                                        <input type="reset" value="重置" class="btn btn-primary" />
	                                    </div>
	                                    <input type="hidden" id="depid" value="${depid}">
	                                </form>
	                                <script type="text/javascript">
		$("#coco_submit").click(function(){
			var dname = $("#dname").val();	//部门名称
			var dlid = $("#userid").val();	//负责人编号
			var maxpeople = $("#dno").val();
			var upperid = $("#uplevel").val();
			var did = $("#depid").val();
			
				$.ajax({
					type:"POST",
					url:"/HRMS/updatedept.action",
					data:{"dname": dname,"dlid":dlid,"maxpeople":maxpeople,"upperid":upperid,"did":did
						},
					dataType:"json",
					error:function (){
						$("#error_alert").show(function(){
							$("#error_alert").fadeOut(3000);
						})
					},
					
					success: function (status){
						//alert(status);
						$("#success_alert").show(function(){
							$("#success_alert").fadeOut(3000);
						});
						$("#dname").val("");
						$("#userid").val("");
						$("#dno").val("");
						$("#uplevel").val("");						
				
					}
			});

		})
</script>
								</div>
							</div>			
						</div>
				</div>	
			</div>	

            <div id="error_alert" class="alert alert-error" hidden>
                保存失败
            </div>

            <div id="success_alert" class="alert alert-success" hidden>
                保存成功
            </div>

			
		</div>		
        <div class="row-fluid">&nbsp;</div>
        <div class="row-fluid">
            <div id="footer" class="span12">
                2016 &copy; 企业人事管理平台
            </div>
        </div>
		<script type="text/javascript"> 
  		 	var UName="<%=session.getAttribute("UName")%>";
  			var Privilege="<%=session.getAttribute("Privilege")%>";
		
			if(Privilege==1){
				$("#WaitList").hide();
				$("#AppList").hide();
				$("#TypeList").hide();
				$("#staffInfo").hide();
				$("#deptInfo").hide();
				$("#positionInfo").hide();
			}
	</script>
</body>
</html>