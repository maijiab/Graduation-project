<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/4
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <!-- Responsive css -->

    <!-- Modernizr JS -->
    <%--<script src="${pageContext.request.contextPath}/jsp/js/vendor/modernizr-2.8.3.min.js"></script>--%>
    <script type="text/javascript">
        function gotopage(page,cid){
            window.location.href="${pageContext.request.contextPath}/jsp/userProduct_findByCid?page="+page+"&cid="+cid+"";
        }


    </script>
</head>

<body>
<!-- header start -->
<form action="" method="post">
<input type="hidden" name="cid" value="<s:property value="cid"/>"/>
    <%--把 A.jsp 的内容 原封不动  引入到 B.jsp 中--%>
    <%@ include file="header.jsp" %>

    <div class="space-custom"></div>

<div class="breadcrumb-area">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li>
                <s:property value="cname"/>
                <%--<select name="category.cid">--%>
                <%--<s:iterator value="#clist" var="c">--%>
                    <%--<s:if test="category.cid== cid">--%>
                        <%--<option value="${c.csid}">${c.csname}</option>--%>
                    <%--</s:if>--%>
                <%--</s:iterator>--%>
            <%--</select>--%>
            </li>
        </ol>
    </div>
</div>
<!-- breadcrumb end -->
<!-- shop-area start -->
<div class="shop-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4">
                <div class="column">
                    <h2 class="title-block">导航栏</h2>
                    <s:iterator var="c" value="#session.clist">
                        <h3 class="sidebar-title">
                            <a href="${pageContext.request.contextPath}/jsp/userProduct_findByCid?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a>
                        </h3>
                        <ul class="sidebar-menu">
                            <s:iterator var="cs" value="#c.categorySeconds">
                                <dd>
                                    <a href="${pageContext.request.contextPath}/jsp/userProduct_findByCSid?csid=<s:property value="#cs.csid"/>&cid = <s:property value="#c.cname"/>&page=1"><s:property value="#cs.csname"/></a>
                                </dd>
                            </s:iterator>
                        </ul>
                    </s:iterator>
                </div>
            </div>

            <div class="col-md-9 col-sm-8">
                <h2 class="page-heading mt-40">
                    <span class="cat-name">
                    </span>
                    <span class="heading-counter">有 <s:property value="count"/> 件商品</span>
                </h2>
                <div class="shop-page-bar">
                   <div class="tab-content">
                      <div role="tabpanel" class="tab-pane active">
                          <div class="row">
                              <s:iterator value="list">
                                <div class="col-md-4 col-sm-6">
                                   <div class="product-wrapper  mb-40 mrg-nn-xs ">
                                      <div class="product-img">
                                          <a href="${pageContext.request.contextPath}/jsp/userProduct_findByPdid?pid=${pid}" target="_blank">
                                             <img src="${pageContext.request.contextPath}/<s:property value="image"/>" style="display:inline-block;"/>
                                          </a>
                                          <div class="product-content">
                                                 <div class="pro-title">
                                                     <h3><a href="${pageContext.request.contextPath}/jsp/userProduct_findByPdid?pid=${pid}"><s:property value="pname"/></a></h3>
                                                 </div>
                                             <div class="price-reviews">
                                                 <div class="price-box">
                                                     <span class="price product-price"><s:property value="price"/></span>
                                                 </div>
                                                 <div class="pro-rating">
                                                     <a href="#"><i class="fa fa-star-o"></i></a>
                                                     <a href="#"><i class="fa fa-star-o"></i></a>
                                                     <a href="#"><i class="fa fa-star-o"></i></a>
                                                     <a href="#"><i class="fa fa-star-o"></i></a>
                                                     <a href="#"><i class="fa fa-star-o"></i></a>
                                                 </div>
                                             </div>
                                          </div>
                                      </div>
                                   </div>
                                </div>
                             </s:iterator>
                          </div>
                          <div class="pagination">
                              <ul class="shop-pagi display-inline">
                          <span >第${page}页/共${pageCount}页</span>
                          <s:if test="page != 1">
                              <%--跳转到首页 --%>
                              <a onclick="javascript:gotopage(1,${cid})" class="firstPage">首页</a>
                              <%--上一页 --%>
                              <li> <a onclick="javascript:gotopage(${page}-1,${cid})" class="previousPage"><i class="fa fa-angle-left"></i></a></li>
                          </s:if>
                          <s:iterator var="num" begin="%{startIndex}" end="%{endIndex}">
                              <s:if test="#num == page">
                                  <li>  <span class="currentPage">${num}</span></li>
                              </s:if>
                              <s:else>
                                  <li>  <a onclick="javascript:gotopage(${num},${cid})">${num}</a></li>
                              </s:else>
                          </s:iterator>
                          <s:if test="page != pageCount">
                              <%--下一页 --%>
                              <li>   <a onclick="javascript:gotopage(${page}+1,${cid})" class="nextPage"><i class="fa fa-angle-right"></i></a></li>
                              <%--跳转到尾页 --%>
                              <a onclick="javascript:gotopage(${pageCount},${cid})"class="lastPage">尾页 </a>
                          </s:if>
                              </ul>
                      </div>
                      </div>
                   </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <%@ include file="bottom.jsp" %>

</form>
</body>



<script src="${pageContext.request.contextPath}/jsp/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/jsp/js/main.js"></script>
</html>
