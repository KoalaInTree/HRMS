<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>人事管理网站</title>
		<meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="/HRMS/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/HRMS/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="/HRMS/css/unicorn.login.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    <body>
        <div id="logo" style="text-align:center;color:#fff;">
            <h3>人事管理系统网站<h3>
        </div>
        <div id="loginbox">            
            <form id="loginform" method="post" class="form-vertical" action="/HRMS/login.action" />
				<p>请在输入用户名和密码进行登录</p>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on" title="用户名"><i class="icon-user"></i></span>
                            <input type="text" placeholder="请输入用户名" name="uname"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on" title="密码"><i class="icon-lock"></i></span>
                            <input type="password" placeholder="请输入密码" name="password"/>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link" id="to-recover">忘记密码?</a></span>
                    <span class="pull-right"><input type="submit" class="btn btn-inverse" value="登录" /></span>
                </div>
            </form>
            <form id="recoverform" action="#" class="form-vertical" />
				<p align="left">请填写您的公司邮箱地址,我们会将新的随机密码发送给您的邮箱。</p>
				<div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on" title="邮箱地址"><i class="icon-envelope"></i></span>
                            <input type="text" placeholder="请输入邮箱地址" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link" id="to-login">&lt; 返回登录</a></span>
                    <span class="pull-right"><input type="submit" class="btn btn-inverse" value="重置密码" /></span>
                </div>
            </form>
        </div>
        
        <script src="js/jquery.min.js"></script>  
        <script src="js/unicorn.login.js"></script> 
    </body>
</html>