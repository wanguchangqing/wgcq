<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>商城后台管理系统</title>
<%--        <meta name="renderer" content="webkit|ie-comp|ie-stand">--%>
<%--        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
<%--        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />--%>
<%--        <meta http-equiv="Cache-Control" content="no-siteapp" />--%>

        <link rel="stylesheet" href="/static/css/index.css">

        <script src="/static/layui/layui.js" charset="utf-8"></script>
        <style>
            .show_list{display: block !important;}
            .hide_lits{display: none;}

        </style>

    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="#">商城后台管理系统</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>

            <ul class="layui-nav left fast-add" lay-filter="">
                <li class="layui-nav-item daohang" ids="#table1">
                    <a href="javascript:;">商城设置</a>
                </li>
                <li class="layui-nav-item daohang" ids="#table2">
                    <a href="javascript:;">系统设置</a>
                </li>
            </ul>

            <ul class="layui-nav right" lay-filter="">
                <li class="new-nav" id="gonggao">
                    <i></i>
                    <a href="#"><i class="iconfont">&#xe6bc;</i><span class="layui-badge">4</span></a>
                    <!--<dl class="layui-nav-child">-->
                    <ul class="news" id="gonggaos" style="display: none;">
                        <li class="dropdown-header"><i class="iconfont">&#xe6bc;</i>4条公告</li>
                        <li> <a href="javascript:;" onclick="xadmin.add_tab('统计页面','notice-list.html')">
                            <div class="clearfix">
                                <span class="pull-left"> <i class="btn btn-pink iconfont">&#xe6bc;</i> 系统公告 </span>
                                <span class="pull-right badge badge-info">+12</span>
                            </div> </a> </li>
                        <li> <a href="javascript:;" onclick="xadmin.add_tab('统计页面','notice-list.html')"> <i class="btn btn-primary iconfont">&#xe6bc;</i> 商城公告 </a> </li>

                        <li> <a href="javascript:;" onclick="xadmin.add_tab('统计页面','notice-list.html')">查看所有公告 <i class="iconfont">&#xe69b;</i> </a> </li>
                    </ul>
                    <!--</dl>-->

                </li>
                <li class="new-nav" id="new-nav">
                    <i></i>
                    <a href="#"><i class="iconfont">&#xe713;</i><span class="layui-badge">9</span></a>
                    <!--<dl class="layui-nav-child">-->
                    <ul class="news" id="news" style="display: none;">
                        <li class="dropdown-header"><i class="iconfont">&#xe6bc;</i>8条通知</li>
                        <li> <a href="#">
                            <div class="clearfix">
                                <span class="pull-left"> <i class="btn btn-pink iconfont">&#xe69b;</i> 待发货订单 </span>
                                <span class="pull-right badge badge-info">+12</span>
                            </div> </a> </li>
                        <li> <a href="#"> <i class="btn btn-primary iconfont">&#xe696;</i> 切换为编辑登录.. </a> </li>
                        <li> <a href="#">
                            <div class="clearfix">
                                <span class="pull-left"> <i class="iconfont btn btn-success">&#xe723;</i> 新订单 </span>
                                <span class="pull-right badge badge-success">+8</span>
                            </div> </a> </li>
                        <li> <a href="#">
                            <div class="clearfix">
                                <span class="pull-left"> <i class="iconfont btn btn-info">&#xe6ba;</i> 粉丝 </span>
                                <span class="pull-right badge badge-info">+11</span>
                            </div> </a> </li>
                        <li> <a href="javascript:;" onclick="xadmin.add_tab('统计页面','email.html')"> 查看所有消息 <i class="iconfont">&#xe69b;</i> </a> </li>
                    </ul>
                    <!--</dl>-->

                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">admin</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('个人信息','one_set.html')">个人信息</a></dd>
                        <dd>
                            <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>
                        <dd>
                            <a href="./login.html">退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item to-index">
                    <a href="/">前台首页</a></li>
            </ul>



        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav show_list" id="table1">
            <div class="side-nav">
                <ul class="nav">
                    <li>
                        <a href="javascript:;" onclick="xadmin.add_tab('我的桌面','welcome.html')">
                            <i class="layui-icon left-nav-li" lay-tips="首页">&#xe68e;</i>
                            <cite>首页</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>

                    </li>

                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li icon-shangpinguanli" lay-tips="商品管理"></i>
                            <cite>商品管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('商品列表','goodslist.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>商品列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('商品品牌','brand.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>商品品牌</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('商品类型','commodity-type.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>商品类型</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('商品回收站','goods-recovery.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>商品回收站</cite></a>
                            </li>
                        </ul>


                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li icon-cuxiaoyouhui" lay-tips="促销管理"></i>
                            <cite>促销管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('团购活动','group-buying.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>团购活动</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('优惠列表','discount-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>优惠列表</cite></a>
                            </li>
                        </ul>


                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe604;</i>
                            <cite>订单管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('订单列表','order-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>订单列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('发货单列表','invoice.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>发货单列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('退货单列表','return-order.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>退货单列表</cite></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>


        <div class="left-nav hide_lits" id="table2">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;" onclick="xadmin.add_tab('我的桌面','welcome.html')">
                            <i class="layui-icon left-nav-li" lay-tips="首页">&#xe68e;</i>
                            <cite>首页</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>

                    </li>

                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="文章管理">&#xe6a2;</i>
                            <cite>文章管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('文章类型列表','articletype-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>文章类型列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('文章列表','article-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>文章列表</cite></a>
                            </li>
                        </ul>


                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="公告管理">&#xe6c0;</i>
                            <cite>公告管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('公告类型','noticetype-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>公告类型</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('公告列表','notice-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>公告列表</cite></a>
                            </li>
                        </ul>


                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont icon-lanmu" lay-tips="栏目管理"></i>
                            <cite>栏目管理</cite>
                            <i class="iconfont nav_right ">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('栏目列表','cate.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>栏目列表</cite></a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                            <cite>管理员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('管理员列表','admin-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>管理员列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('角色管理','admin-role.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>角色管理</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('权限分类','admin-cate.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>权限分类</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('权限管理','admin-rule.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>权限管理</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
                            <cite>会员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">

                            <li>
                                <a onclick="xadmin.add_tab('会员列表','member-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>会员列表</cite></a>
                            </li>

                            <li>
                                <a onclick="xadmin.add_tab('会员删除','member-del.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>会员删除</cite></a>
                            </li>

                        </ul>
                    </li>

                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="系统设置">&#xe60d;</i>
                            <cite>系统设置</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('系统设置','sys-set.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>系统设置</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('屏蔽词','sys-shild.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>屏蔽词</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('系统日志','sys-log.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>系统日志</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('图片水印设置','sys-watermark.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>图片水印设置</cite></a>
                            </li>


                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="友情连接">&#xe636;</i>
                            <cite>友情连接</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('友情连接列表','link.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>友情连接列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="便签管理">&#xe6c5;</i>
                            <cite>便签管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('便签列表','note.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>便签列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="邮件管理">&#xe64a;</i>
                            <cite>邮件管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('邮件管理','email.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>邮件管理</cite></a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="其它页面">&#xe6b4;</i>
                            <cite>其它页面</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a href="login.html" target="_blank">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>登录页面</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('错误页面','error.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>错误页面</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('更新日志','log.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>更新日志</cite></a>
                            </li>
                        </ul>
                    </li>


                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="数据管理">&#xe70c;</i>
                            <cite>数据管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('文件管理','instrument.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>文件管理</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('数据库','database.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>数据库</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('备份管理','backups.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>备份管理</cite></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 左侧菜单结束 -->
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
    </body>

</html>

<script>
    $(".daohang").click(function(){
        var table = $(this).attr("ids");
        var ids = $(".show_list").attr("id");
        $("#"+ids+"").addClass("hide_lits");
        $("#"+ids+"").removeClass("show_list");
        $(""+table+"").removeClass("hide_lits");
        $(""+table+"").addClass("show_list");
    })


    window.onload=function () {
        var click=document.getElementById('new-nav');
        var news=document.getElementById('news');
        click.addEventListener('mousemove',function () {
            news.style.display='block';
        });
        click.addEventListener('mouseout',function () {
            news.style.display='none';
        });

        var gonggao=document.getElementById('gonggao');
        var gonggaos=document.getElementById('gonggaos');
        gonggao.addEventListener('mousemove',function () {
            gonggaos.style.display='block';
        });
        gonggao.addEventListener('mouseout',function () {
            gonggaos.style.display='none';
        });
    }
</script>

