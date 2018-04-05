<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/11/20
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>首页</title>
    <link href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/admin/assets/css/font-awesome.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/admin/assets/css/basic.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/admin/assets/css/custom.css" rel="stylesheet" />
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
                            <%--页面和已编码的信息中间用 ? 字符分隔--%>
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
            <div class="col-md-6">
                <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-black">
                                <i class="fa fa-bicycle"></i>
                            </span>
                    <div class="text-box">
                        <p class="main-text">微米优品</p>
                        <hr />
                        <p>
                           <span class=" color-bottom-txt"><i class="fa fa-edit"></i>
                                    2010年4月6日，北京微米科技有限公司正式成立，并入驻银谷大厦。
                                    2011年8月1日，微米电子商城正式对外上线。
                                    2012年6月7日，微米电子商城通过官网实现7 x 24小时开放购买，并完善售后服务渠道。
                                    2013年1月4日，微米电子商城为老用户准备了60万张50元配件现金券,总额3000万元。
                                    2017年12月19日至26日，举办“2017感恩季”活动，其中最受欢迎的就是100元的“无套路”优惠券，可
                                    以在微米电子商城购买任意产品，一共发放了202.4万张。此次活动线上达成订单246.9万笔，其中81.3%的订单享受到了感恩季的优惠。
                           </span>
                        </p>
                        <hr />
                        2017年4月25日，为了更好的向全社会输出京东物流的专业能力，帮助产
                        业链上下游的合作伙伴降低供应链成本、提升流通效率，共
                        同打造极致的客户体验，微米商城将正式组建物流子集团。物流子集团将拥有更加独立的经营权和决策权，并
                        致力于与商家和社会化物流企业协同发展。
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="${pageContext.request.contextPath}/admin/assets/js/jquery-1.10.2.js"></script>

<script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.js"></script>

<script src="${pageContext.request.contextPath}/admin/assets/js/jquery.metisMenu.js"></script>

<script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>



</body>
</html>
