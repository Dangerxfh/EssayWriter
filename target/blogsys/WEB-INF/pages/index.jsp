<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Fog
  Date: 2017/6/2
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
</head>
<link rel="stylesheet " type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet " type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/reveal.css">
<link rel="stylesheet" type="text/css" href="css/metro-icons.css">
<link rel="stylesheet" type="text/css" href="css/metro.css">


<script src="http://www.jq22.com/jquery/jquery-1.6.2.js"></script>
<script type="text/javascript" src="js/jquery.reveal.js"></script>

<style type="text/css">

    body { font-family: "HelveticaNeue","Helvetica-Neue", "Helvetica", "Arial", sans-serif; }

    .big-link { margin-top: 100px; text-align: center; font-size: 18px; color: #a94454; }

</style>


<body>
<c:import url="top.jsp"/>
<div class="container">
    <h2>文章列表</h2>
    <hr>
    <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
            <div class="col-xs-8">
                <c:forEach items="${essays}" var="essay">
                    <div class="media">
                        <!--文章标题  -->
                        <h4 class="media-heading h3"> <a class="text-a" href="essay/detail/${essay.id }"> ${essay.e_title}</a></h4>
                        <!-- 图片 -->
                        <a class="pull-left  fixedimg" href="project/detail/${essay.id }">
                            <img class="media-object" src="${fn:substring(essay.e_content,fn:indexOf(essay.e_content,'staticresources/upload/'),fn:indexOf(essay.e_content,'alt='))}" />
                        </a>
                        <div class="media-body">

                            <br>
                            <p class="text-muted small">
                                <!-- 发布时间 -->
                                <span class="date">${essay.e_date}发布</span>
                            </p>
                            <p class="text-right text-muted lead1">
                                <i class="fa fa-commenting-o fa-fw"></i>
                                <a class="text-muted" href="project/detail/${essay.id }">详情</a>
                            </p>

                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="col-xs-4">
                <div class="media">
                    <h2>文章热搜榜</h2>
                </div>
            </div>
        </div>
    </div>
</div>
    <a href="essay/write">写文章</a>
    <a href="#" class="big-link" data-reveal-id="myModal" data-animation="fade">
        jquery1
    </a>
    <div id="myModal" class="reveal-modal">
        <h1>登录</h1>
            <form action="user/login" method="post">
                <div class="input-control text">
                    <span class="mif-user prepend-icon"></span>
                    <input  name="username" placeholder="用户名"/>
                </div>
                <div class="input-control text">
                    <span class="mif-lock prepend-icon"></span>
                    <input type="password" name="userpass" placeholder="密码"/>
                </div>
                <div class="form-group">
                    <button class="btn btn-sm btn-success" type="submit">登录</button>
                </div>
            </form>
        <a class="close-reveal-modal">&#215;</a>
    </div>
</body>
</html>