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
<body>
    <div class="container">
        <h1>用户登陆</h1>
        <form action="login" method="post">
            <div class="form-group">
                <input class="form-control" name="username" placeholder="用户名"/>
            </div>

            <div class="form-group password-field">
                <input class="form-control" type="password" name="userpass" placeholder="密码"/>
            </div>
            <div class="form-group">
                <button class="btn btn-success btn-sm" type="submit">登陆</button>
            </div>
        </form>
    </div>
</body>
</html>
