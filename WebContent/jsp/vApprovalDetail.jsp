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
		<style>
			tr{
				height:40px;
			}
		</style>	
		<script src="/HRMS/js/jquery.min.js"></script>
        <script src="/HRMS/js/jquery.ui.custom.js"></script>
        <script src="/HRMS/js/bootstrap.min.js"></script>
        <script src="/HRMS/js/jquery.uniform.js"></script>
        <script src="/HRMS/js/bootstrap-datepicker.js"></script>
        <script src="/HRMS/js/jquery.validate.js"></script>
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
				<h1>休假详细信息</h1>
			</div>
			<div id="breadcrumb">
				<a href="/HRMS/jsp/main.jsp" class="tip-bottom">
                	<i class="icon-home"></i>首页
                </a>
				<a href="/HRMS/jsp/vWaitingAppList.jsp">审批休假</a>
				<a href="#" class="current">休假详细信息</a>
			</div>
        	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>休假信息</h5>
							</div>
                            <table width="100%">
                            	<tr>
                                	<td width="15%" align="right">申请人:</td>
                                    <td width="60%" align="left">
                                    	&nbsp;&nbsp;
                                    	${leaveInfoDetails.uname}(员工编号${leaveInfoDetails.staffId})
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                	<td align="right">休假类型:</td>
                                    <td align="left">
                                    	&nbsp;&nbsp;
                                    	${leaveInfoDetails.leaveType}
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                	<td align="right">休假天数:</td>
                                    <td align="left">
                                    	&nbsp;&nbsp;
                                    	${leaveInfoDetails.leaveDays}
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td align="right">休假时间:</td>
                                    <td align="left">
                                        &nbsp;&nbsp;
                                        <fmt:formatDate value="${leaveInfoDetails.startDate}" pattern="yyyy年MM月dd日"/> - <fmt:formatDate value="${leaveInfoDetails.endDate}" pattern="yyyy年MM月dd日"/>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td align="right">申请时间:</td>
                                    <td align="left">
                                        &nbsp;&nbsp;
                                        <fmt:formatDate value="${leaveInfoDetails.appDate}" pattern="yyyy年MM月dd日 HH时mm分ss秒"/>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td align="right">审批意见:</td>
                                    <td align="left">
                                        &nbsp;&nbsp;
                                        <form id="f_app" method="post">
	                                        <input name="leaveInfoId" type="hidden" value="${leaveInfoDetails.leaveInfoId}" >
	                                       	<textarea name="approveSuggestion" id="txa1" style="width:200px;height:100px;resize:none;"></textarea>
                                        </form>
                                    </td>
                                    <td></td>
                                </tr>
                                 <tr>
                                    <td></td>
                                    <td>
                                        <button class="btn btn-success" id="btn_1">
                                            <i class="icon-white icon-refresh"></i>
                                            通过
                                        </button>
                                        <button class="btn btn-danger" id="btn_2">
                                            <i class="icon-white icon-minus"></i>
                                            驳回
                                        </button>
										
										<script type="text/javascript">
											$("#btn_1").click(function(){
												$("#f_app").attr("action", "/HRMS/passAppInDetailPage.action");
												$("#f_app").submit();
											})
											
											$("#btn_2").click(function(){
												$("#f_app").attr("action", "/HRMS/turndownAppInDetailPage.action");
												$("#f_app").submit();
											})
										</script>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
						</div>			
					</div>
				</div>	
			</div>
            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget-box">
                            <div class="widget-title">
                                <span class="icon">
                                    <i class="icon-align-justify"></i>                                  
                                </span>
                                <h5>审批信息</h5>
                            </div>
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>审批级别</th>
                                        <th>审批人</th>
                                        <th>审批意见</th>
                                        <th>审批时间</th>
                                        <th>审批结果</th>
                                    </tr>
                                </thead>
                                <tbody>
	                                <c:forEach var="approvalDetail" items="${approvalDetails}">
	                                	<tr>
	                                        <td>${approvalDetail.approveLevel}</td>
	                                        <td>${approvalDetail.approverName}</td>
	                                        <td>${approvalDetail.approveSuggestion}</td>
	                                        <td><fmt:formatDate value="${approvalDetail.approveDate}" pattern="yyyy年MM月dd日 HH时mm分ss秒"/></td>
	                                        <td>
	                                        	<c:choose>
	                                        		<c:when test="${approvalDetail.approveRes == 1}">
	                                        			未审批
	                                        		</c:when>
	                                        		<c:when test="${approvalDetail.approveRes == 2}">
	                                        			通过
	                                        		</c:when>
	                                        		<c:when test="${approvalDetail.approveRes == 3}">
	                                        			驳回
	                                        		</c:when>
	                                        	</c:choose>
	                                        </td>
	                                    </tr>
	                                </c:forEach>
                                </tbody>
                            </table>    
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