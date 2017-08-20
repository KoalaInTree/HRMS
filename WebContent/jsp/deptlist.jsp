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
<title>Insert title here</title>
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
				<h1>部门信息管理</h1>
			</div>
			<div id="breadcrumb">
				<a href="/HRMS/jsp/main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>
                                                    首页
                </a>
				<a href="#" class="current">部门信息管理</a>
			</div>
			<form id="f1" action="/HRMS/DepRequest.action" method="post" name="searchForm">
			<input type="hidden" name="pagenum" id="pagenum"/>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="control-group">
						<span class="span3">
							名称：<input id="ename" name="depname" type="text" style="width:65%" value="${svo.depname}"/>
						</span>
						<input name="mark" type="hidden">
						<input type="hidden" name="pagenum">
						<span class="span3">
							状态：<select id="eflag" name="eflag" style="width:70%" <%-- value="${svo.mark}" --%>>
									<option name="_mark" value="0">=请选择=</option>
									<option name="_mark" value="1">活动</option>
                                    <option name="_mark" value="2">撤销</option>
								</select>
						</span>
                        <span class="span3">
							<button type="submit" class="btn btn-info">
								<i class="icon-white icon-search"></i>
								查询
							</button>
							<script type="text/javascript">
								$("#eflag").click(function(){
									var p = $(this).val();
									$("input[name='mark']").val(p);
								})
							</script>
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
				<div class="span12" style="padding-left:30px;">
					<button class="btn btn-info" onclick="addDept();">
						<i class="icon-white icon-plus"></i>
						新增
					</button>
					<script type="text/javascript">
						function addDept(){
							location.href="/HRMS/jsp/addDept.jsp";
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
										<th>部门名称</th>
										<th>负责人姓名</th>
										<th>部门编制</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="d" items="${deplist}">
				 <form id="${d.departmentid}2" action="/HRMS/setdeptcondition.action" method="post">
				 <input name="departmentid" type="hidden" value="${d.departmentid}">
				 <input name="mark" type="hidden" value="${d.mark}">
				 </form>
				 <form id="${d.departmentid}1" action="/HRMS/DepInfo.action" method="post">
                    <input type="hidden" name="depname" value="${d.departmentname}">
                  </form>
                  <form id="${d.departmentid}3" action="/HRMS/updatedepartment.action" method="post">
                 <input type="hidden" name="leaderid" value="${d.leaderid}">  
                 <input type="hidden" name="maxpeople" value="${d.maxpeople}">
                 <input type="hidden" name="depname" value="${d.departmentname}">
                 <input type="hidden" name="depid" value="${d.departmentid}">
                 </form>
                                    <tr>
                                        <td>${d.departmentid}</td>
                                        <td>${d.departmentname}</td>
                                        <td>${d.leader}</td>
                                        <td>${d.maxpeople}</td>
                                        <td>
                                        <c:choose>
                                        	<c:when test="${d.mark==1}"> 活动 </c:when>
                                        	<c:when test="${d.mark==2}"> 撤销 </c:when>     
                                        </c:choose>                                  
                                        </td>
                                        <td id="leaveInfoId" style="display:none;">${d.departmentid}</td>
                                        <td>
                                            
                                            <button class="btn btn-info" type="button" onclick="sub(this)">
                                                <i class="icon-white icon-eye-open"></i>
                                                查看
                                            </button>
                                              <script type="text/javascript">
                                              function sub(obj){
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
                                            	<c:when test="${d.mark==1}"> 
                                          		  <button class="btn btn-danger" onclick="setcondition(this)">
                                              		  <i class="icon-white icon-minus"></i>
                                                撤销
                                           	      </button> 
                                            	</c:when>
                                             
                                                <c:when test="${d.mark==2}">                                
                                         		  <button class="btn btn-info" onclick="setcondition(this)">
                                                      <i class="icon-white icon-plus"></i>
                                                恢复
                                                  </button>
                                                </c:when>
                                            </c:choose>
                                            
                                           
                                             <script type="text/javascript">
                                              function setcondition(obj){
                                            	  var formId = $(obj).parent().prev().text();
                                            	
                                            	  $("#" + formId+"2").submit();
                                            	 
                                            	  
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