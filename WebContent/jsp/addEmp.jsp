<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>企业人事管理平台</title>
		<meta charset="UTF-8" />
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
        <script src="/HRMS/js/addemp.js"></script>	            
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
                        <li id = "WaitList"><a href="/HRMS/searchLeaveInfo.action">审批休假</a></li>
                        <li><a href="/HRMS/ulist.action">查看休假记录</a></li>
                        <li id = "AppList"><a href="/HRMS/apped.action">查看审批记录</a></li>
                        <li id = "TypeList"><a href="/HRMS/typelist.action">假期类型管理</a></li>
                    </ul>
                </li>
                <li id = "staffInfo" class="active">
                    <a href="/HRMS/StaffInfo.action">
                        <i class="icon icon-user" > </i>
                        <span>员工信息管理</span> 
                    </a>
                </li>
                <li id = "deptInfo">
                    <a href="/HRMS/DepRequest.action">
                        <i class="icon icon-flag" ></i> 
                        <span>部门信息管理</span> 
                    </a>
                </li>
                <li id = "positionInfo">
                    <a href="/HRMS/PosRequest.action">
                        <i class="icon icon-briefcase" ></i> 
                        <span>职位信息管理</span> 
                    </a>
                </li>
            </ul>
        </div>
		<div id="content">
			<div id="content-header">
				<h1>新增员工</h1>
			</div>
			<div id="breadcrumb">
				<a href="/HRMS/jsp/main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>
                                                    首页
                </a>
				<a href="/HRMS/jsp/emplist.jsp">员工列表</a>
				<a href="#" class="current">新增员工</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
						<div class="span12">
							<div class="widget-box">
								<div class="widget-title">
									<span class="icon">
										<i class="icon-align-justify"></i>									
									</span>
									<h5>员工信息</h5>
								</div>
								<div class="widget-content nopadding">
									<form id="eform" class="form-horizontal" method="post" />
	                                    <div id="info1" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	员工姓名:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="text" name="ename" id="ename" />
	                                        </div>
	                                    </div>
	                                    <div id="info2" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	登录名:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="text" name="lname" id="lname" />
	                                        </div>
	                                    </div>
	                                    <div id="info3" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	登录密码:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="password" name="lpass" id="lpass" />
	                                        </div>
	                                    </div>
	                                    <div id="info4" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	性别:
	                                        </label>
	                                        <div class="controls">
	                                            <select id="sex" name="sex">
	                                            	<option value="-1">=请选择=</option>
	                                            	<option value="男">男</option>
	                                            	<option value="女">女</option>
	                                            </select>
	                                        </div>
	                                    </div>
	                                    <div id="info5" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	生日:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="text" name="birthday" id="birthday" data-date-format="yyyy-mm-dd" readonly class="datepicker"/>
	                                        </div>
	                                    </div>
	                                    <div id="info6" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	入职日期:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="text" name="hiredate" id="hiredate" data-date-format="yyyy-mm-dd" readonly class="datepicker" />
	                                        </div>
	                                    </div>
	                                    <div id="info7" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	月薪:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="text" name="salary" id="salary" />
	                                        </div>
	                                    </div>
	                                    <div id="info8" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	权限:
	                                        </label>
	                                        <div class="controls">
	                                            <select id="power" name="power">
	                                            	<option value="-1">=请选择=</option>
	                                            	<option value="1">普通员工</option>
	                                            	<option value="2">管理员</option>
	                                            </select>
	                                        </div>
	                                    </div>
	                                    <div id="info9" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	入职部门:
	                                        </label>
	                                        <div class="controls">
	                                            <select id="dept" name="dept">
                                                	<option value="">=请选择=</option>
                                                	<c:forEach var="dl" items="${deplist}">
                                                	<option value="${dl.departmentid}">${dl.departmentname} </option>
                                                    </c:forEach>
	                                            </select>
	                                        </div>
	                                    </div>
	                                    <div id="info10" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	职位:
	                                        </label>
	                                        <div class="controls">
	                                            <select id="job" name="job">
	                                            	<option value="0">=请选择=</option>
	                                            	<c:forEach var="pl" items="${poslist}">
                                                	<option value="${pl.positionid}">${pl.positionname} </option>
                                                    </c:forEach>
	                                            </select>
	                                        </div>
	                                    </div>
                                        <div id="info11" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	照片:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="file" name="headimg" id="headimg" />
	                                        </div>
	                                    </div>
	                                    <div class="form-actions">
	                                        <input id="btn_submit"  type="button" value="提交" class="btn btn-primary" />
	                                        <input type="reset" value="重置" class="btn btn-primary" />
	                                    </div>
	                                </form>
<script type="text/javascript">
		$("#btn_submit").click(function(){
			var ename = $("#ename").val();	//员工姓名
			var lname = $("#lname").val();	//员工登录名
			var lpass = $("#lpass").val();
			var sex = $("#sex").val();
			var birthday = $("#birthday").val();
			var hiredate = $("#hiredate").val();
			var salary = $("#salary").val();
			var power = $("#power").val();
			var dept = $("#dept").val();
			var job = $("#job").val();
			var headimg = $("#headimg").val();
			
				$.ajax({
					type:"POST",
					url:"/HRMS/addEmp.action",
					data:{"ename": ename,"lname":lname,"lpass":lpass,"sex":sex,"birthday":birthday,"hiredate":hiredate,"salary":salary,"power":power,"dept":dept,"job":job,"headimg":headimg},
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
						$("#ename").val("");
						$("#lname").val("");
						$("#lpass").val("");
						$("#sex").val("");
						$("#birthday").val("");
						$("#hiredate").val("");
						$("#salary").val("");
						$("#power").val("");
						$("#dept").val("");
						$("#job").val("");
						$("#headimg").val("");
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

            <div id="success_alert"class="alert alert-success" hidden>
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