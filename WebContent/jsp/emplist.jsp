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
        <link rel="stylesheet" href="/HRMS/css/colorpicker.css" />
        <link rel="stylesheet" href="/HRMS/css/datepicker.css" />
		<link rel="stylesheet" href="/HRMS/css/uniform.css" />	
		<link rel="stylesheet" href="/HRMS/css/unicorn.main.css" />
		<link rel="stylesheet" href="/HRMS/css/unicorn.grey.css" class="skin-color" />	          
		<script src="/HRMS/js/jquery.min.js"></script>
       	<script src="/HRMS/js/jquery.ui.custom.js"></script>
       	<script src="/HRMS/js/bootstrap.min.js"></script>
       	<script src="/HRMS/js/bootstrap-colorpicker.js"></script>
       	<script src="/HRMS/js/bootstrap-datepicker.js"></script>
       	<script src="/HRMS/js/jquery.uniform.js"></script>
       	<script src="/HRMS/js/unicorn.js"></script>
		<script type="text/javascript" language="javascript">
			$(document).ready(function(){
				$(".fg-button.ui-state-ok").click(function (){
					var p = $(this).attr("page");
					$("input[name='pagenum']").val(p);
					$("#f1").submit();
				});
				$('input[type=checkbox],input[type=radio],input[type=file]').uniform();
				$('.datepicker').datepicker();
			});
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
                <li id="staffInfo" class="active">
                    <a href="/HRMS/StaffInfo.action">
                        <i class="icon icon-user"></i> 
                        <span>员工信息管理</span> 
                    </a>
                </li>
                <li id="deptInfo">
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
				<h1>员工信息管理</h1>
			</div>
			<div id="breadcrumb">
				<a href="/HRMS/jsp/main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>
                                                    首页
                </a>
				<a href="#" class="current">员工信息管理</a>
			</div>
			<form action="/HRMS/StaffInfo.action" method="post" name="searchForm" id="f1">
			<input type="hidden" name="pagenum" id="pagenum"/>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="control-group">
						<span class="span3">
							姓名：<input id="uname" name="uname" type="text" style="width:65%" value="${svo.uname}"/>
						</span>
						<span class="span3">
						    <input type="hidden" name="sex">
							性别：<select id="sex" name="_sex" style="width:70%">
									<option value="">=请选择=</option>
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
						</span>
						<span class="span3">
						    <input type="hidden" name="positionname">
							职位：<select id="job" name="_position" style="width:70%">
									<option value="0">=请选择=</option>
									<c:forEach var="pl" items="${poslist}"> 
									<option value="${pl.positionname}">${pl.positionname}</option> 
									</c:forEach> 
								</select>
						</span>
						<span class="span3">
						    <input type="hidden" name="departmentname">
							部门：<select id="dept" name="_department" style="width:70%">
									<option value="0">=请选择=</option>									
									<c:forEach var="dl" items="${deplist}">                                    	                                  	
									<option value="${dl.departmentname}">${dl.departmentname}</option>
									</c:forEach>
								</select>
						</span>
					</div>
					<div class="control-group">

						<span class="span6">
							入职日期：
							<input readonly id="sdate" name="sdate" type="text" data-date-format="yyyy-mm-dd" class="datepicker" value="${svo.sdate}"/> - 
							<input readonly id="edate" name="edate" type="text" data-date-format="yyyy-mm-dd" class="datepicker" value="${svo.edate}"/>
                        </span>   
						<span class="span3">
						    <input type="hidden" name="mark">
							状态：<select id="eflag" name="_mark" style="width:70%">
									<option value="">=请选择=</option>
									<option value="1">在职</option>
                                    <option value="2">离职</option>
								</select>
						</span>
                        <span class="span3">
							<button class="btn btn-info" type="submit">
								<i class="icon-white icon-search"></i>
								查询
							</button>
							<script type="text/javascript">
								$("#eflag").click(function(){
									var p = $(this).val();
									$("input[name='mark']").val(p);
								})
								$("#sex").click(function(){
									var p = $(this).val();
									$("input[name='sex']").val(p);
								})
								$("#job").click(function(){
									var p = $(this).val();
									$("input[name='positionname']").val(p);
								})
								$("#dept").click(function(){
									var p = $(this).val();
									$("input[name='departmentname']").val(p);
								})
							</script>
							<button  class="btn btn-info" type="reset">
								<i class="icon-white icon-repeat"></i>
								重置
							</button>
						</span>
					</div>
				</div>
			</div>
			</form>
			<hr/>
			<div class="row-fluid">
				<div class="span12" style="padding-left:30px;">
					<button class="btn btn-info" onclick="addemp();">
						<i class="icon-white icon-plus"></i>
						新增
					</button>
					<script type="text/javascript">
						function addemp(){
							location.href="/HRMS/addEmpTmp.action";
						}
					</script>
				</div>
				<div class="span12">
					<div class="widget-box">
						<div class="widget-content nopadding">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>姓名</th>
										<th>性别</th>
										<th>职位</th>
										<th>部门</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
                                   <c:forEach var="el" items="${emplist}">
                                   <form id="${el.pkey}2" action="/HRMS/setempcondition.action" method="post">
				                     <input name="employeeid" type="hidden" value="${el.pkey}">
							     	 <input name="mark" type="hidden" value="${el.mark}">
							     	</form>
							     	<form id="${el.pkey}1" action="/HRMS/CurStaffInfo.action" method="post">
                                         <input type="hidden" name="uname" value="${el.uName}">
                                    </form>
                                    <form id="${el.pkey}3" action="/HRMS/updateemployee.action" method="post">
                					 <input type="hidden" name="pkey" value="${el.pkey}">  
               						 <input type="hidden" name="uname" value="${el.uName}">
               						</form>
               						<form id="${el.pkey}4" action="/HRMS/changeEmp.action" method="post">
                					 <input type="hidden" name="pkey" value="${el.pkey}">  
               						 <input type="hidden" name="uname" value="${el.uName}">
               						 <input type="hidden" name="posiname" value="${el.positionname}">
               						 <input type="hidden" name="depaname" value="${el.departmentname}">
               						</form>
                                    <tr>
                                        <td>${el.pkey}</td>
                                        <td>${el.uName}</td>
                                        <td>${el.sex}</td>
                                        <td>${el.positionname}</td>
                                        <td>${el.departmentname}</td>
                                        <td>
                                        <c:choose>
                                        	<c:when test="${el.mark==1}"> 在职 </c:when>
                                        	<c:when test="${el.mark==2}"> 离职 </c:when>     
                                        </c:choose>
                                        </td>
                                        <td id="leaveInfoId" style="display:none;">${el.pkey}</td>
                                        <td>
                                        
                                        
                                       
                                            <button class="btn btn-info" type="button" onclick="tijiao(this)">
                                                <i class="icon-white icon-eye-open"></i>
                                                查看
                                            </button>
                                            <script type="text/javascript">
                                             function tijiao(obj){
                                            	 var formId = $(obj).parent().prev().text();
                                             	
                                           	  $("#" + formId+"1").submit();
                                             }
                                            
                                            </script>
                                          
                                            <button class="btn btn-warning" onclick="gotomodify(this)">
                                                <i class="icon-white icon-refresh"></i>
                                                修改
                                            </button>
                                            <script type="text/javascript">									 
                                            	  function gotomodify(obj){
                                                	  var formId = $(obj).parent().prev().text();
                                                  	
                                                	  $("#" + formId+"3").submit();
                                                  }                   
                                            </script>
                                            
                                             <c:choose>
                                             <c:when test="${el.mark==2}"> 
                                            <button class="btn btn-info" onclick="change(this)">
                                                <i class="icon-white icon-plus"></i>
                                                入职
                                            </button>
                                            </c:when>
                                            <c:when test="${el.mark==1}">
                                             <button class="btn btn-danger" onclick="change(this)">
                                                <i class="icon-white icon-minus"></i>
                                                离职
                                            </button>
                                            </c:when>
                                            </c:choose>
                                            <script type="text/javascript">
                                              function change(obj){
                                            	  var formId = $(obj).parent().prev().text();
                                            	
                                            	  $("#" + formId+"2").submit();
                                            	 
                                            	  
                                              }

                                            </script> 
                                            <button class="btn btn-success" onclick="gotoChange(this)">
                                                <i class="icon-white icon-share"></i>
                                                调转
                                            </button> 
                                            <script type="text/javascript">
                                              function gotoChange(obj){
                                            	  var formId = $(obj).parent().prev().text();
                                            	
                                            	  $("#" + formId+"4").submit();
                                            	 
                                            	  
                                              }

                                            </script> 
                                            
                                        </td>
                                    </tr>
                                    </c:forEach>                                   
								</tbody>
							</table>							
						</div>
					</div>
				</div>
			</div>
			<div class="fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix">
				<div class="dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers">
				<c:choose>
					<c:when test="${pagenum == null}">
						<a class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-disabled" >首页</a>
						<a class="previous fg-button ui-button ui-state-default ui-state-disabled">上一页</a>
					</c:when>
					<c:when test="${pagenum == 1}">
						<a class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-disabled" >首页</a>
						<a class="previous fg-button ui-button ui-state-default ui-state-disabled">上一页</a>
					</c:when>
					<c:otherwise>
						<a page="1" class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-ok" >首页</a>
						<a page="${pagenum-1}" class="previous fg-button ui-button ui-state-default ui-state-ok">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pagenum == null}">
						<a class="fg-button ui-button ui-state-default ui-state-disabled ">1</a>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="1" end="${maxpage}" step="1">
							<c:choose>
								<c:when test="${i == pagenum}">
									<a page="${pagenum}"   class="fg-button ui-button ui-state-default ui-state-disabled ">${pagenum}</a>
								</c:when>
								<c:otherwise>
									<a page="${i}"   class="fg-button ui-button ui-state-default ui-state-ok">${i}</a>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
	            <c:choose>
	            	<c:when test="${pagenum == maxpage}">
	            		<a class="previous fg-button ui-button ui-state-default ui-state-disabled">下一页</a>
						<a class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default ui-state-disabled">尾页</a>
	            	</c:when>
	            	<c:otherwise>
	            		<a page="${pagenum+1}" class="previous fg-button ui-button ui-state-default ui-state-ok">下一页</a>
						<a page="${maxpage}" class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default ui-state-ok">尾页</a>
	            	</c:otherwise>
	            </c:choose>
           
			
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