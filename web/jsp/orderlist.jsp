<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/10
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>订单列表</title>
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
        //传递当前页
        function gotopage(page){
            window.location.href="${pageContext.request.contextPath}/userOrder_findByUid?page="+page+"";
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
                <form action="#">
                    <div class="table-content table-responsive">
                        <table>
                          <s:iterator value="list" var="o">
                            <thead>
                              <tr>
                              <th colspan="6">
                              订单编号：${o.oid}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              订单状态:
                              <s:if test="#o.state == 1">
                                  <a href="${pageContext.request.contextPath}/userOrder_findByOid?oid=${o.oid}"><font color="red">付款</font></a>
                              </s:if>
                              <s:if test="#o.state == 2">已经付款</s:if>
                              <s:if test="#o.state == 3">
                                  <a href="${pageContext.request.contextPath}/userOrder_finshOrder?oid=${o.oid}&page=${page}"><font color="red"> 确认收货</font></a>
                              </s:if>
                              <s:if test="#o.state == 4">交易完成</s:if>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单时间：${o.ordertime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              订单总计:${o.total}
                              </th>
                              </tr>
                            <tr>
                                <th>图片</th>
                                <th>商品</th>
                                <th>价格</th>
                                <th>数量</th>
                                <th>小计</th>
                               <th>评价</th>
                            </tr>
                            </thead>
                            <tbody>
                               <s:iterator value="orderitems" var="orderItems">
                                  <tr>
                                     <td width="60">
                                         <a href="${pageContext.request.contextPath}/userProduct_findByPid?pid=<s:property value="product.pid"/>">
                                             <img src="${pageContext.request.contextPath}/<s:property value="product.image"/>" width="150px" height="120px"/>
                                         </a>
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
                                     <td width="60">
                                         <span class="subtotal">
								            <s:if test="osatate == 2">
                                                <a href="${pageContext.request.contextPath}/jsp/userEvaluate_evaluateUI?pid=<s:property value="product.pid"/>&itemid=<s:property value="itemid"/>">去评价</a>
                                            </s:if>
                                            <s:elseif test="osatate == 3">评价成功</s:elseif>
								            <s:else>暂无操作</s:else>
								         </span>
                                     </td>
                                   </tr>
                               </s:iterator>
                            </tbody>
                          </s:iterator>
                        </table>
                        <div class="pagination">
                            <span >第${page}页/共${pageCount}页</span>
                            <s:if test="page != 1">
                                <%--跳转到首页 --%>
                                <a href="javascript:gotopage(1)" class="firstPage">首页</a>
                                <%--上一页 --%>
                                <a href="javascript:gotopage(${page}-1)" class="previousPage"><i class="fa fa-angle-left"></i></a>
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
                                <a href="javascript:gotopage(${page}+1)" class="nextPage"><i class="fa fa-angle-right"></i></a>
                                <%--跳转到尾页 --%>
                                <a href="javascript:gotopage(${pageCount})"class="lastPage">尾页 </a>
                            </s:if>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>







</body>
</html>

</body>


<script src="${pageContext.request.contextPath}/jsp/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/jsp/js/main.js"></script>
</html>
