<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<title>企业人事管理平台</title>
		<meta charset="UTF-8" />
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
       	<script src="/HRMS/js/jquery-1.11.2.min.js" type="text/javascript"></script>

		<script type="text/javascript" language="javascript">
			$(document).ready(function(){
				$(".fg-button.ui-state-ok").click(function (){
					var p = $(this).attr("page");
					$("input[name='pagenum']").val(p);
					$("#f2").submit();
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
                        <li id = "WaitList"><a href="/HRMS/searchLeaveInfo.action">审批休假</a></li>
                        <li><a href="/HRMS/ulist.action">查看休假记录</a></li>
                        <li id = "AppList"><a href="/HRMS/apped.action">查看审批记录</a></li>
                        <li id = "TypeList" class="active"><a href="/HRMS/typelist.action">假期类型管理</a></li>
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
				<h1>假期类型管理</h1>
			</div>
			<div id="breadcrumb">
				<a href="/HRMS/jsp/main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>
                                                    首页
                </a>
				<a href="#" class="current">假期类型管理</a>
			</div>
			<form id="f2" action="/HRMS/typelist.action" method="post" name="searchForm">
			<input type="hidden" name="pagenum" id="pagenum"/>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="control-group">
						<span class="span3">
							名称：<input id="tname" name="tname" type="text" style="width:65%" value="${svo.tname}"/>
						</span>
						<span class="span3">
						<input type="hidden" name="eflag">
							状态：<select id="flag" name="flag" style="width:70%">
									<option value="-1">=请选择=</option>
									<option value="1">活动</option>
                                    <option value="2">撤销</option>
								</select>
						</span>
                        <span class="span3">
							<button class="btn btn-info" onclick="submitForm(1);" type="submit">
								<i class="icon-white icon-search"></i>
								查询
							</button>
							<button type="reset" class="btn btn-info" onclick="resetForm();">
								<i class="icon-white icon-repeat"></i>
								重置
							</button>
							
							<script type="text/javascript">
							  $("#flag").click(function(){
								  
								  var p=$(this).val();
								  $("input[name='eflag']").val(p);
								  
							  })
							
							</script>
						</span>
					</div>
				</div>
			</div>
			</form>
			<hr/>
			<div class="row-fluid">
				<div class="span12" style="padding-left:30px;">
					<button class="btn btn-info" onclick="addType();">
						<i class="icon-white icon-plus"></i>
						新增
					</button>
					<script type="text/javascript">
						function addType(){
							location.href="/HRMS/jsp/vAddType.jsp";
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
										<th>假期名称</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="u" items="${ulist}">
								
				 <form id="${u.typeId}1" action="/HRMS/modify.action" method="post">
				 <input name="pkey" type="hidden" value="${u.typeId}">
				 <input name="typename" type="hidden" value="${u.typeName}">
				 </form>
				  <form id="${u.typeId}2" action="/HRMS/setcondition.action" method="post">
				 <input name="pkey" type="hidden" value="${u.typeId}">
				 <input name="eflag" type="hidden" value="${u.eflag}">
				 </form>
                                    <tr>
                                        <td>${u.typeId}</td>
                                        <td>${u.typeName}</td>
                                        <td>
                                        <c:choose>
						  <c:when test="${u.eflag == 2}">
							撤销
						  </c:when>
						  <c:when test="${u.eflag == 1}">
							活动
						  </c:when>
						
					       </c:choose> 
                                        
                                        
                                        </td>
                                        <td id="leaveInfoId" style="display:none;">${u.typeId}</td>
                                        <td>
                                            <button class="btn btn-warning" onclick="gotomodify(this)">
                                                <i class="icon-white icon-refresh"></i>
                                                修改
                                            </button>
                                            
                                            <script type="text/javascript">
                                              function gotomodify(obj){
                                            	  var formId = $(obj).parent().prev().text();
                                            	  $("#" + formId+"1").submit();
                                            	  
                                              }

                                            </script>
                                           
                                                 <c:choose>
						  <c:when test="${u.eflag == 2}">
						  
							<button class="btn btn-info" type="submit" onclick="setcondition(this)">
                                                <i class="icon-white icon-plus"></i>
                                                恢复
                                            </button>
						  </c:when>
						  <c:when test="${u.eflag == 1}">
							<button class="btn btn-danger" onclick="setcondition(this)">
                                                <i class="icon-white icon-minus"></i>
                                                撤销
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
                                    <!-- <tr>
                                        <td>2</td>
                                        <td>事假</td>
                                        <td>活动</td>
                                        <td>
                                            <button class="btn btn-warning" onclick="gotomodify()">
                                                <i class="icon-white icon-refresh"></i>
                                                修改
                                            </button>
                                            <button class="btn btn-info">
                                                <i class="icon-white icon-plus"></i>
                                                恢复
                                            </button>
                                        </td>
                                    </tr> -->
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

