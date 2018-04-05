<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/8
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>信息</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
============================================ -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/bootstrap.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/style.css">
    <!-- Responsive css -->



    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>

<%--把 A.jsp 的内容 原封不动  引入到 B.jsp 中--%>
<%@ include file="header.jsp" %>
<div class="containerr register">
    <div class="span24">
        <div class="wrap">
            <div class="main clearfix">
                <s:actionmessage/>
                <s:actionerror/>
                <s:fielderror/>

                <a href="${ pageContext.request.contextPath }/jsp/index.action">首页</a>
                <a href="${ pageContext.request.contextPath }/user_registUI.action">注册</a>
                <span style="color:green;">${msg}</span>
            </div>
        </div>
    </div>
</div>


</body>


<script src="${pageContext.request.contextPath}/jsp/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/jsp/js/main.js"></script>
</html>

