<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wgcq.service.UserService" %>
<%@ page import="com.wgcq.beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wgcq.service.FileService" %>
<%@ page import="com.wgcq.beans.File" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.wgcq.util.MybatisUtils" %>
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
        String ids = request.getParameter("id");
        int id = Integer.parseInt(ids);
        FileService fileService = new FileService(sqlSession);
        File file = fileService.getFileById(id);
        request.setAttribute("file", file);
    %>

    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <input hidden value="${file.getId()}" name="id">
                    <input hidden value="${file.getUserId()}" name="userId">
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" required lay-verify="required"
                                   autocomplete="off" class="layui-input"
                                   name="name" value="${file.getName()}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">年龄</label>
                        <div class="layui-input-inline">
                            <input type="text" required lay-verify="required"
                                   autocomplete="off" class="layui-input"
                                   name="age" value="${file.getAge()}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">性别</label>
                        <select name="sex">
                            <option value="1"
                                    <%if (file.getSex() == 1) out.print(" selected");%> >男
                            </option>
                            <option value="0"
                                    <%if (file.getSex() == 0) out.print(" selected");%> >女
                            </option>
                        </select>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">介绍</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" class="layui-textarea"
                                      name="info" >${file.getInfo()}</textarea>
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
                    console.log(data.field);
                    //发异步，把数据提交给php

                    $.post({
                        url: 'http://localhost:8080/update/file',
                        type: 'post',
                        data: {
                            ...data.field
                        }
                    })

                    layer.alert("更新成功", {
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

