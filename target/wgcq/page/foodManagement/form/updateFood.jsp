<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wgcq.service.UserService" %>
<%@ page import="com.wgcq.beans.User" %>
<%@ page import="com.wgcq.service.FoodService" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.wgcq.util.MybatisUtils" %>
<%@ page import="com.wgcq.beans.Food" %>
<html class="x-admin-sm">

    <head>
        <meta charset="UTF-8">
        <title>添加菜单</title>
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
        String ids = request.getParameter("id");
        int id = Integer.parseInt(ids);
        FoodService foodService = new FoodService(sqlSession);
        Food food = foodService.getFoodById(id);
        request.setAttribute("food", food);
    %>


    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <input hidden value="${food.getId()}" name="id">
                    <div class="layui-form-item">
                        <label class="layui-form-label">名称</label>
                        <div class="layui-input-inline">
                            <input type="text" required lay-verify="required"
                                   autocomplete="off" class="layui-input"
                                   name="name" value="${food.getName()}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">价格</label>
                        <div class="layui-input-inline">
                            <input type="text" required lay-verify="required"
                                   autocomplete="off" class="layui-input"
                                   name="value" value="${food.getValue()}">
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">介绍</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" class="layui-textarea"
                                      lay-verify="required" name="info">${food.getInfo()}</textarea>
                        </div>
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
                    console.log(data);
                    //发异步，把数据提交给php

                    $.post({
                        url: 'http://localhost:8080/update/food',
                        data: {
                            ...data.field
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

