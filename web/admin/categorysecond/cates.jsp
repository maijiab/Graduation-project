<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/11/27
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8" />
    <title>二级分类管理</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/custom.css" rel="stylesheet" />
    <script type="text/javascript">
        window.onload = function () {
            var msg = document.getElementById("msg1").value;
            if (msg != null && msg !=""){
                alert(msg);
            }
        }
        //传递当前页和cid
        function gotopage(page){
            window.location.href="${pageContext.request.contextPath}/adminCategorySecond_findPage?page="+page+"";
        }
        function addCategory(){
            window.location.href = "${pageContext.request.contextPath}/adminCategorySecond_addUI.action";
        }
    </script>
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
            <input type="hidden" id="msg1" value="<s:property value="message"/>">
            <form id="Form1" name="Form1" action="cates.jsp" method="post">
                <table class="table" >
                    <tr class="list-group-item-info">
                        <td colspan="3">
                        </td>
                        <td><input type="button" class="add-button btn btn-danger" value="添加" type="submit" name="sub1"  onclick="addCategory()"/></td>
                    </tr>
                    <tr>
                        <td >
                            序号
                        </td>
                        <td>
                            名称
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <s:iterator value="list" var="c" status="st">
                        <tr>
                            <td>
                                <s:property value="#st.count"/>
                            </td>
                            <td>
                                <s:property value="csname"/>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/adminCategorySecond_editUI.action?csid=<s:property value="csid"/>" class="btn btn-primary">
                                    修改
                                </a>

                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/adminCategorySecond_delete.action?csid=<s:property value="#c.csid"/>"  onclick="return confirm('确定要删除吗？')">
                                    删除
                                </a>
                            </td>
                        </tr>
                    </s:iterator>
                </table>
                <div class="pagination">
                <span style="color:#666;">第${page}页/共${pageCount}页</span>
                <s:if test="page != 1">
                    <%--跳转到首页 --%>
                    <a href="javascript:gotopage(1)" class="firstPage">首页</a>
                    <%--上一页 --%>
                    <a href="javascript:gotopage(${page}-1)" class="previousPage">上一页</a>
                </s:if>
                <s:iterator var="num" begin="%{startIndex}" end="%{endIndex}">
                    <s:if test="#num == page">
                        <span class="currentPage">${num}</span>
                    </s:if>
                    <s:else>
                        <a href="javascript:gotopage(${num})">${num}</a>
                    </s:else>
                </s:iterator>
                <s:if test="page != pageCount">
                    <%--下一页 --%>
                    <a href="javascript:gotopage(${page}+1)" class="nextPage">下一页</a>
                    <%--跳转到尾页 --%>
                    <a href="javascript:gotopage(${pageCount})"class="lastPage">尾页 </a>
                </s:if>
            </div>

            </form>
        </div>
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->

<!-- /. FOOTER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="${pageContext.request.contextPath}/admin/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${pageContext.request.contextPath}/admin/assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>


</body>
</html>





