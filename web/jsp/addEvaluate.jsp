<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/20
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>添加订单</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">



    <!-- All css files are included here. -->
    <!-- Bootstrap framework main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/bootstrap.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/style.css">
    <!-- Responsive css -->


    <script type="text/javascript">
        function check1(){
            document.getElementById("alert_content").innerHTML = "谢好评！";
        }
        function check2(){
            document.getElementById("alert_content").innerHTML = "谢中评，希望给好评！";
        }
        function check3(){
            document.getElementById("alert_content").innerHTML = "别给差评";
        }
        function checknull(){
            var con = document.getElementById("con").value;
            if(con == "" || con == null){
                alert("写些内容吧");
                return false;
            }

        }
    </script>

    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<!-- header start -->
<%--把 A.jsp 的内容 原封不动  引入到 B.jsp 中--%>
<%@ include file="header.jsp" %>

<div class="breadcrumb-area">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="#">主页</a></li>
            <li class="active">评论</li>
        </ol>
    </div>
</div>
<!-- breadcrumb end -->
<!-- cart-main-area start -->
<div class="blog-area">
    <div class="container">
        <div class="row">
            <form action="${pageContext.request.contextPath}/jsp/userEvaluate_addEvaluate" method="post" onsubmit="return checknull();">
                <input type="hidden" name="itemid" value='<s:property value="itemid"/>'/><%--传递订单项 --%>
                <input type="hidden" name="product.pid" value='<s:property value="product.pid"/>'/><%--传递评价对应的商品，以便于保存 --%>
                <input type="hidden" name="pid" value='<s:property value="product.pid"/>'/><%--传递商品的id，用于查找订单项 --%>
                <div class="col-md-12 col-sm-12">
                     <div class="blog-wrapper blog-main mb-40">
                           <div class="col-md-3 col-sm-3">
                               <a href="#"><img width="260px" height="240px"  src="${pageContext.request.contextPath}/<s:property value="product.image"/>"></a>
                            </div>
                           <div class="col-md-9 col-sm-9">
                                  <h3><a href="#"><s:property value="product.pname"/>.</a></h3>
                                 <div class="blog-meta blog-large">
                                     <div class="icon-1">
                                     <a href="#"><i class="fa fa-thumbs-down" aria-hidden="true"> </i><input id="radio1" type="radio" name="title" onclick="check1()" value="差评" title="差评" ></a>
                                     </div>
                                     <div class="icon-2">
                                     <a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i><input id="radio2" type="radio" name="title" onclick="check2()" value="中评" title="中评"></a>
                                     </div>
                                     <div class="icon-3">
                                     <a href="#"><i class="fa  fa-thumbs-up" aria-hidden="true"></i><input id="radio3" type="radio" name="title" onclick="check3()" value="好评" title="好评"></a>
                                     </div>
                                     </div>
                                     <p><textarea id="con" rows="8" cols="88" name="content"></textarea></p>
                                  <div class="read-more">
                                      <a href="#"><input type="submit" class="button gray" value="立即评价"/></a>
                                  </div>
                            </div>
                     </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="bottom.jsp" %>





</body>
<script src="${pageContext.request.contextPath}/jsp/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/jsp/js/main.js"></script>
</html>
