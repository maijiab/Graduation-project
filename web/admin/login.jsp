<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/11/20
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html >
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>后台管理系统</title>
    <link href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/admin/assets/css/font-awesome.css" rel="stylesheet" />
    <script type="text/javascript">
        //使用js对提交的数据做判断，如果为空则弹出相应的消息
        function validate() {
            var username = document.getElementById("username").value;
            if (username == null || username == ""){
                alert("用户名不能为空");
                return false;
            }

            var password = document.getElementById("password").value;
            if (password == null || password ==""){
                alert("密码不能为空");
                return false;
            }
        }
    </script>
</head>
<body style="background-color: #E2E2E2;">
<div class="container">
    <div class="row ">
        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
            <div class="panel-body">
                <form role="form" id="admin_login"  action="admin_login.action"  method="post" onsubmit="return validate()">
                    <hr />
                    <h5>后台管理登陆界面</h5>
                    <br />
                    <div class="form-group input-group">
                        <s:actionerror/>
                    </div>
                    <div class="form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-tag"  ></i></span>
                        <input type="text" id="username" name="username"  class="form-control" value="<s:property value="username"/>"  />
                    </div>
                    <div class="form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
                        <input type="password" id="password" name="password" class="form-control"   />
                    </div>
                    <input type="submit" value="登陆" class="btn btn-primary"/>
                    <hr />
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

