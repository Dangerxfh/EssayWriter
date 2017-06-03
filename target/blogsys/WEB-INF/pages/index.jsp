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
<body>


<div class="container">
    <h1>博客</h1>
    <hr>
    <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
            <div class="col-xs-8">
                <c:forEach items="${essays}" var="essay">
                    <div class="media">
                        <h4 class="media-heading h3"> <a class="text-a" href="essay/detail/${essay.id }"> ${essay.e_title}</a></h4>
                        <!--活动标题  -->
                        <!-- 图片 -->
                        <a class="pull-left  fixedimg" href="project/detail/${essay.id }">
                            <img class="media-object" src="img/${essay.id }.jpg">
                        </a>

                        <div class="media-body">
                            <!-- 活动描述 -->
                            <div class="descript">
                                    ${fn:substring(essay.e_content,fn:indexOf(essay.e_content,"<p>"),80) }。。。。。。
                            </div>
                            <br>
                            <p class="text-muted small">
                                <!-- 活动最后更新时间 -->
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
        </div>
    </div>
    </div>
    <a href="essay/write">写文章</a>
</body>
</html>
