<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<script type="text/javascript" language="javascript">
			
			$(document).ready(function(){
				$('input[type=checkbox],input[type=radio],input[type=file]').uniform();
				$('.datepicker').datepicker();
				
				$(".fg-button.ui-state-ok").click(function (){
					var p = $(this).attr("page");
					$("input[name='pagenum']").val(p);
					$("#f1").submit();
				});
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
                        <li id = "WaitList" class="active"><a href="/HRMS/searchLeaveInfo.action">审批休假</a></li>
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
				<h1>审批休假</h1>
			</div>
			<div id="breadcrumb">
				<a href="/HRMS/jsp/main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>
                                                    首页
                </a>
				<a href="#" class="current">审批休假</a>
			</div>
			<form id="f1" action="/HRMS/searchLeaveInfo.action" method="post" name="searchForm">
			<input type="hidden" name="pagenum" id="pagenum"/>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="control-group">
						<span class="span3">
							申请人：<input id="ename" name="ename" type="text" style="width:65%" value="${leaveInfoSearchVO.ename}"/>
						</span>
						<span class="span6">
							休假时间：
                            <input id="sdate" name="sdate" type="date" style="width:35%" value="${leaveInfoSearchVO.sdate}"/>
                            -
                            <input id="edate" name="edate" type="date" style="width:35%" value="${leaveInfoSearchVO.edate}"/>
						</span>
                        <span class="span3">
							<button id="btn_submit" class="btn btn-info" onclick="submitForm(1);" type="submit">
								<i class="icon-white icon-search"></i>
								查询
							</button>
							<button type="reset" class="btn btn-info">
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
				<div class="span12">
					<div class="widget-box">
						<div class="widget-content nopadding">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>申请人</th>
										<th>休假类型</th>
										<th>休假天数</th>
										<th>休假时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								
									<c:forEach var="leaveInfo" items="${leaveInfoList}">
										<form id="${leaveInfo.leaveInfoId}"  method="post">
											<input name="leaveInfoId" type="hidden" value="${leaveInfo.leaveInfoId}">
											<input name="staffId" type="hidden" value="${leaveInfo.staffId}">
											<input name="uname" type="hidden" value="${leaveInfo.uname}">
											<input name="leaveType" type="hidden" value="${leaveInfo.leaveType}">
											<input name="leaveDays" type="hidden" value="${leaveInfo.leaveDays}">
											<input name="appDate" type="hidden" value="${leaveInfo.appDate}">
											<input name="startDate" type="hidden" value="${leaveInfo.startDate}">
											<input name="endDate" type="hidden" value="${leaveInfo.endDate}">
										</form>
										<tr>
											<td id="staffId" style="display:none;">${leaveInfo.staffId}</td>
	                                        <td id="uname">${leaveInfo.uname}</td>
	                                        <td id="leaveType">${leaveInfo.leaveType}</td>
	                                        <td id="leaveDays">${leaveInfo.leaveDays}</td>
	                                        <td id="appDate" style="display:none;">${leaveInfo.appDate}</td>
	                                        <td id="startDate" style="display:none;">${leaveInfo.startDate}</td>
	                                        <td id="endDate" style="display:none;">${leaveInfo.endDate}</td>
	                                        <td>
	                                        	<fmt:formatDate value="${leaveInfo.startDate}" pattern="yyyy年MM月dd日"/> - <fmt:formatDate value="${leaveInfo.endDate}" pattern="yyyy年MM月dd日"/>
	                                        </td>
	                                        <td id="leaveInfoId" style="display:none;">${leaveInfo.leaveInfoId}</td>
	                                        <td>
	                                            <button id="details" class="btn btn-info" onclick="allmessage(this)">
	                                                <i class="icon-white icon-eye-open"></i>
	                                                详细
	                                            </button>
	                                            <button class="btn btn-success" onclick="pass(this)">
	                                                <i class="icon-white icon-refresh"></i>
	                                                通过
	                                            </button>
	                                             <button class="btn btn-danger" onclick="turndown(this)">
	                                                <i class="icon-white icon-minus"></i>
	                                                驳回
	                                            </button>
	                                            
	                                           <script type="text/javascript">
	                                           		function allmessage(obj){
	                                           			var formId = $(obj).parent().prev().text();
	                                           			$("#" + formId).attr("action", "/HRMS/getDetails.action");
	                                           			$("#" + formId).submit();
	                                           		}
	                                       			function pass(obj){
	                                       				var formId = $(obj).parent().prev().text();
	                                           			
	                                           			$.ajax({
	                                						type:"POST",
	                                						url:"/HRMS/passApp.action",
	                                						data: $("#" + formId).serialize(),
	                                						dataType:"json",
	                                						error:function (){
	                                							$("#error_alert").show(function(){
	                                								$("#error_alert").fadeOut(3000);
	                                							})
	                                						},
	                                						success: function (data){
	                                							if(data == 1){
	                                								var p = $(".fg-button.now-page").attr("page");
	                                								$("input[name='pagenum']").val(p);
	                                								$("#f1").submit();
	                                							}
	                                							
	                                						}
	                                					});	
	                                       			}
	                                       			function turndown(obj){
														var formId = $(obj).parent().prev().text();
	                                           			
	                                           			$.ajax({
	                                						type:"POST",
	                                						url:"/HRMS/turndownApp.action",
	                                						data: $("#" + formId).serialize(),
	                                						dataType:"json",
	                                						error:function (){
	                                							$("#error_alert").show(function(){
	                                								$("#error_alert").fadeOut(3000);
	                                							})
	                                						},
	                                						success: function (data){
	                                							if(data == 1){
	                                								var p = $(".fg-button.now-page").attr("page");
	                                								$("input[name='pagenum']").val(p);
	                                								$("#f1").submit();
	                                							}
	                                							
	                                						}
	                                					});	
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
			
			<div id="error_alert" class="alert alert-error" hidden>
                保存失败
            </div>

            <div id="success_alert" class="alert alert-success" hidden>
                保存成功
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
									<a page="${pagenum}"   class="fg-button ui-button ui-state-default ui-state-disabled now-page">${pagenum}</a>
								</c:when>
								<c:otherwise>
									<a page="${i}"   class="fg-button ui-button ui-state-default ui-state-ok">${i}</a>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
	            <c:choose>
	            	<c:when test="${maxpage == 0}">
	            		<a class="previous fg-button ui-button ui-state-default ui-state-disabled">下一页</a>
						<a class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default ui-state-disabled">尾页</a>
	            	</c:when>
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