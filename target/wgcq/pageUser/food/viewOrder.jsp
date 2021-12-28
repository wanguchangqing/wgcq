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
    </script>
</html>
