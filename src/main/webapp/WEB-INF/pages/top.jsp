<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'top.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/nav.css">

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/reveal.css">
    <link rel="stylesheet" type="text/css" href="css/metro-icons.css">
    <link rel="stylesheet" type="text/css" href="css/metro.css">

    <script type="text/javascript" src="js/jquery.reveal.js"></script>
    <script src="http://www.jq22.com/jquery/jquery-1.6.2.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            //如果用户不为空
            if(${user!=null}){
                //将用户名显示在页面
                $("#login").text('${sessionScope.user.username}');

                //将“个人中心”显示在页面
                $("#personal").show();

                //将“注销”文字显示在页面
                $("#logout").show();
            }
        });
    </script>
</head>

<body>
<div class="navbar navbar-default navbar-fixed-top">

    <div class="navbar-header">
        　        	<a href="##" class="navbar-brand">博客平台 </a>
    </div>
    <ul class="nav navbar-nav">
        <li><a href="##">首页</a></li>
        <li><a href="essay/write">写文章</a></li>
        <li><a href="user/detail/projects" id="personal" style="display: none;">个人中心</a></li>
    </ul>

    <div class="navbar-right text-danger">
        欢迎，<span id="user_Name"></span><a href="#" class="big-link" data-reveal-id="myModal" data-animation="fade" id="login">请登录</a>&nbsp;&nbsp;<span><a href="user/logout" class="text-danger" id="logout" style="display: none;">注销</a></span>
    </div>
</div>

<div id="topLogin">
    <div id="myModal" class="reveal-modal">
        <h4 class="text-light">登录</h4>
        <form id="loginForm" method="post">
            <div class="input-control text">
                <span class="mif-user prepend-icon"></span>
                <input  name="username" placeholder="用户名"/>
            </div>

            <div class="input-control text">
                <span class="mif-lock prepend-icon"></span>
                <input  type="password" name="userpass" placeholder="密码"/>
            </div>

            <h4 class="text-light" id="login_msg" style="color: red;display: none;">用户名或密码错误</h4>

            <div class="input-control text">
                <button class="btn btn-sm btn-primary" type="button" id="btn_login" onclick="doUpload()" >登录</button>
                <a class="text-light" style="font-size: 13px; margin-left: 4px;" href="user/toregister">没有账号？马上注册</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
