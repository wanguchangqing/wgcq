<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wgcq.service.FileService" %>
<%@ page import="com.wgcq.beans.File" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.wgcq.util.MybatisUtils" %>
<%@ page import="com.wgcq.beans.OldmanFilePlus" %>
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
        FileService fileService = new FileService(sqlSession);
        List<OldmanFilePlus> fileList = fileService.getOldmanFilePlusList();
        sqlSession.close();
        request.setAttribute("fileList", fileList);
    %>

    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">档案管理</a>
            <a>
              <cite>养员档案列表</cite></a>
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
<%--                            <button class="layui-btn"--%>
<%--                                    onclick="xadmin.open('添加养员档案','/page/fileManagement/form/addFile.jsp?action=oldman',800,600)">--%>
<%--                                <i class="layui-icon"></i>添加--%>
<%--                            </button>--%>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>用户名</th>
                                    <th>姓名</th>
                                    <th>详情</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${fileList}" var="file">
                                    <tr>
                                        <td>${file.getId()}</td>
                                        <td>${file.getUser().getUsername()}</td>
                                        <td>${file.getName()}</td>
                                        <td class="td-status">
                                            <span class="layui-btn layui-btn-normal" onclick="xadmin.open('查看养员档案','/page/fileManagement/form/viewOldmanFile.jsp?id='+${file.getId()},800,600)">查看详情</span>
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
    </script>
</html>
