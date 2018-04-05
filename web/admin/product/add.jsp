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
    <!-- PAGE LEVEL STYLES -->
    <link href="${pageContext.request.contextPath}/admin/assets/css/bootstrap-fileupload.min.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->


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
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           新增
                        </div>

                        <div class="panel-body">
                            <form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/adminProduct_add.action" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label>名称：</label>
                                    <input type="text" name="pname" value="" id="userAction_save_do_logonName" />
                                </div>
                                <div class="form-group">
                                    <label>所属二级分类：</label>
                                </div>
                                <div class="form-group">
                                    <select name="categorysecond.csid">
                                        <s:iterator var="cs" value="cslist">
                                            <option value="<s:property value="csid"/>">
                                                <s:property value="csname"/></option>
                                        </s:iterator>
                                    </select>
                                </div>
                                <%--<div class="form-group">--%>
                                    <%--<label>图片:</label>--%>
                                    <%--<input type="file" name="upload"/>--%>
                                <%--</div>--%>
                                <%--jQuery File Upload 是一个Jquery图片上传组件，支持多文件上传、取消、删除，上传前缩略图预览--%>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">预览</label>
                                    <br/>
                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                        <div class="fileupload-preview thumbnail" style="width: 200px; height: 150px;"></div>
                                        <div>
                                             <span class="btn btn-file btn-success">
                                             <span class="fileupload-new">选择图片</span>
                                             <span class="fileupload-exists">修改图片</span>
                                             <br/>
                                             <input type="file" name="upload"></span>
                                             <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">移除</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>价格:</label>
                                    <input type="text"  name="price" />
                                </div>
                                <div class="form-group">
                                    <label>热门:</label>
                                    <select name="isHot">
                                        <option value="1">是</option>
                                        <option value="0">否</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>描述:</label>
                                    <textarea name="pdesc" cols="40" rows="7"></textarea>
                                </div>


                                <div>
                                    <input type="submit" name="sub"  class="btn btn-danger" value="提交"/>
                                    <input type="button" onclick="history.go(-1)" class="btn btn-danger" value="退出" />
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /. WRAPPER  -->
</div>
    <!-- /. FOOTER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="${pageContext.request.contextPath}/admin/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.js"></script>
<!-- PAGE LEVEL SCRIPTS -->
<script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap-fileupload.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${pageContext.request.contextPath}/admin/assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>

</body>
</html>







