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
		<link rel="stylesheet" href="/HRMS/css/unicorn.main.css" />
		<link rel="stylesheet" href="/HRMS/css/unicorn.grey.css" class="skin-color" />	        <style>
			tr{
				height:40px;
			}
		</style>
		<script src="/HRMS/js/jquery.min.js"></script>
       	<script src="/HRMS/js/jquery.ui.custom.js"></script>
       	<script src="/HRMS/js/bootstrap.min.js"></script>
       	<script src="/HRMS/js/bootstrap-colorpicker.js"></script>
       	<script src="/HRMS/js/bootstrap-datepicker.js"></script>
       	<script src="/HRMS/js/jquery.uniform.js"></script>
       	<script src="/HRMS/js/unicorn.js"></script>
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
                <li id = "staffInfo">
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
                <li id = "positionInfo" class="active">
                    <a href="/HRMS/PosRequest.action">
                        <i class="icon icon-briefcase" ></i> 
                        <span>职位信息管理</span> 
                    </a>
                </li>
            </ul>
        </div>
        
        
        
        <div id="content">
			<div id="content-header">
				<h1>查看职位信息</h1>
			</div>
			<div id="breadcrumb">
				<a href="/HRMS/jsp/main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>首页
                </a>
				<a href="/HRMS/PosRequest.action">职位列表</a>
				<a href="#" class="current">查看职位</a>
			</div>
        	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>基础信息</h5>
							</div>
                            <table width="100%">
                            	<tr>
                                	<td width="15%" align="right">职位编号:</td>
                                    <td width="60%" align="left">
                                    	&nbsp;&nbsp;
                                    	<c:forEach var="cp" items="${curpos}">
                                    	${cp.positionid}
                                    	</c:forEach>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                	<td align="right">职位名称:</td>
                                    <td align="left">
                                    	&nbsp;&nbsp;
                                    	<c:forEach var="cp" items="${curpos}">
                                    	${cp.positionname}
                                    	</c:forEach>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                	<td align="right">职位级别:</td>
                                    <td align="left">
                                    	&nbsp;&nbsp;
                                    	<c:forEach var="cp" items="${curpos}">
                                    	${cp.positionlevel}
                                    	</c:forEach>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td align="right">状态:</td>
                                    <td align="left">
                                        &nbsp;&nbsp;
                                       <c:forEach var="cp" items="${curpos}">
                                      	<c:choose>
                                        	<c:when test="${cp.mark==1}"> 活动 </c:when>
                                        	<c:when test="${cp.mark==2}"> 撤销 </c:when>     
                                        </c:choose>  
                                        </c:forEach>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
						</div>			
					</div>
				</div>	
			</div>
        	<hr/>
			<div class="widget-box">
				<div class="widget-title">
					<span class="icon">
						<i class="icon-th"></i>
					</span>
					<h5>职位员工信息</h5>
				</div>
				<div class="widget-content nopadding">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
                                <th>员工编号</th>
								<th>姓名</th>
								<th>部门</th>
                                <th>性别</th>
                                <th>年龄</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="eip" items="${empinpos}">
							<tr>
								<td>${eip.staffid}</td>
								<td>${eip.staffname}</td>
								<td>${eip.departmentname}</td>
								<td>${eip.sex}</td>
                                <td>${eip.age}</td>
							</tr>
						</c:forEach>
                            
						</tbody>
					</table>							
				</div>
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