<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/10
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>订单</title>
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
        function payOrder(){
            document.getElementById("orderForm").submit();
        }
    </script>
</head>

<body>

<%--把 A.jsp 的内容 原封不动  引入到 B.jsp 中--%>
<%@ include file="header.jsp" %>

<div class="breadcrumb-area">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="#">主页</a></li>
            <li class="active">订单</li>
        </ol>
    </div>
</div>

<div class="cart-main-area">

    <div class="container">
        <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="table-content table-responsive">
                            <table>
                                <thead>
                                <tr>
                                    <th>图片</th>
                                    <th>商品</th>
                                    <th>价格</th>
                                    <th>数量</th>
                                    <th>小计</th>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="orderitems">
                                    <tr>
                                        <td width="60">
                                            <input type="hidden" name="id" value="22"/>
                                            <img src="${pageContext.request.contextPath}/<s:property value="product.image"/>" width="150px" height="120px"/>
                                        </td>
                                        <td>
                                            <a target="_blank"><s:property value="product.pname"/></a>
                                        </td>
                                        <td>
                                            <s:property value="product.Price"/>
                                        </td>
                                        <td class="quantity" width="60">
                                            <s:property value="count"/>
                                        </td>
                                        <td width="140">
                                            <span class="subtotal">￥<s:property value="subtotal"/></span>
                                        </td>
                                    </tr>
                                </s:iterator>
                                </tbody>
                            </table>
                        </div>
                        <div class="total" style="width: 80%;">
                            <em id="promotion"></em>
                            商品金额: <strong id="effectivePrice">￥${total}元</strong>
                        </div>
                        <form id="orderForm" action="${pageContext.request.contextPath}/userOrder_payOrder?page=1" method="post" >
                            <input type="hidden" name="oid" value="${model.oid}"/>
                            <table>
                                <tbody>
                                <tr>
                                    <th>
                                        收货地址：
                                    </th>
                                    <td>
                                        <input name="addr" type="text" value="${model.user.addr}" class="text" maxlength="200"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        收货人&nbsp;&nbsp;&nbsp;：
                                    </th>
                                    <td>
                                        <input name="name" type="text" value="${model.user.name}"  class="text" maxlength="200"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        联系方式：
                                    </th>
                                    <td>
                                        <input name="phone" type="text"value="${model.user.phone}" class="text" maxlength="200"/>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <p style="text-align:right">
                                <input id="payOrder" class="payOrder" value="付款" type="submit" <%--onclick="payOrder()"--%>/>
                                </a>
                            </p>
                        </form>
                </div>
            </div>
    </div>
</div>


</body>


<script src="${pageContext.request.contextPath}/jsp/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/jsp/js/main.js"></script>
</html>
