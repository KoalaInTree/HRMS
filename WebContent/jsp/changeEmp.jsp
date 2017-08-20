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
				<h1>查看个人信息</h1>
			</div>
			<div id="breadcrumb">
				<a href="/HRMS/jsp/main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>首页
                </a>
				<a href="/HRMS/StaffInfo.action" method="post">员工列表</a>
				<a href="#" class="current">员工调转</a>
			</div>
        	<div class="container-fluid">
				<div class="row-fluid">
						<div class="span12">
							<div class="widget-box">
								<div class="widget-title">
									<span class="icon">
										<i class="icon-align-justify"></i>									
									</span>
									<h5>部门调转</h5>
								</div>
								<div class="widget-content nopadding">
									<form id="pform1" action="#" method="post" class="form-horizontal" />
	                                    <div id="info1" class="control-group">
	                                        <label class="control-label">
	                                        	员工姓名:
	                                        </label>
	                                        <div class="controls" style="padding-top:15px">
	                                            ${uname}
	                                        </div>
	                                    </div>
	                                    <input type="hidden" id="empid" value="${pkey}">
	                                    <div id="info2" class="control-group">
	                                       <label class="control-label">
	                                        	当前部门:
	                                       </label>
	                                       <div class="controls" style="padding-top:15px">
	                                            ${depaname}
	                                       </div>
	                                    </div>
	                                    <div id="info3" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	新部门:
	                                        </label>
	                                        <div class="controls">
	                                            <select id="new_depart">
                                                	<option value="-1">=请选择=</option>
                                                	<c:forEach var="el" items="${deplist}">
                                                	<option value="${el.departmentid}">${el.departmentname}</option>
                                                	</c:forEach>
                                                    
                                                </select>
	                                        </div>
	                                    </div>
	                                    <div class="form-actions">
	                                        <input id="coco_submit" type="button" value="调转" class="btn btn-primary" />
	                                    </div>
                                       <div id="error_alert" class="alert alert-error" hidden>
                                                                                                            保存失败
                                       </div>

                                       <div id="success_alert" class="alert alert-success" hidden>
                                                                                                            保存成功
                                       </div>
	                                </form>
	                                
	                                
	                                <script type="text/javascript">
		$("#coco_submit").click(function(){
			var new_depart = $("#new_depart").val();
			
			var pkey = $("#empid").val();
				$.ajax({
					type:"POST",
					url:"/HRMS/changeempdepa.action",
					data:{"staffId":pkey,"departmentId":new_depart
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
											
				
					}
			});

		})
</script>
								</div>
							</div>	
                         </div> 		
					</div>
                    <div class="row-fluid">
						<div class="span12">
							<div class="widget-box">
								<div class="widget-title">
									<span class="icon">
										<i class="icon-align-justify"></i>									
									</span>
									<h5>职位调转</h5>
								</div>
								<div class="widget-content nopadding">
									<form id="pform2" action="#" method="post" class="form-horizontal" />
	                                    <div id="info1" class="control-group">
	                                        <label class="control-label">
	                                        	员工姓名:
	                                        </label>
	                                        <div class="controls" style="padding-top:15px">
	                                            ${uname}
	                                        </div>
	                                    </div>
	                                     <input type="hidden" id="empid2" value="${pkey}">
	                                    <div id="info2" class="control-group">
	                                       <label class="control-label">
	                                        	当前职位:
	                                        </label>
	                                        <div class="controls" style="padding-top:15px">
	                                            ${posiname}
	                                        </div>
	                                    </div>
	                                    <div id="info3" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	新职位:
	                                        </label>
	                                        <div class="controls">
	                                            <select id="new_position">
                                                	<option value="-1">=请选择=</option>
                                                    <c:forEach var="el" items="${poslist}">
                                                	<option value="${el.positionid}">${el.positionname}</option>
                                                	</c:forEach>
                                                </select>
	                                        </div>
	                                    </div>
	                                    <div class="form-actions">
	                                        <input id="co_submit" type="button" value="调转" class="btn btn-primary" />
	                                    </div>
                                        <div id="error_alert2" class="alert alert-error" hidden>
                                                                                                            保存失败
                                       </div>

                                       <div id="success_alert2" class="alert alert-success" hidden>
                                                                                                            保存成功
                                       </div>
	                                </form>
	                                
	                                
	                            <script type="text/javascript">
		$("#co_submit").click(function(){
			var new_position = $("#new_position").val();
			
			var pkey = $("#empid2").val();
				$.ajax({
					type:"POST",
					url:"/HRMS/changeempposi.action",
					data:{"staffId":pkey,"positionId":new_position
						},
					dataType:"json",
					error:function (){
						$("#error_alert2").show(function(){
							$("#error_alert2").fadeOut(3000);
						})
					},
					
					success: function (status){
						//alert(status);
						$("#success_alert2").show(function(){
							$("#success_alert2").fadeOut(3000);
						});
											
				
					}
			});

		})
</script>
								</div>
							</div>	
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
