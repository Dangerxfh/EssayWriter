<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My JSP 'index.jsp' starting page</title>

    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>editormd/css/editormd.css"/>
    <script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script src="<%=basePath%>editormd/editormd.min.js"></script>
    <script src="<%=basePath%>editormd/lib/marked.min.js"></script>
    <script src="<%=basePath%>editormd/lib/prettify.min.js"></script>
    <script src="<%=basePath%>editormd/lib/raphael.min.js"></script>
    <script src="<%=basePath%>editormd/lib/underscore.min.js"></script>
    <script src="<%=basePath%>editormd/lib/sequence-diagram.min.js"></script>
    <script src="<%=basePath%>editormd/lib/flowchart.min.js"></script>
    <script src="<%=basePath%>editormd/lib/jquery.flowchart.min.js"></script>
    <script src="<%=basePath%>editormd/editormd.min.js"></script>
    <script type="text/javascript">
        var testEditor;
        $(function() {
            testEditor=editormd("test-editormd", {
                width   : "90%",
                height  : 640,
                syncScrolling : "single",
                path : "<%=request.getContextPath()%>/editormd/lib/",
                //这个配置在simple.html中并没有，但是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
                saveHTMLToTextarea : true,
                emoji: true,
                imageUpload : true,
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "essay/uploadfile",
            });
        });

    </script>
</head>

<body >
<div class="container">
    <h1>简书--写文章</h1>
    <hr>
    <form action="essay/addE" method="post">
        <h2 style="display: inline;">标题</h2>
        <div class="form-group">
            <input name="e_title" class="form-control"/>
        </div>

        <div class="form-group">
            <input type="datetime-local" name="e_date" class="form-control"/>
        </div>
        <div class="editormd" id="test-editormd">
            <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc"></textarea>
            <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
            <textarea class="editormd-html-textarea" name="e_content"></textarea>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-success btn-large">提交</button>
        </div>

    </form>
</div>

</body>
</html>
