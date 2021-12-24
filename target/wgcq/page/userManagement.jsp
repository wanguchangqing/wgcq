<%@ page import="com.wgcq.service.UserService" %>
<%@ page import="com.wgcq.beans.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
        <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
              integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
              crossorigin="anonymous">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">

        <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
        <style>

            .panel-heading button {
                margin-left: 15px;
            }

            .table thead tr td,
            .table thead tr th,
            .table tbody tr td,
            .table tbody tr th {
                text-align: center;
                vertical-align: middle;
            }
        </style>
    </head>

    <%
        UserService userService = new UserService();
        List<User> userList = userService.getUserList();
        request.setAttribute("userList", userList);
    %>

    <body>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">用户管理
                <button type="button" class="layui-btn layui-btn-primary layui-btn-sm">添加</button>
            </div>

            <!-- Table -->
            <table class="table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>角色</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <th>${user.getId()}</th>
                        <td>${user.getUsername()}</td>
                        <td>${user.getPassword()}</td>
                        <td>${
                                user.getRoleId() == 1 ? "管理员" :
                                        user.getRoleId() == 2 ? "养员" :
                                                user.getRoleId() == 3 ? "员工" : "未知"}</td>
                        <td>
                            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm"
                                    onclick="xadmin.open('更新用户','/page/form/updateUser.jsp')">更新
                            </button>
                            <button type="button" class="layui-btn layui-btn-danger layui-btn-sm">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
