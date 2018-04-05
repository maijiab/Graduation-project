<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/4
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>商品展示</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- All css files are included here. -->
    <!-- Bootstrap framework main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/bootstrap.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/shortcode/shortcodes.css">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/style.css">


    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/jsp/js/vendor/modernizr-2.8.3.min.js"></script>
    <script type="text/javascript">
    function saveCart(){
    document.getElementById("cartForm").submit();
    }
    function addOne() {
            var showControl = document.getElementById("count");
            showControl.value = parseInt(showControl.value) + 1;
        }
    function removeOne() {
        var showControl = document.getElementById("count");
        if( showControl.value>1){
            showControl.value = parseInt(showControl.value) - 1;
        }else{
            showControl.value=1;
        }
    }
    //传递当前页和pid
        function gotopage(page){
            window.location.href="${pageContext.request.contextPath}/userProduct_findByPid?page="+page+"";
        }

    </script>

</head>

<body>

<!-- header start -->
<%--把 A.jsp 的内容 原封不动  引入到 B.jsp 中--%>
<%@ include file="header.jsp" %>
<!-- header end -->
<div class="space-custom"></div>

<%--<div class="breadcrumb-area">--%>
    <%--<div class="container">--%>
        <%--<ol class="breadcrumb">--%>
            <%--<li><a href="#"><i class="fa fa-home"></i></a></li>--%>
            <%--<li>--%>
                <%--<s:property value="category.cname" />--%>
            <%--</li>--%>
            <%--<li> <s:property value="categorySecond.csname"/></li>--%>
            <%--<li class="active"> <s:property value="pname"/></li>--%>
        <%--</ol>--%>
    <%--</div>--%>
<%--</div>--%>

<div class="shop-area">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-5">
                <div class="product-zoom">
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <div class="pro-large-img">
                                <img src="${pageContext.request.contextPath}/${image}" alt="" />
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            <div class="col-xs-12 col-sm-6 col-md-7">
                <div class="product-details">
                    <h2 class="pro-d-title"><s:property value="pname"/></h2>
                    <%--<div class="pro-ref">--%>
                        <%--<p>--%>
                            <%--<label>Reference: </label>--%>
                            <%--<span> Reference: demo_1 </span>--%>
                        <%--</p>--%>
                        <%--<p>--%>
                            <%--<label>Condition: </label>--%>
                            <%--<span>New product</span>--%>
                        <%--</p>--%>
                    <%--</div>--%>
                    <div class="price-box">

                        <span class="price product-price"><s:property value="price"/></span>

                          <span class="old-price product-price"><s:property value="price"/></span>
                    </div>
                    <div class="short-desc">
                        <p><s:property value="pdesc"/></p>
                    </div>
                    <div class="box-quantity">
                        <form  id="cartForm" action="${pageContext.request.contextPath}/jsp/cart_addCart" method="post">
                            <input type="hidden" name="pid" value="${pid}"/>
                            <label>数量</label>
                            <input type="text" id="count" name="count" value="1" />
                            <div>
                                <input type="button" value="∧" id="up" onclick="addOne()"/>

                                <input id="down" type="button" onclick="removeOne()" value="∨"/>
                            </div>
                            <div class="buy">
                                <input id="addCart" class="addCart" value="加入购物车" type="button" onclick="saveCart()"/>
                            </div>
                        </form>
                    </div>
                    <div class="usefull_link_block">
                        <ul>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>送朋友</a></li>
                            <li><a href="#"><i class="fa fa-print"></i>打印</a></li>
                            <li><a href="#"><i class="fa fa-heart-o"></i>增添到许愿单</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>


<div class="pro-info-area ptb-80">
    <div class="container">
        <div class="pro-info-box">
            <ul class="pro-info-tab" role="tablist">
                <li class="active"><a href="#" data-toggle="tab">评价</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="home3">
                    <div class="pro-desc">
                        <s:iterator value="evaluates" var="e">
                            <div>
                                <div class="comment">
                                    <div class="comment_left">
                                        <span class="comment_left_username"><s:property value="#e.user.username"/></span>
                                    </div>
                                    <div class="comment_right">
                                        <div class="comment_right_top">满意度：<s:property value="#e.title"/>&nbsp;&nbsp;&nbsp; 评价时间：<s:date name="#e.data" format="yyyy-MM-dd HH:mm:ss"/></div>
                                        <div class="comment_right_mid">评价内容：<s:property value="#e.content"/></div>
                                    </div>
                                </div>
                                <hr/>
                            </div>
                        </s:iterator>
                    </div>
            </div>
        </div>
    </div>
</div>


    <%@ include file="bottom.jsp" %>




</body>


<script src="${pageContext.request.contextPath}/jsp/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/jsp/js/main.js"></script>
</html>

