<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/4
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>购物车</title>
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



    <!-- Modernizr JS -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<!-- header start -->
<%--把 A.jsp 的内容 原封不动  引入到 B.jsp 中--%>
<%@ include file="header.jsp" %>
<div class="space-custom"></div>
<div class="breadcrumb-area">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="#">主页</a></li>
            <li class="active">购物车</li>
        </ol>
    </div>
</div>
<!-- breadcrumb end -->
<!-- cart-main-area start -->
<div class="cart-main-area">
    <div class="container">
        <s:if test="#session.cart.cartItems.size()>0">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <form action="#">
                        <div class="table-content table-responsive">
                            <table>
                                <thead>
                                <tr>
                                    <th class="product-thumbnail">图片</th>
                                    <th class="product-name">名称</th>
                                    <th class="product-price">价格</th>
                                    <th class="product-quantity">数量</th>
                                    <th class="product-subtotal">总计</th>
                                    <th class="product-remove">删除</th>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator var="c" value="#session.cart.cartItems">
                                    <tr>
                                        <td width="60">
                                            <input type="hidden" name="id" value="22"/>
                                            <img src="${pageContext.request.contextPath}/${c.product.image}" width="150"/>
                                        </td>
                                        <td>
                                            <a target="_blank">${c.product.pname}</a>
                                        </td>
                                        <td>
                                            ￥${c.product.price}
                                        </td>
                                        <td class="quantity" width="60">
                                                ${c.count}
                                        </td>
                                        <td width="140">
                                            <span class="subtotal">￥${c.subTotal}</span>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/cart_removeCart?pid=${c.product.pid}" class="delete">删除</a>
                                        </td>
                                    </tr>
                                </s:iterator>

                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-8 col-sm-7 col-xs-12">
                                <div class="buttons-cart">
                                    <a href="${pageContext.request.contextPath}/jsp/cart_clearCart" id="clear" class="clear">清空购物车</a>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-5 col-xs-12">
                                <div class="cart_totals">
                                    <table>
                                        <tbody>
                                        <tr class="order-total">
                                            <th>总计</th>
                                            <td>
                                                <strong><span class="amount">￥${cart.total}元</span></strong>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="wc-proceed-to-checkout">
                                        <a href="${pageContext.request.contextPath}/jsp/userOrder_addOrder" id="submit" class="submit">提交订单</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </s:if>
        <s:else>
            <div style="text-align: center;">
                <span style="font-size: 20px;">
	                  购物车中没有您中意的商品，
	                  <a href="${pageContext.request.contextPath}/jsp/index">点击跳转</a>
	   </span>
            </div>
        </s:else>
    </div>
</div>

<%@ include file="bottom.jsp" %>
</body>
<script src="${pageContext.request.contextPath}/jsp/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/jsp/js/main.js"></script>
</html>
