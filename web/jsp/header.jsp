<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/29
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/shortcode/header.css">

    <script src="${pageContext.request.contextPath}/jsp/js/vendor/jquery-1.12.0.min.js"></script>

</head>

<header class="header-pos">
    <div class="header-area header-middle">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 col-sm-3 col-xs-12">
                    <div class="logo">
                        <a href="#"><img src="img/logo/logo.png" alt="" style="width: 160px"/></a>
                    </div>
                </div>
                <div class="col-md-10 col-sm-9 col-xs-12 text-right xs-center">
                    <div class="main-menu display-inline hidden-sm hidden-xs">
                        <nav>
                            <ul>
                                <li>  <s:property value="#session.existUser.username"/></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/jsp/index">首页</a></li>
                                <s:iterator value="#session.clist" var="c">
                                    <li><a href="${pageContext.request.contextPath}/jsp/userProduct_findByCid?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a></li>
                                </s:iterator>
                            </ul>
                        </nav>
                    </div>
                    <%--<div class="search-block-top display-inline">--%>
                    <%--<div class="icon-search"></div>--%>
                    <%--<div class="toogle-content">--%>
                    <%--<form action="#" id="searchbox">--%>
                    <%--<input type="text" placeholder="Search" />--%>
                    <%--<button class="button-search"></button>--%>
                    <%--</form>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <div class="setting-menu display-inline">
                        <div class="icon-nav current"></div>
                        <ul class="content-nav toogle-content">
                            <li>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/jsp/cart_findCart">购物车</a></li>
                                    <li><a href="${pageContext.request.contextPath}/jsp/userOrder_findByUid?page=1">我的订单</a></li>
                                    <li><a href="${pageContext.request.contextPath}/jsp/user_loginUI">登陆</a></li>
                                    <li><a href="${pageContext.request.contextPath}/jsp/user_registUI">注册</a></li>
                                    <li><a href="${pageContext.request.contextPath}/jsp/user_loginOut">退出登陆</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

