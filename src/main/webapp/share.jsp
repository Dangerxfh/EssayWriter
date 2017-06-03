<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="style/fonts/iconfont.css">
	<link rel="stylesheet" type="text/css" href="style/css/ishare.css">

  </head>
  
  <body>

<div class="iShare iShare-32 " style="position: absolute;top: 40%;" data-sites="">
	<a href="#" class="iShare_qzone"><i class="iconfont qzone">&#xe610;</i></a>
	<a href="#" class="iShare_tencent"><i class="iconfont tencent" style="vertical-align: -2px;">&#xe608;</i></a>
	<a href="#" class="iShare_weibo"><i class="iconfont weibo">&#xe609;</i></a>
	<a href="#" class="iShare_douban"><i class="iconfont douban" style=" vertical-align: -2px;">&#xe612;</i></a>
	<a href="#" class="iShare_renren"><i class="iconfont renren">&#xe603;</i></a>
	<a href="#" class="iShare_youdaonote"><i class="iconfont youdaonote" style="vertical-align: -2px;">&#xe604;</i></a>
	<a href="#" class="iShare_facebook"><i class="iconfont facebook" style="vertical-align: 1px;">&#xe601;</i></a>
	<a href="#" class="iShare_twitter"><i class="iconfont twitter" style="vertical-align: 1px;">&#xe60a;</i></a>
	<a href="#" class="iShare_googleplus"><i class="iconfont googleplus" style="vertical-align: -1px;">&#xe60b;</i></a>
	<a href="#" class="iShare_linkedin"><i class="iconfont linkedin" style="vertical-align: 2px;">&#xe607;</i></a>
	<a href="#" class="iShare_pinterest"><i class="iconfont pinterest" style="vertical-align: 0px;">&#xe60c;</i></a>
	<a href="#" class="iShare_wechat"><i class="iconfont wechat" style="vertical-align: -2px;">&#xe613;</i></a>
	<a href="#" class="iShare_tumblr"><i class="iconfont tumblr" style="vertical-align: 2px;">&#xe600;</i></a>
</div>
<script href="javascript:;" type="text/javascript">
	var iShare_config = {
		container:'.iShare',
		config:{
			title: '${essay.e_title}',
			description: '${essay.e_title}',
			url: 'http://127.0.0.1:8080/testt/essay/detail/${essay.id}',
			// isAbroad: false,
				//isTitle: true,
			// initialized: false,
			WXoptions:{
				evenType: 'click',
				isTitleVisibility: true,
				isTipVisibility: true,
				tip: '扫描二维码分享',
				title: 'QR CODE'
			}
		}
	}
</script>
<script href="javascript:;" type="text/javascript" src="js/iShare_tidy.js"></script>
</body>
</html>
