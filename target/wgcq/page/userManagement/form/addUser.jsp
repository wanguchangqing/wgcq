<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wgcq.service.UserService" %>
<%@ page import="com.wgcq.beans.User" %>
<html class="x-admin-sm">

    <head>
        <meta charset="UTF-8">
        <title>添加管理员</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/iconfont.css">
        <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>

        <style>
            .layui-unselect {
                display: inline-block;
                width: 190px;
            }
        </style>
    </head>


    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
<%--                    <input hidden value="${user.getId()}" name="id">--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-inline">
                            <input type="text" required lay-verify="required"
                                   autocomplete="off" class="layui-input"
                                   name="username">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-inline">
                            <input type="text" required lay-verify="required"
                                   autocomplete="off" class="layui-input"
                                   name="password">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">角色</label>
                        <select name="roleId" lay-verify="required">
                            <option value=""></option>
                            <option value="1">管理员</option>
                            <option value="2">养员</option>
                            <option value="3">员工</option>
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
        layui.use(['form', 'layer'], function() {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;


            //监听提交
            form.on('submit(add)',
                function(data) {
                    console.log(data);
                    //发异步，把数据提交给php

                    $.post({
                        url: 'http://localhost:8080/add/user',
                        data: {
                            ...data.field
                        }
                    })

                    layer.alert("添加成功", {
                            icon: 6
                        },

                        function() {
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

