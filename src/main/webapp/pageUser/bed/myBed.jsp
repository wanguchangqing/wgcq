<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wgcq.service.UserService" %>
<%@ page import="com.wgcq.beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wgcq.service.FileService" %>
<%@ page import="com.wgcq.beans.File" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.wgcq.util.MybatisUtils" %>
<%@ page import="com.wgcq.beans.OldmanFilePlus" %>
<%@ page import="com.wgcq.service.BedService" %>
<%@ page import="com.wgcq.beans.Bed" %>
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
        BedService bedService = new BedService(sqlSession);

        String ids = request.getParameter("id");
        int id = Integer.parseInt(ids);
        request.setAttribute("id",id);

        Bed bed = bedService.getBedByUserId(id);
        if (bed != null) {
            request.setAttribute("bed", bed);
        }
    %>

    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
<%--            <a href="">用户管理</a>--%>
            <a>
              <cite>我的床位</cite></a>
          </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
               onclick="location.reload()" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>


        <div class="layui-fluid">
            <div class="layui-row">
                <div class="layui-card">
                    <div class="layui-card-header">
                        <c:if test="${bed != null}">
                            <button class="layui-btn"
                                    onclick="xadmin.open('更换床位','/pageUser/bed/form/changeBed.jsp?id='+${id},800,600)">
                                <i class="layui-icon"></i>更换床位
                            </button>
                        </c:if>
                        <c:if test="${bed == null}">
                            <button class="layui-btn"
                                    onclick="xadmin.open('申请床位','/pageUser/bed/form/applyBed.jsp?id='+${id},800,600)">
                                <i class="layui-icon"></i>申请床位
                            </button>
                        </c:if>
                    </div>
                    <form class="layui-form">
                        <div class="layui-form-item">
                            <label class="layui-form-label">位置</label>
                            <div class="layui-input-inline">
                                <c:if test="${bed != null}">
                                    <input type="text" required lay-verify="required" readonly="readonly"
                                           autocomplete="off" class="layui-input"
                                           name="location" value="${bed.getLocation()}">
                                </c:if>
                                <c:if test="${bed == null}">
                                    <input type="text" required lay-verify="required" readonly="readonly"
                                           autocomplete="off" class="layui-input"
                                           name="location" value="暂无床位">
                                </c:if>

                            </div>
                        </div>
                    </form>
                </div>

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
                    //关闭当前frame
                    xadmin.close();

                    // 可以对父窗口进行刷新
                    xadmin.father_reload();
                    return false;
                });

        });
    </script>

</html>

