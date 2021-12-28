<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wgcq.service.UserService" %>
<%@ page import="com.wgcq.beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wgcq.util.MybatisUtils" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.wgcq.service.FoodService" %>
<%@ page import="com.wgcq.beans.Food" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>订餐管理</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/iconfont.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js"
                charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    </head>

    <%
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        FoodService foodService = new FoodService(sqlSession);
        List<Food> foodList = foodService.getFoodList();
        sqlSession.close();
        request.setAttribute("foodList", foodList);
    %>

    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">订餐管理</a>
            <a>
              <cite>菜单列表</cite></a>
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
                            <button class="layui-btn"
                                    onclick="xadmin.open('添加菜单','/page/foodManagement/form/addFood.jsp',800,600)">
                                <i class="layui-icon"></i>添加
                            </button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>名称</th>
                                    <th>价格</th>
                                    <th>介绍</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${foodList}" var="food">
                                    <tr>
                                        <td>${food.getId()}</td>
                                        <td>${food.getName()}</td>
                                        <td>${food.getValue()}</td>
                                        <td>${food.getInfo()}</td>

                                        <td class="td-manage ">

                                            <button type="button" class="layui-btn layui-btn-primary"
                                                    onclick="xadmin.open('更新菜单','/page/foodManagement/form/updateFood.jsp?id='+${food.getId()},800,600)">
                                                更新<i class="layui-icon">&#xe642;</i>
                                            </button>

                                            <button type="button" class="layui-btn layui-btn-primary">
                                                <a title="删除" href="javascript:;"
                                                   onclick="member_del(${food.getId()})"
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
        /*用户-删除*/
        function member_del(id) {
            layer.confirm('确认要删除吗？', {icon: 3, title: '提示信息'}, function (index) {
                //发异步删除数据
                $.post({
                    url: 'http://localhost:8080/delete/food',
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
