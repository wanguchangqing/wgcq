<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            div.panel-default {
                width: 60%;
                margin: 0px auto;
            }
            .input-group {
                width: 500px;
                margin-bottom: 15px;
            }

            .input-group input {
                display: block;
            }
            select.btn{
                padding: 0;
                padding-left: 10px;
                vertical-align: middle;
                width: 80px;
                text-align: center;
            }
        </style>

    </head>


    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">更新用户</h3>
            </div>
            <div class="panel-body">
                <form action="/do" method="post">
                    <div class="input-group">
                        <span class="input-group-addon">用户名</span>
                        <input type="text" name="username" class="form-control" placeholder="Username"
                               aria-describedby="sizing-addon2">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">密码</span>
                        <input type="text" name="password" class="form-control" placeholder="Password"
                               aria-describedby="sizing-addon2">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">角色</span>
                        <select name="roleId" class="btn btn-default dropdown-toggle">
                            <option value="1">管理员</option>
                            <option value="2">养员</option>
                            <option value="3">员工</option>
                        </select>
                    </div>
                    <button type="submit" class="layui-btn layui-btn-primary"
                            onclick="xadmin.close()">提交</button>
                </form>
            </div>
        </div>

    </body>
</html>
