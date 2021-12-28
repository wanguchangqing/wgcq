<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wgcq.util.MybatisUtils" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.wgcq.beans.Bed" %>
<%@ page import="com.wgcq.service.BedService" %>
<%@ page import="com.wgcq.service.FoodService" %>
<%@ page import="com.wgcq.beans.OrderPlus" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>订餐管理</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/iconfont.css">
        <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js"
                charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
    </head>

    <%
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        FoodService foodService = new FoodService(sqlSession);
        List<OrderPlus> orderList = foodService.getOrderPlusList();
        sqlSession.close();
        request.setAttribute("orderList", orderList);
    %>

    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">订餐管理</a>
            <a>
              <cite>订单列表</cite></a>
          </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
               onclick="location.reload()" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>用户</th>
                                    <th>菜单</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${orderList}" var="order">
                                    <tr>
                                        <td>${order.getId()}</td>
                                        <td>${order.getUser().getUsername()}</td>
                                        <td>${order.getFood().getName()}</td>
                                        <td>
                                            <c:if test="${order.getState() == 0}">
                                                <button type="button" class="layui-btn layui-btn-warm">未完成</button>
                                            </c:if>
                                            <c:if test="${order.getState() == 1}">
                                                <button type="button" class="layui-btn layui-btn-normal">已完成</button>
                                            </c:if>
                                            <c:if test="${order.getState() == 2}">
                                                <button type="button" class="layui-btn layui-btn-danger">已取消</button>
                                            </c:if>
                                        </td>
                                        <td class="td-manage ">
                                            <span>更改为</span>
                                            <c:if test="${order.getState() == 0}">
                                                <button type="button" class="layui-btn layui-btn-normal"
                                                        onclick="change1(${order.getId()})">
                                                    已完成
                                                </button>
                                                <button type="button" class="layui-btn layui-btn-danger"
                                                        onclick="change2(${order.getId()})">
                                                    已取消
                                                </button>
                                            </c:if>
                                            <c:if test="${order.getState() == 1}">
                                                <button type="button" class="layui-btn layui-btn-warm"
                                                        onclick="change0(${order.getId()})">
                                                    未完成
                                                </button>
                                                <button type="button" class="layui-btn layui-btn-danger"
                                                        onclick="change2(${order.getId()})">
                                                    已取消
                                                </button>
                                            </c:if>
                                            <c:if test="${order.getState() == 2}">
                                                <button type="button" class="layui-btn layui-btn-warm"
                                                        onclick="change0(${order.getId()})">
                                                    未完成
                                                </button>
                                                <button type="button" class="layui-btn layui-btn-normal"
                                                        onclick="change1(${order.getId()})">
                                                    已完成
                                                </button>
                                            </c:if>

                                            <button type="button" class="layui-btn layui-btn-primary">
                                                <a title="删除" href="javascript:;" onclick="member_del(${order.getId()})"
                                                   style="text-decoration:none">
                                                    删除<i class="layui-icon">&#xe640;</i>
                                                </a>
                                            </button>

                                        </td>
                                    </tr>
                                </c:forEach>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        /*更改为未完成*/
        function change0(id) {
            layer.confirm('确认要更新吗？', {icon: 3, title: '提示信息'}, function (index) {
                //发异步删除数据
                $.post({
                    url: 'http://localhost:8080/update/order',
                    data: {
                        state: '0',
                        id: id
                    },

                    success: function () {
                        layer.alert("操作成功", {
                                icon: 6
                            },

                            function () {
                                window.location.reload();
                            });
                    }
                })


            });
        }
        /*更改为已完成*/
        function change1(id) {
            layer.confirm('确认要更新吗？', {icon: 3, title: '提示信息'}, function (index) {
                //发异步删除数据
                $.post({
                    url: 'http://localhost:8080/update/order',
                    data: {
                        state: '1',
                        id: id
                    },

                    success: function () {
                        layer.alert("操作成功", {
                                icon: 6
                            },

                            function () {
                                window.location.reload();
                            });
                    }
                })


            });
        }

        /*更改为取消*/
        function change2(id) {
            layer.confirm('确认要更新吗？', {icon: 3, title: '提示信息'}, function (index) {
                //发异步删除数据
                $.post({
                    url: 'http://localhost:8080/update/order',
                    data: {
                        state: '2',
                        id: id
                    },

                    success: function () {
                        layer.alert("操作成功", {
                                icon: 6
                            },

                            function () {
                                window.location.reload();
                            });
                    }
                })


            });
        }

        /*用户-删除*/
        function member_del(id) {
            layer.confirm('确认要删除吗？', {icon: 3, title: '提示信息'}, function (index) {
                //发异步删除数据
                $.post({
                    url: 'http://localhost:8080/delete/order',
                    data: {
                        id: id
                    },

                    success: function () {
                        layer.alert("删除成功", {
                                icon: 6
                            },

                            function () {
                                window.location.reload();
                            });
                    }
                })
            });
        }
    </script>
</html>
