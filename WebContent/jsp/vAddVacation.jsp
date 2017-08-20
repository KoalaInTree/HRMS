<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        		$("form input").blur(function (){
        			validateInput(this);
        		});
        		
        		$("#vtype").change(function (){
                    var v = $(this).val();
                    if(v == 3 || v == 4){
                    	$.ajax({
        					type:"POST",
        					url:"/HRMS/getLeftDays.action",
        					data:{"leaveType": v},
        					dataType:"json",
        					success: function (leftDays){
                                $("#dno").val(leftDays);
                                $("#sno").attr("max", leftDays);
        					}
        				});
                    }else{
                        $("#dno").val("无限制");
                    }
                });
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
	<body onload="getStaffName()">
		<script type="text/javascript">
			function getStaffName(){
	    		$.ajax({
	    			type: "POST",
	    			url: "/HRMS/getStaffName.action",
	    			success: function(staffNamePO){
	    				$("#dname").val(staffNamePO.dname);
	    			}
	    		})
	    	}
		</script>
		
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
                        <li class="active"><a href="/HRMS/jsp/vAddVacation.jsp">申请休假</a></li>
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
				<h1>申请休假</h1>
			</div>
			<div id="breadcrumb">
				<a href="/HRMS/jsp/main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>
                                                    首页
                </a>
				<a href="#" class="current">申请休假</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
						<div class="span12">
							<div class="widget-box">
								<div class="widget-title">
									<span class="icon">
										<i class="icon-align-justify"></i>									
									</span>
									<h5>申请信息</h5>
								</div>
								<div class="widget-content nopadding">
									<form id="eform" class="form-horizontal" />
	                                    <div id="info1" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	员工姓名:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="text" name="dname" id="dname" value=""  readonly/>
	                                        </div>
	                                    </div>
	                                    <div id="info2" class="control-group">
	                                        <label class="control-label">
                                                <span style="color: red">*</span>
                                                假期类型:
                                            </label>
                                            <div class="controls">
                                                <select id="vtype" name="vtype">
                                                    <option value="1">事假</option>
                                                    <option value="2">病假</option>
                                                    <option value="3">年假</option>
                                                    <option value="4">调休假</option>
                                                    <option value="5">婚假</option>
                                                    <option value="6">丧假</option>
                                                    <option value="7">产假</option>
                                                    <option value="8">护理假</option>
                                                    <option value="9">产检假</option>
                                                    <option value="10">路途假</option>
                                                </select>
                                            </div>
	                                    </div>
	                                    <div id="info3" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	剩余天数:
	                                        </label>
	                                        <div class="controls">
	                                            <input type="text" name="dno" id="dno" value="无限制" readonly/>
	                                        </div>
	                                    </div>
	                                    <div id="info4" class="control-group">
	                                        <label class="control-label">
	                                        	<span style="color: red">*</span>
	                                        	休假天数:
	                                        </label>
	                                        <div class="controls">
	                                             <input type="number" name="sno" id="sno" min = "0" />
	                                        </div>
	                                    </div>
                                        <div id="info5" class="control-group">
                                            <label class="control-label">
                                                <span style="color: red">*</span>
                                                休假日期:
                                            </label>
                                            <div class="controls">
                                                 <input type="date" name="sd1" id="sd1"/> -
                                                 <input type="date" name="ed1" id="ed1"/> 
                                            </div>
                                        </div>
	                                    <div class="form-actions">
	                                        <input id="btn_ss" type="button" value="提交" class="btn btn-primary" />
	                                        <input type="reset" value="重置" class="btn btn-primary" />
	                                    </div>
	                                </form>
								</div>
							</div>			
						</div>
				</div>	
			</div>	
		
		<script type="text/javascript">
			$("#btn_ss").click(function(){
				var vtype = $("#vtype").val();	//休假类型
				var dno = $("#dno").val();		//该类型假期剩余天数
				var sno = $("#sno").val();		//休假天数
				var sd1 = $("#sd1").val();		//开始日期
				var ed1 = $("#ed1").val();		//结束日期
				
				validateInput("#sno");
				validateInput("#sd1");
				validateInput("#ed1");
				
				if(validateInput("#sno") && validateInput("#sd1") && validateInput("#ed1")){
					$.ajax({
						type:"POST",
						url:"/HRMS/submitLeaveInfo.action",
						data:{"vtype": vtype, "dno":dno, "sno":sno, "sd1":sd1, "ed1":ed1},
						dataType:"json",
						error:function (){
							$("#error_alert").show(function(){
								$("#error_alert").fadeOut(3000);
							})
						},
						success: function (data){
							if(data == 1){
								$("#success_alert").show(function(){
									$("#success_alert").fadeOut(3000);
								});
								$("#sno").val("");
								$("#sd1").val("");
								$("#ed1").val("");
							}
							
						}
					});		
				}
			})
		</script>
		
		
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