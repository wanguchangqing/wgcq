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
        String ids = request.getParameter("id");
        int id = Integer.parseInt(ids);
        UserService userService = new UserService(sqlSession);
        User user = userService.getUserById(id);
        request.setAttribute("user", user);
    %>

    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
<%--            <a href="">用户管理</a>--%>
            <a>
              <cite>个人中心</cite></a>
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
                                    onclick="xadmin.open('更新用户','/pageUser/user/form/updateUser.jsp?id='+${user.getId()},800,600)">
                                <i class="layui-icon"></i>更新用户信息
                            </button>
                        </div>

                        <form class="layui-form">
                            <input hidden value="${user.getId()}" name="id">
                            <div class="layui-form-item">
                                <label class="layui-form-label">用户名</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="username" required lay-verify="required"
                                           readonly="readonly"
                                           autocomplete="off" class="layui-input"
                                           name="username" value="${user.getUsername()}">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="password" required lay-verify="required"
                                           readonly="readonly"
                                           autocomplete="off" class="layui-input"
                                           name="password" value="${user.getPassword()}">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">角色</label>
                                <div class="layui-input-inline">
                                    <c:if test="${user.getRoleId() == 1}">
                                        <input type="text" name="password" required lay-verify="required"
                                               readonly="readonly"
                                               autocomplete="off" class="layui-input"
                                               name="password" value="管理员"/>
                                    </c:if>
                                    <c:if test="${user.getRoleId() == 2}">
                                        <input type="text" name="password" required lay-verify="required"
                                               readonly="readonly"
                                               autocomplete="off" class="layui-input"
                                               name="password" value="养员"/>
                                    </c:if>
                                    <c:if test="${user.getRoleId() == 3}">
                                        <input type="text" name="password" required lay-verify="required"
                                               readonly="readonly"
                                               autocomplete="off" class="layui-input"
                                               name="password" value="员工"/>
                                    </c:if>
                                </div>
                            </div>


                        </form>

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
