<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wgcq.service.UserService" %>
<%@ page import="com.wgcq.beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.wgcq.util.MybatisUtils" %>
<%@ page import="com.wgcq.service.BedService" %>
<%@ page import="com.wgcq.beans.Bed" %>
<%@ page import="com.wgcq.service.FoodService" %>
<%@ page import="com.wgcq.beans.Food" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>添加管理员</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/iconfont.css">
        <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js"
                charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>

        <style>
            .layui-unselect {
                display: inline-block;
                width: 190px;
            }
        </style>
    </head>

    <%
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        FoodService foodService = new FoodService(sqlSession);

        String ids = request.getParameter("id");
        int id = Integer.parseInt(ids);
        request.setAttribute("id",id);

        List<Food> foodList = foodService.getFoodList();
        request.setAttribute("foodList",foodList);
        sqlSession.close();
    %>

    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <%--      传过来是userId              --%>
                    <input hidden value="${id}" name="userId">

                    <div class="layui-form-item">
                        <label class="layui-form-label">选择订餐</label>
                        <select lay-verify="required" required="required"
                                name="foodId">
                            <option value=""></option>
                            <c:forEach items="${foodList}" var="food">
                                <option value="${food.getId()}">${food.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">
                        </label>
                        <button class="layui-btn" lay-filter="add" lay-submit="">确认</button>
                    </div>
                </form>
            </div>
        </div>
    </body>

    <script>
        layui.use(['form', 'layer'], function () {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;


            //监听提交
            form.on('submit(add)',
                function (data) {
                    console.log(data.field);
                    //发异步，把数据提交给php

                    $.post({
                        url: 'http://localhost:8080/add/order',
                        data: {
                            action: '4',
                            foodId: data.field.foodId,
                            userId: data.field.userId
                        }
                    })

                    layer.alert("添加成功", {
                            icon: 6
                        },

                        function () {
                            //关闭当前frame
                            xadmin.close();

                            // 可以对父窗口进行刷新
                            xadmin.father_reload();
                        });
                    return false;
                });

        });
    </script>

</html>

