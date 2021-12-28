<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wgcq.util.MybatisUtils" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.wgcq.beans.Bed" %>
<%@ page import="com.wgcq.service.BedService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>用户管理</title>
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
        BedService bedService = new BedService(sqlSession);
        List<Bed> bedList = bedService.getBedList();
        sqlSession.close();
        request.setAttribute("bedList", bedList);
    %>

    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">床位管理</a>
            <a>
              <cite>床位列表</cite></a>
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
                                    onclick="xadmin.open('添加床位','/page/bedManagement/form/addBed.jsp',800,600)">
                                <i class="layui-icon"></i>添加
                            </button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>位置</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${bedList}" var="bed">
                                    <tr>
                                        <td>${bed.getId()}</td>
                                        <td>${bed.getLocation()}</td>
                                        <td>
                                            <c:if test="${bed.getState() == 0}">
                                                <button type="button" class="layui-btn layui-btn-primary">空闲</button>
                                            </c:if>
                                            <c:if test="${bed.getState() == 1}">
                                                <button type="button" class="layui-btn layui-btn-warm">已用</button>
                                            </c:if>
                                            <c:if test="${bed.getState() == 2}">
                                                <button type="button" class="layui-btn layui-btn-normal">待用</button>
                                            </c:if>
                                        </td>

                                        <td class="td-manage ">


                                            <c:if test="${bed.getState() == 0}">
                                                <button type="button" class="layui-btn layui-btn-primary" onclick="noUse(${bed.getId()})">
                                                    更改为待用</button>
                                                <button type="button" class="layui-btn layui-btn-primary"
                                                        onclick="xadmin.open('分配用户','/page/bedManagement/form/updateBedWithUser.jsp?id='+${bed.getId()},800,600)"
                                                    >分配用户</button>
                                            </c:if>
                                            <c:if test="${bed.getState() == 1}">
<%--                                                <button type="button" class="layui-btn layui-btn-primary"></button>--%>
                                                <button type="button" class="layui-btn layui-btn-primary" onclick="stopUse(${bed.getId()})">
                                                    停用<i class="layui-icon">&#xe640;</i>
                                                </button>
                                            </c:if>
                                            <c:if test="${bed.getState() == 2}">
                                                <button type="button" class="layui-btn layui-btn-primary" onclick="noUse(${bed.getId()})">
                                                    更改为空闲</button>
                                            </c:if>


<%--                                            <button type="button" class="layui-btn layui-btn-primary"--%>
<%--                                                    onclick="xadmin.open('更新用户','/page/userManagement/form/updateUser.jsp?id='+${bed.getId()},800,600)">--%>
<%--                                                更新<i class="layui-icon">&#xe642;</i>--%>
<%--                                            </button>--%>

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
        function stopUse(id) {
            layer.confirm('确认要更新吗？', {icon: 3, title: '提示信息'}, function (index) {
                //发异步删除数据
                $.post({
                    url: 'http://localhost:8080/update/bed',
                    data: {
                        action: '2',
                        id: id
                    },

                    success: function () {
                        layer.alert("操作成功", {
                                icon: 6
                            },

                            function () {
                                window.location.reload();
                            });
                    }
                })


            });
        }

        function noUse(id) {
            layer.confirm('确认要更新吗？', {icon: 3, title: '提示信息'}, function (index) {
                //发异步删除数据
                $.post({
                    url: 'http://localhost:8080/update/bed',
                    data: {
                        action: '1',
                        id: id
                    },

                    success: function () {
                        layer.alert("操作成功", {
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
