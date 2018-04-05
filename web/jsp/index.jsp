<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: fyl1997
  Date: 2017/12/4
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>微米电子商城</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/core.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/shortcode/shortcodes.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/style.css">






    <%--<script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.8.3.min.js"></script>--%>
</head>

<body>
<%--把 A.jsp 的内容 原封不动  引入到 B.jsp 中--%>
<%@ include file="header.jsp" %>

<%--在ID为slider的DIV中，放置了三张需要切换的图片。如果你想给让单击图片时打开一个页面地址，就给图片加个<a>标签链接，--%>
<%--如果你想给图片加个标题说明，可以使用title属性，如果你想让标题有样式或者链接，可以将图片的title属性设置为像"#htmlcaption"，--%>
 <%--&lt;%&ndash;即#号后面紧跟指向的ID，如上所示代码，在ID为htmlcaption的DIV中，你可以编辑你想要的HTML代码，Nivoslider插件支持html的图片标题。&ndash;%&gt;--%>
<%--先载入jQuery库和插件。然后调用Nivoslider插件。--%>
<%--$(function() {--%>
<%--$('#slider').nivoSlider();--%>
<%--});--%>
<div class="slider-container">

    <div id="mainSlider" class="nivoSlider slider-image">
        <img src="http://www-file.huawei.com/-/media/CORPORATE/Local-site/ch-en/image/banner_bg.jpg" alt="" title="#htmlcaption1">
        <img src="http://www-file.huawei.com/-/media/CORPORATE/Images/home/big-banner/2017/big-banner-mwc-bg-v2.jpg" alt="" title="#htmlcaption2">
    </div>

    <div id="htmlcaption2" class="nivo-html-caption slider-caption-1">
        <div class="container">
            <div class="slide1-text">
                <div class="middle-text">
                    <div class="cap-dec cap-1 wow bounceInRight" data-wow-duration="0.9s" data-wow-delay="0s">
                        <h2>华为</h2>
                    </div>
                    <div class="cap-dec cap-2 wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
                        <h2>新品发布会</h2>
                    </div>
                    <div class="cap-text wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.3s">
                       20月26-3月1日，巴塞罗那
                    </div>
                    <div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
                        <a href="${pageContext.request.contextPath}/jsp/userProduct_findByCSid?csid=27&page=1">购买华为商品</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="htmlcaption1" class="nivo-html-caption slider-caption-2">
        <div class="container">
            <div class="slide1-text">
                <div class="middle-text">
                    <div class="cap-dec cap-1 wow bounceInRight" data-wow-duration="0.9s" data-wow-delay="0s">
                        <h2>微米商城</h2>
                    </div>
                    <div class="cap-text wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.3s">
                      共建全联新世界.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="banner-area pt-70">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <div class="single-banner">
                    <a href="${pageContext.request.contextPath}/jsp/userProduct_findByCSid?csid=23&page=1"><img src="//img13.360buyimg.com/cms/jfs/t15601/186/109507944/157022/c59a019b/5a27a744N23da6f8b.png" alt="" style="width: 570px;height: 275px" /></a>
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="single-banner">
                    <a href="${pageContext.request.contextPath}/jsp/userProduct_findByCSid?csid=24&page=1"><img src="//img10.360buyimg.com/imgzone/jfs/t11407/312/1342293234/378443/ba722a0f/5a003f41N5fe680f1.png" alt="" style="width: 570px;height: 275px"/></a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<div class="best-sell-area pt-50">
    <div class="container">
        <div class="row">
            <div class="section-title text-center mb-50">
                <h2>最热商品</h2>
            </div>
        </div>
        <div class="row">
            <div class="product-carousel">
                <s:iterator value="hlist">
                    <div class="col-md-12">
                        <div class="product-wrapper mb-40 mrg-nn-xs ">
                            <div class="product-img">
                                <a href="${pageContext.request.contextPath}/product_findByPid?pid=${pid}" target="_blank">
                                    <img src="${pageContext.request.contextPath}/<s:property value="image"/>" />
                                    <span class="new-label2">HOT</span>
                                </a>
                                <div class="product-content">
                                    <div class="pro-title">
                                        <h3><a href="${pageContext.request.contextPath}/userProduct_findByPdid?pid=${pid}"><s:property value="pname"/></a></h3>
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
        </div>
    </div>
</div>

<div class="best-sell-area pt-50">
    <div class="container">
        <div class="row">
            <div class="section-title text-center mb-50">
                <h2>最新商品</h2>
            </div>
        </div>
        <div class="row">
            <div class="product-carousel">
                <s:iterator value="nlist">
                    <div class="col-md-12">
                        <div class="product-wrapper  mb-40 mrg-nn-xs ">
                            <div class="product-img">
                                <a href="${pageContext.request.contextPath}/product_findByPdid?pid=${pid}" target="_blank">
                                    <img src="${pageContext.request.contextPath}/<s:property value="image"/>" />
                                    <span class="new-label">NEW</span>
                                </a>
                                <div class="product-content">
                                    <div class="pro-title">
                                        <h3><a href="product-details.html"><s:property value="pname"/></a></h3>
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
        </div>
    </div>
</div>
<%@ include file="bottom.jsp" %>


<!-- Bootstrap framework js -->
<script src="${pageContext.request.contextPath}/jsp/js/bootstrap.min.js"></script>

<!-- owl.carousel js Jquery轻量级幻灯插件-OWL Carousel -->
<script src="${pageContext.request.contextPath}/jsp/js/owl.carousel.min.js"></script>
<!-- jquery.nivo.slider js -->
<%--Nivoslider是一款基于jQuery的，能实现多种切换效果的图片切换插件--%>
<script src="${pageContext.request.contextPath}/jsp/js/jquery.nivo.slider.pack.js"></script>
<!-- All js plugins included in this file. -->
<script src="${pageContext.request.contextPath}/jsp/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/jsp/js/main.js"></script>
</body>
</html>

