<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Fog
  Date: 2017/6/3
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登陆</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/reveal.css">
<link rel="stylesheet" type="text/css" href="../css/metro-icons.css">
<link rel="stylesheet" type="text/css" href="../css/metro.css">

<script type="text/javascript" src="../js/jquery.reveal.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<style type="text/css">

    #logdiv{
        margin-top: 20px;
        width: 15rem;
    }
    #myModal{
        opacity: 0.8;
        background-color: aliceblue;
        visibility: visible;
        margin-left: -180px;
        width: 350px;
        top: 170px;
    }
    #btn_login{
        width: 85px;
    }
</style>
<body style="background-image:url(../img/login_back.jpg) ">
<c:import url="../top.jsp"/>
<div id="myModal"  class="reveal-modal" style="display: block;">
    <h4 class="text-light">登录</h4>
    <form id="loginForm" method="post">
        <div id="logdiv" class="input-control text" >
            <span class="mif-user prepend-icon"></span>
            <input  name="username" placeholder="用户名" required="required"/>
        </div>
        <div id="logdiv" class="input-control text" >
            <span class="mif-lock prepend-icon"></span>
            <input  type="password" name="userpass" class="pass1" placeholder="密码" required="required"/>
        </div>
        <div id="logdiv" class="input-control text" >
            <span class="mif-lock prepend-icon"></span>
            <input  type="password" name="userpass" class="pass2" placeholder="再次输入密码" required="required"/>
        </div>
        <h4 class="text-light" id="passno" style="color: red; display: none;" >两次输入密码不一致</h4>
        <h4 class="text-light" id="login_msg" style="color: red;display: none;">用户名或密码错误</h4>
        <div id="logdiv" class="input-control text">
            <button class="btn btn-sm btn-primary" type="button" id="btn_login" onclick="doUpload()" >登录</button>
            <a class="text-light" style="font-size: 13px; margin-left: 22px;" href="user/toregister">没有账号？马上注册</a>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(function () {
        $("input").click(function () {
            $("#login_msg").hide();
            $("#passno").hide();
        });

        if($(".pass1").val()!=$(".pass2").val()){
            $("#passno").show();
        }
    })
    function doUpload() {
        $.ajax({
            url:"user/login",
            type: 'POST',
            data:  new FormData($('#loginForm')[0]),
            async: true,
            cache: false,
            contentType: false,
            processData: false,
            success: function (returndata) {
                if(returndata.login_msg=='error'){
                    document.getElementById("login_msg").style.display="block";
                }
                if(returndata.login_msg=='success'){
                    window.location.href="beforeindex";
                }

            },
            error: function (returndata) {
                document.getElementById("myModal").onclick();
            }
        });
    }
</script>
</body>
</html>
