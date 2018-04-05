<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/7
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>注册</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <script type="text/javascript">
        function codeChange() {
            var imgs = document.getElementById("validateimage");
            imgs.src="${pageContext.request.contextPath}/codeGenerate?date="+new Date().getTime();
        }
        function re() {
            var password = document.getElementById("password").value;
            var repassword = document.getElementById("repassword").value;
            if (repassword == null || repassword == "") {
                alert("确认密码不能为空");
                return false;
            }
            if (repassword != password) {
                alert("两次密码输入不一致");
                return false;
            }
        }
        function checkByUsername() {
            //获取用户名
            var username = document.getElementById("username").value;
            /*1.创建xmlHttpRequest对象 XMLHttpRequest 用于在后台与服务器交换数据。*/
            var xmlHttp = createXmlHttpRequest();
            /*2.连接服务器*/
            xmlHttp.open("POST", "${pageContext.request.contextPath}/jsp/user_findByUsername", true);
            //设置请求头
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            /*3.发送请求(指定的请求体)*/
            xmlHttp.send("username=" + username + "&date=" + new Date().getTime());
            /*4.响应*///给异步对象的onreadystatechange事件注册监听器
            xmlHttp.onreadystatechange = function () { //当xmlHttp的状态变化为4且响应码为200时
                if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                    var flag = xmlHttp.responseText;
                    var msg = document.getElementById("u");
                    if(flag == "true"){
                        msg.innerHTML="可以注册";
                        msg.style.color="green";
                        /*alert("用户名可以使用！");*/
                    }else {
                        msg.innerHTML="用户名已经被占用";
                        msg.style.color="red";
                    }
                }
            }

        }
        function  createXmlHttpRequest() {
            try {
                return new XMLHttpRequest();
            } catch (e) {
                try {
                    return new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        return new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {
                        alert("浏览器有问题呀。。。。")
                        throw e;
                    }
                }
            }
        };
    </script>
</head>

<body>
<div style="background:url(img/timg.jpg)">
<%--把 A.jsp 的内容 原封不动  引入到 B.jsp 中--%>
<%@ include file="header.jsp" %>

<div class="containerr register" >
    <div class="title" style="width: 100%; height: 10%; background-color: rgba(81, 195, 240, 1);">
        <span style="padding-top: 6%; padding-left: 42%; font-size: 30px; display: block;">会员注册</span>
    </div>
    <div class="span24">
        <div class="wrap">
            <div class="main clearfix">
                <form id="registerForm" action="${pageContext.request.contextPath}/jsp/user_regist.action"  method="post" novalidate="novalidate" onsubmit="return ">
                    <table>
                        <tbody>
                        <tr>
                            <th>
                                <span class="requiredField">*</span>用户名:
                            </th>
                            <td>
                                <input type="text" id="username" name="username" class="text" placeholder="用户名长度在3-12为之间" title="用户名长度在3-12为之间" value="${username}" onblur="checkByUsername() ">
                                <span id="u"><font color="#ccc">用户名必须是数字、字母和下划线</font></span>
                                <span style="color:red;"><s:fielderror fieldName="username"/></span>

                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="requiredField">*</span>密&nbsp;&nbsp;码:
                            </th>
                            <td>
                                <input type="text" id="password" name="password" class="text" placeholder="密码长度必须在6-12位之间" value="${password}" title="密码长度必须在6-12位之间" autocomplete="off"/>
                              <span style="color:red"><s:fielderror fieldName="password"/></span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="requiredField">*</span>确认密码:
                            </th>
                            <td>
                                <input type="text" id="repassword" name="repassword" class="text" autocomplete="off"  />
                               <span id="r" style="color:red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="requiredField">*</span>E-mail:
                            </th>
                            <td>
                                <input type="text" id="email" name="email" class="text" value="${email}" />
                                 <span id="e" style="color:red;"><s:fielderror fieldName="email"/></span>
                            </td>
                        </tr>
                        <tr>

                            <th>
                                姓名:
                            </th>
                            <td>
                                <input type="text" name="name" class="text" value="${name}" />
                            </td>
                        </tr>

                        <tr>
                            <th>
                                <span class="requiredField">*</span>电话:
                            </th>
                            <td>
                                <input type="text" id="phone" name="phone" class="text" value="${phone}" />
                                <span style="color:red;"><s:fielderror fieldName="phone"/></span>
                            </td>
                        </tr>

                        <tr>
                            <th>
                                地址:
                            </th>
                            <td>
                                <input type="text" name="addr" value="${addr}" class="text" />
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
                                <span id="c" style="color:red;font-weight:bold;"><s:fielderror fieldName="logincodefail"/></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" class="submit btn-info" value="注册" onclick="re()"/>
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



<script src="${pageContext.request.contextPath}/jsp/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/jsp/js/main.js"></script>
</html>


