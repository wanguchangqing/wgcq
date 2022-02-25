<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">

    <head>
        <meta charset="utf-8">
        <title>On My Way</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    </head>

    <%
        session.removeAttribute("loginUser");
    %>


    <body>
        <div class="content">
            <div class="form sign-in">
                <h2>欢迎回来</h2>
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <label>
                        <span>账号123</span>
                        <input type="username" name="username"/>
                    </label>
                    <label>
                        <span>密码</span>
                        <input type="password" name="password"/>
                    </label>
                    <label>
                        <span style="color:darkred;">${msg}</span>
                    </label>
                    <p class="forgot-pass"><a href="javascript:">忘记密码？</a></p>
                    <button type="submit" class="submit">登 录</button>
                </form>
            </div>
            <div class="sub-cont">
                <div class="img">
                    <div class="img__text m--up">
                        <h2>还未注册？</h2>
                        <p>立即注册，加入我们</p>
                    </div>
                    <div class="img__text m--in">
                        <h2>已有帐号？</h2>
                        <p>有帐号就登录吧，好久不见了！</p>
                    </div>
                    <div class="img__btn">
                        <span class="m--up">注 册</span>
                        <span class="m--in">登 录</span>
                    </div>
                </div>
                <div class="form sign-up">
                    <h2>立即注册</h2>
                    <form action="${pageContext.request.contextPath}/register" method="post">
                        <label>
                            <span>账号</span>
                            <input type="username" name="username"/>
                        </label>
                        <label>
                            <span>密码</span>
                            <input type="password" name="password"/>
                        </label>
                        <label>
                            <span style="color:darkred;">${msg}</span>
                        </label>
                        <button type="submit" class="submit">注 册</button>
                    </form>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/static/js/login.js"></script>
    </body>

    <script>
        window.onload = function () {
            layui.data('tab_list', null);
            layui.data('cate', null);
        }
    </script>

</html>
