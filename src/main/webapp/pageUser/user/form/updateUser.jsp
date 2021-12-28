<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wgcq.service.UserService" %>
<%@ page import="com.wgcq.beans.User" %>
<%@ page import="com.wgcq.util.MybatisUtils" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>添加用户</title>
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

    <%
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        String ids = request.getParameter("id");
        int id = Integer.parseInt(ids);
        UserService userService = new UserService(sqlSession);
        User user = userService.getUserById(id);
        request.setAttribute("user", user);
    %>

    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <input hidden value="${user.getId()}" name="id">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" required lay-verify="required"
                                   autocomplete="off" class="layui-input"
                                   name="username" value="${user.getUsername()}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="password" required lay-verify="required"
                                   autocomplete="off" class="layui-input"
                                   name="password" value="${user.getPassword()}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">角色</label>
                        <select name="roleId">
                            <option value="1"
                                    <%if (user.getRoleId() == 1) out.print(" selected");%> >管理员
                            </option>
                            <option value="2"
                                    <%if (user.getRoleId() == 2) out.print(" selected");%> >养员
                            </option>
                            <option value="3"
                                    <%if (user.getRoleId() == 3) out.print(" selected");%> >员工
                            </option>
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
                        url: 'http://localhost:8080/update/user',
                        data: {
                            action: 'user',
                            ...data.field
                        }
                    })

                    layer.alert("更新成功", {
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
