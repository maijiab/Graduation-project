<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/11
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8" />
    <title>订单管理</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="${pageContext.request.contextPath}/admin/assets/css/custom.css" rel="stylesheet" />
    <script type="text/javascript">
        function gotopage(page){
                window.location.href="${pageContext.request.contextPath}/adminOrder_findPageBean?page="+page+"";
            }
        function ckAll(){
            var flag=document.getElementById("allChecks").checked;
            var cks=document.getElementsByName("check");
            for(var i=0;i<cks.length;i++){
                cks[i].checked=flag;
            }
        }
        //        如果选中其中一个，全选效果取消
        function selectOne(){
            var cks=document.getElementsByName("check");
            var flag=document.getElementById("allChecks");
            for(var i=0;i<cks.length;i++){
                if(cks[i].checked == false){
                    flag.checked=false;
                    break;
                }
                flag.checked=true;
            }
        }
        function delAllProduct(){
            if(!confirm("确定要删除这些吗？")){
                return ;
            }
            var cks=document.getElementsByName("check");
            var str="";

            for(var i=0;i<cks.length;i++){
                if(cks[i].checked){
                    str+=","+cks[i].value;
                }
            }
            window.location.href = "${pageContext.request.contextPath}/adminOrder_delete.action?str="+str;
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
            <form id="Form1" name="Form1" action="order.jsp" method="post" enctype = "multipart/form-data">
                <table class="table" >
                    <tr class="list-group-item-info">
                        <td colspan="8">
                        </td>
                        <td> <input type="button" class="delete-button btn btn-default" value="全部删除" type="submit" name="str"  onclick="delAllProduct()"/></td>
                    </tr>
                    <tr>
                        <td >
                            <input type="checkbox" id="allChecks" onclick="ckAll()" /> 全选/全不选
                        </td >
                        <td >
                            序号
                        </td>
                        <td>
                            商品名称
                        </td>
                        <td>
                            总计
                        </td>
                        <td >
                            状态
                        </td>
                        <td>
                            收货人
                        </td>
                        <td >
                           联系电话
                        </td>
                        <td>
                            收货地址
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <s:iterator var="o" value="list" status="status">
                        <tr>
                            <td>
                                <input type="checkbox" name="check" value="${oid}" onclick="selectOne()"/>
                            </td>
                            <td>
                                <s:property value="#status.count"/>
                            </td>
                            <td>
                                <s:property value="oid"/>
                            </td>
                            <td>
                                <s:if test="#o.state==1">未付款</s:if>
                                <s:if test="#o.state==2"><a href="${pageContext.request.contextPath}/adminOrder_editState?oid=<s:property value="#o.oid"/>">发货</a></s:if>
                                <s:if test="#o.state==3">已发货</s:if>
                                <s:if test="#o.state==4">已完成交易</s:if>
                            </td>
                            <td>
                                <s:property value="state"/>
                            </td>
                            <td>
                                <s:property value="name"/>
                            </td>
                            <td>
                                <s:property value="phone"/>
                            </td>
                            <td>
                                <s:property value="phone"/>
                            </td>
                            <td>
                                <%--<a href="${pageContext.request.contextPath}/adminOrder_delete.action?oid=<s:property value="oid"/>"  onclick="return confirm('确定要删除吗？')">--%>
                                    <%--删除--%>
                                <%--</a>--%>
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







