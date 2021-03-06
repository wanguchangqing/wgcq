<%@ page import="com.wgcq.service.LoginService" %>
<%@ page import="com.wgcq.util.MybatisUtils" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.wgcq.beans.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>Find You Way</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/iconfont.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js"
                charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
        <style>
            .show_list {
                display: block !important;
            }

            .hide_lits {
                display: none;
            }
        </style>
    </head>

    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="">养老辅助平台</a></div>
            <%--            <div class="left_open">--%>
            <%--                <i title="展开左侧栏" class="iconfont">&#xe699;</i>--%>
            <%--            </div>--%>

            <ul class="layui-nav left fast-add" lay-filter="">
                <li class="layui-nav-item daohang" ids="#table1">
                    <a href="javascript:;">商城设置</a>
                </li>
                <li class="layui-nav-item daohang" ids="#table2">
                    <a href="javascript:;">系统设置</a>

                </li>
            </ul>

            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">${loginUser.getUsername()}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('个人中心','/pageUser/user/myUser.jsp?id='+${loginUser.getId()})">
                                个人信息</a></dd>
<%--                        <dd>--%>
<%--                            <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>--%>
                        <dd>
                            <a href="./login.jsp">退出</a></dd>
                    </dl>
                </li>
                                <li class="layui-nav-item to-index">
                                    <a href=""></a></li>
            </ul>


        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav show_list" id="table1">
            <div id="side-nav">
                <c:if test="${loginUser.getRoleId() == 1}">
                    <ul id="nav">
                        <li>
                            <a href="javascript:;" onclick="xadmin.add_tab('我的桌面','welcome.jsp')">
                                <i class="layui-icon left-nav-li" lay-tips="首页">&#xe68e;</i>
                                <cite>首页</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                        </li>

                        <li class="layui-nav-item">
                            <a href="javascript:;"
                               onclick="xadmin.add_tab('用户管理','/page/userManagement/userManagement.jsp')">
                                <i class="iconfont left-nav-li icon-shangpinguanli" lay-tips="用户管理"></i>
                                <cite>用户管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;">
                                <i class="iconfont left-nav-li icon-cuxiaoyouhui" lay-tips="档案管理"></i>
                                <cite>档案管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                            <ul class="sub-menu">
                                <li>
                                    <a onclick="xadmin.add_tab('养员档案管理','/page/fileManagement/oldmanFile.jsp')">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>养员档案管理</cite></a>
                                </li>
                                <li>
                                    <a onclick="xadmin.add_tab('员工档案管理','/page/fileManagement/workerFile.jsp')">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>员工档案管理</cite></a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont left-nav-li" lay-tips="床位管理">&#xe604;</i>
                                <cite>床位管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                            <ul class="sub-menu">
                                <li>
                                    <a onclick="xadmin.add_tab('床位列表','/page/bedManagement/bedManagement.jsp')">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>床位列表</cite></a>
                                </li>
                                <li>
                                    <a onclick="xadmin.add_tab('床位申请','/page/bedManagement/bedManagement.jsp')">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>床位申请</cite></a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe604;</i>
                                <cite>订餐管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                            <ul class="sub-menu">
                                <li>
                                    <a onclick="xadmin.add_tab('菜单列表','/page/foodManagement/foodManagement.jsp')">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>菜单列表</cite></a>
                                </li>
                                <li>
                                    <a onclick="xadmin.add_tab('订单列表','/page/foodManagement/orderManagement.jsp')">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>订单列表</cite></a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </c:if>

                <c:if test="${loginUser.getRoleId() == 2}">
                    <ul id="nav">
                        <li>
                            <a href="javascript:;" onclick="xadmin.add_tab('我的桌面','welcome.jsp')">
                                <i class="layui-icon left-nav-li" lay-tips="首页">&#xe68e;</i>
                                <cite>首页</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                        </li>

<%--                        <li class="layui-nav-item">--%>
<%--                            <a href="javascript:;"--%>
<%--                               onclick="xadmin.add_tab('个人中心','/pageUser/user/myUser.jsp?id='+${loginUser.getId()})">--%>
<%--                                <i class="iconfont left-nav-li icon-shangpinguanli" lay-tips="个人中心"></i>--%>
<%--                                <cite>个人中心</cite>--%>
<%--                                <i class="iconfont nav_right">&#xe697;</i></a>--%>
<%--                        </li>--%>
                        <li class="layui-nav-item">
                            <a href="javascript:;"
                               onclick="xadmin.add_tab('我的档案','/pageUser/file/myFile.jsp?id='+${loginUser.getId()})">
                                <i class="iconfont left-nav-li icon-shangpinguanli" lay-tips="我的档案"></i>
                                <cite>我的档案</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;"
                               onclick="xadmin.add_tab('我的床位','/pageUser/bed/myBed.jsp?id='+${loginUser.getId()})">
                                <i class="iconfont left-nav-li icon-cuxiaoyouhui" lay-tips="我的床位"></i>
                                <cite>我的床位</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;">
                                <i class="iconfont left-nav-li icon-cuxiaoyouhui" lay-tips="档案管理"></i>
                                <cite>我的订餐</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                            <ul class="sub-menu">
                                <li>
                                    <a onclick="xadmin.add_tab('菜单','/pageUser/food/foodMenu.jsp?id='+${loginUser.getId()})">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>菜单</cite></a>
                                </li>
                                <li>
                                    <a onclick="xadmin.add_tab('我的订单','/pageUser/food/myOrder.jsp?id='+${loginUser.getId()})">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>我的订单</cite></a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </c:if>

                <c:if test="${loginUser.getRoleId() == 3}">
                    <ul id="nav">
                        <li>
                            <a href="javascript:;" onclick="xadmin.add_tab('我的桌面','welcome.jsp')">
                                <i class="layui-icon left-nav-li" lay-tips="首页">&#xe68e;</i>
                                <cite>首页</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;"
                               onclick="xadmin.add_tab('我的档案','/pageUser/file/workerFile.jsp?id='+${loginUser.getId()})">
                                <i class="iconfont left-nav-li icon-shangpinguanli" lay-tips="我的档案"></i>
                                <cite>我的档案</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;"
                               onclick="xadmin.add_tab('我的床位','/pageUser/file/viewOldmanFile.jsp')">
                                <i class="iconfont left-nav-li icon-cuxiaoyouhui" lay-tips="养员档案"></i>
                                <cite>养员档案</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;"
                               onclick="xadmin.add_tab('我的床位','/pageUser/food/viewOrder.jsp')">
                                <i class="iconfont left-nav-li icon-cuxiaoyouhui" lay-tips="养员订餐情况"></i>
                                <cite>养员订餐情况</cite>
                                <i class="iconfont nav_right">&#xe697;</i></a>
                        </li>
                    </ul>
                </c:if>
            </div>
        </div>


        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home" lay-id="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面
                    </li>
                </ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd>
                    </dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->

    </body>
</html>
<script>
    $(".daohang").click(function () {
        var table = $(this).attr("ids");
        var ids = $(".show_list").attr("id");
        $("#" + ids + "").addClass("hide_lits");
        $("#" + ids + "").removeClass("show_list");
        $("" + table + "").removeClass("hide_lits");
        $("" + table + "").addClass("show_list");
    })


    window.onload = function () {
        var click = document.getElementById('new-nav');
        var news = document.getElementById('news');
        click.addEventListener('mousemove', function () {
            news.style.display = 'block';
        });
        click.addEventListener('mouseout', function () {
            news.style.display = 'none';
        });

        var gonggao = document.getElementById('gonggao');
        var gonggaos = document.getElementById('gonggaos');
        gonggao.addEventListener('mousemove', function () {
            gonggaos.style.display = 'block';
        });
        gonggao.addEventListener('mouseout', function () {
            gonggaos.style.display = 'none';
        });


    }
</script>


