<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<script type="text/javascript">
			$(document).ready(function (){
				$("#pass1").blur(function (){
					validatePass1();
				});
				$("#pass1").focus(function (){
					validatePass1();
				});
				$("#pass2").blur(function (){
					validatePass2();
				});
				$("#pass2").focus(function (){
					validatePass2();
				});
				$("#pass3").blur(function (){
					validatePass3();
				});
				$("#pass3").focus(function (){
					validatePass3();
				});
				$("#pform").submit(function (){
					var flag = true;
					flag = validatePass1() && flag;
					flag = validatePass2() && flag;
					flag = validatePass3() && flag;
					return flag;
				});
				
			});
			function validatePass1(){
				var v = $("#pass1").val();
				if(v == ""){
					$("#info1").removeClass("success");
					$("#info1").addClass("error");
					return false;
				}else{
					$("#info1").removeClass("error");
					$("#info1").addClass("success");
					return true;
				}
			}
			function validatePass2(){
				var v = $("#pass2").val();
				if(v == ""){
					$("#info2").removeClass("success");
					$("#info2").addClass("error");
					return false;
				}else{
					$("#info2").removeClass("error");
					$("#info2").addClass("success");
					return true;
				}
			}
			function validatePass3(){
				var v1 = $("#pass3").val();
				var v2 = $("#pass2").val();
				if(v1 != v2){
					$("#info3").removeClass("success");
					$("#info3").addClass("error");
					return false;
				}else{
					$("#info3").removeClass("error");
					$("#info3").addClass("success");
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
                <li class="active">
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
				<h1>修改登录密码</h1>
			</div>
			<div id="breadcrumb">
				<a href="/HRMS/jsp/main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>首页
                </a>
				<a href="#" class="current">修改登录密码</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
						<div class="span12">
							<div class="widget-box">
								<div class="widget-title">
									<span class="icon">
										<i class="icon-align-justify"></i>									
									</span>
									<h5>修改登录密码</h5>
								</div>
								<div class="widget-content nopadding">
									<form id="pform"  class="form-horizontal" />
	                                    <div id="info1" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	原密码:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="password" name="pass1" id="pass1" />
	                                        </div>
	                                    </div>
	                                    <div id="info2" class="control-group">
	                                       <label class="control-label">
	                                        	<span style="color: red" >*</span>
	                                        	新密码:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="password" name="password" id="pass2" />
	                                        </div>
	                                    </div>
	                                    <div id="info3" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	确认新密码:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="password" name="pass3" id="pass3" />
	                                        </div>
	                                    </div>
	                                    <div class="form-actions">
	                                        <input id="btn_submit" type="button" value="提交" class="btn btn-primary" />
	                                        <input type="reset" value="重置" class="btn btn-primary" />
	                                    </div>
	                                </form>
<script type="text/javascript">
		$("#btn_submit").click(function(){
			var pass1 = $("#pass1").val();	//原密码
			var pass2 = $("#pass2").val();	 //新密码
			var pass3 = $("#pass3").val();	 //确认密码
			
			
				$.ajax({
					type:"POST",
					url:"/HRMS/changePassword.action",
					data:{"pass1": pass1, "password":pass2, "pass3":pass3},
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
						$("#pass1").val("");
						$("#pass2").val("");
						$("#pass3").val("");
				
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