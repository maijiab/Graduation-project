<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/8
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>登陆</title>
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
    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.8.3.min.js"></script>
    <script type="text/javascript">
        function codeChange() {
            var imgs = document.getElementById("validateimage");
            imgs.src="${pageContext.request.contextPath}/codeGenerate?date="+new Date().getTime();
        }
    </script>
</head>

<body>
<div style="background:url(img/timg.jpg)">
<%--把 A.jsp 的内容 原封不动  引入到 B.jsp 中--%>
<%@ include file="header.jsp" %>

<div class="containerr register">
    <div class="title" style="width: 100%; height: 10%; background-color: rgba(81, 195, 240, 1);">
        <span style="padding-top: 6%; padding-left: 42%; font-size: 30px; display: block;">会员登陆</span>
    </div>
    <div class="span24">
        <div class="wrap">
            <div class="main clearfix">

                <span style="color:red;font-weight:bold;text-align:center;"><s:fielderror fieldName="msg"/></span></center>
                <form id="loginForm" action="${pageContext.request.contextPath}/jsp/user_login" onsubmit="return check();" method="post" novalidate="novalidate">

                    <table>
                        <tbody><tr>
                            <th>
                                用户名:
                            </th>
                            <td>
                                <input type="text" id="username"   name="username" class="text" maxlength="20"/>
                                <span id="u" style="color:red;font-weight:bold;"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                密&nbsp;&nbsp;码:
                            </th>
                            <td>
                                <input type="password" id="password" name="password"  class="text" maxlength="20" autocomplete="off"/>
                                <span id="p" style="color:red; font-weight:bold;"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                验证码:
                            </th>
                            <td>
								<span class="fieldSet">
									<input type="text" id="validatecode" name="validatecode" class="text captcha" maxlength="4" autocomplete="off"/>
									<img id="validateimage" class="captchaImage" src="${pageContext.request.contextPath}/codeGenerate" onclick="codeChange()" title="点击更换验证码"/>
								</span>
                                <span id="c" style="color:red;font-weight:bold;">
                                    <s:fielderror fieldName="logincodefail"/>
                                    <s:actionmessage/>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" class="submit btn-info" value="登 录"/>
                            </td>
                        </tr>
                        <tr class="register">
                            <td>
                                <dl>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/jsp/user_registUI">立即注册</a>
                                    </dd>
                                </dl>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>





</div>
</body>

<%--<script src="${pageContext.request.contextPath}/jsp/js/regist_volidate.js"></script>--%>

<script src="${pageContext.request.contextPath}/jsp/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/jsp/js/main.js"></script>
</html>
