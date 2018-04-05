<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/11/25
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>编辑</title>


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
                            编辑
                        </div>

                        <div class="panel-body">
                            <form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/adminProduct_edit.action" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="pid" value="<s:property value="pid"/>"/>
                                <div class="form-group">
                                    <label>名称：</label>
                                    <input type="text" name="pname" value="<s:property value="pname"/>"  class="bg"/>
                                </div>
                                <div class="form-group">
                                    <label>所属二级分类：</label>
                                </div>
                                <div class="form-group">
                                    <select name="categorysecond.csid">
                                        <s:iterator value="cslist" var="cs">
                                            <option value="${cs.csid}" <s:if test="cagegorysecond.csid==csid">selected</s:if>>${cs.csname}</option>
                                        </s:iterator>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>图片:</label>
                                    <br/>
                                   <img src="${pageContext.request.contextPath}/<s:property value="image"/>"  style="width: 200px; height: 150px;" />
                                    <div>
                                        <label>选择图片进行修改:</label>
                                        <input type="file" name="upload" value="${pageContext.request.contextPath}/<s:property value="image"/>"/>
                                    </div>
                                </div>
                                <%--<div class="form-group">--%>
                                    <%--<label>图片:</label>--%>
                                    <%--<input type="file" name="upload" value="${pageContext.request.contextPath}/<s:property value="image"/>"/>--%>
                                <%--</div>--%>
                                <div class="form-group">
                                    <label>价格:</label>
                                    <input type="text" name="price" value="${price}"  class="bg"/>
                                </div>
                                <div class="form-group">
                                    <label>热门:</label>
                                    <select name="isHot">
                                        <s:if test="isHot==1">
                                            <option value="1"selected="selected">是</option>
                                        </s:if>
                                        <s:else>
                                            <option value="1">是</option>
                                        </s:else>
                                        <s:if test="isHot==0">
                                            <option value="0"selected="selected">否</option>
                                        </s:if>
                                        <s:else>
                                            <option value="0">否</option>
                                        </s:else>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>描述:</label>
                                    <textarea name="pdesc" cols="40" rows="7">${pdesc}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>日期:</label>
                                    <input  type="text" value="${pdate}" name="pdate" />
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
