<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/11/25
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>新增</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/font-awesome.css" rel="stylesheet" />
    <!--WIZARD STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/wizard/normalize.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/admin/assets/css/wizard/wizardMain.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/admin/assets/css/wizard/jquery.steps.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/custom.css" rel="stylesheet" />


</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/index.jsp">微米优品</a>
        </div>
        <div class="header-right">
            <a href="${pageContext.request.contextPath}/admin/login.jsp" class="btn btn-danger" title="Logout"><i class="fa fa-exclamation-circle fa-2x"></i></a>
        </div>
    </nav>
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <div class="user-img-div">
                        <div class="inner-text">
                            <small>管理员</small>
                            <s:property value="#session.existAdmin.username"/>
                            <br />
                        </div>
                    </div>
                </li>
                <li>
                    <a class="active-menu" href="${pageContext.request.contextPath}/admin/index.jsp"><i class="fa fa-dashboard "></i>首页</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-yelp "></i>用户管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/user/adminUser_findAllUser.action"><i class="fa fa-desktop "></i>用户管理</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bicycle "></i>分类管理 <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/category/adminCategory_findAll.action"><i class="fa fa-desktop "></i>一级分类管理 </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/category/adminCategorySecond_findPage?page=1"><i class="fa fa-desktop "></i>二级分类管理</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bicycle "></i>商品管理 <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/prodouct/adminProduct_findPage?page=1"><i class="fa fa-desktop "></i>商品列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bicycle "></i>订单管理 <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/prodouct/adminOrder_findPageBean?page=1"><i class="fa fa-desktop "></i>订单列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bicycle "></i>留言管理 <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/prodouct/adminEvaluate_findPageBean?page=1"><i class="fa fa-desktop "></i>留言列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/login.jsp"><i class="fa fa-sign-in "></i>登陆</a>
                </li>
            </ul>
        </div>
    </nav>
    <div id="page-wrapper">
        <div id="page-inner">
            <!-- /. ROW  -->
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            新增
                        </div>
                        <div class="panel-body">
                            <form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/adminCategory_add.action" method="post">
                                <div class="form-group">
                                    <label>一级分类名称：</label>
                                    <input type="text" name="cname" value="" id="userAction_save_do_logonName" class="bg"/>
                                </div>
                                <input type="submit" name="sub"  class="btn btn-danger" value="提交"/>
                               <input type="button" onclick="history.go(-1)" class="btn btn-danger" value="退出" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
</div>
    <!-- /. FOOTER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.metisMenu.js"></script>
    <!-- WIZARD SCRIPTS -->
    <script src="${pageContext.request.contextPath}/admin/assets/js/wizard/modernizr-2.6.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/wizard/jquery.cookie-1.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/wizard/jquery.steps.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>
</body>
</html>







