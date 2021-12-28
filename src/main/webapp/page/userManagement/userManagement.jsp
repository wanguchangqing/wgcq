<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wgcq.service.UserService" %>
<%@ page import="com.wgcq.beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wgcq.util.MybatisUtils" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>用户管理</title>
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
        UserService userService = new UserService(sqlSession);
        List<User> userList = userService.getUserList();
        sqlSession.close();
        request.setAttribute("userList", userList);
    %>

    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">用户管理</a>
            <a>
              <cite>用户列表</cite></a>
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
                                    onclick="xadmin.open('添加用户','/page/userManagement/form/addUser.jsp',800,600)">
                                <i class="layui-icon"></i>添加
                            </button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
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
                                        <td>${user.getId()}</td>
                                        <td>${user.getUsername()}</td>
                                        <td>${user.getPassword()}</td>
                                        <td class="td-status">
                                            <c:if test="${user.getRoleId() == 1}">
                                                <button type="button" class="layui-btn layui-btn-danger">管理员</button>
                                            </c:if>
                                            <c:if test="${user.getRoleId() == 2}">
                                                <button type="button" class="layui-btn layui-btn-warm">养员</button>
                                            </c:if>
                                            <c:if test="${user.getRoleId() == 3}">
                                                <button type="button" class="layui-btn layui-btn-normal">员工</button>
                                            </c:if>

                                        </td>


                                        <td class="td-manage ">

                                            <button type="button" class="layui-btn layui-btn-primary"
                                                    onclick="xadmin.open('更新用户','/page/userManagement/form/updateUser.jsp?id='+${user.getId()},800,600)">
                                                更新<i class="layui-icon">&#xe642;</i>
                                            </button>

                                            <button type="button" class="layui-btn layui-btn-primary">
                                                <a title="删除" href="javascript:;"
                                                   onclick="member_del(this,${user.getId()})"
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
        function member_del(obj, id) {
            layer.confirm('确认要删除吗？', {icon: 3, title: '提示信息'}, function (index) {
                //发异步删除数据
                $.post({
                    url: 'http://localhost:8080/delete/user',
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
