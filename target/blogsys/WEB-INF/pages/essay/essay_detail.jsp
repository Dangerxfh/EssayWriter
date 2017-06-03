<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head lang="zh-CN">
    <base href="<%=basePath%>">
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My JSP 'content.jsp' starting page</title>
    <link rel="stylesheet" href="<%=basePath%>editormd/css/editormd.css"/>
	
  </head>
  
  <body>
  <div class="">
 		<div >
 			<c:import url="../../../share.jsp"/>
 		</div>
  		<div class="markdown-body editormd-preview-container">
  			<h2>${essay.e_title}</h2>
            ${essay.e_content}
 		</div>
  </div>
  	
   	
  </body>
</html>
