package com.wgcq.filter;

import com.wgcq.beans.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class LoginFilter implements Filter {

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();

        // 获得用户请求的URI
        String path = servletRequest.getRequestURI();
        System.out.println("用户请求的URI："+path);

        User loginUser = (User) session.getAttribute("loginUser");

        // 登陆页面无需过滤
        if(path.indexOf("/login") > -1 || path.indexOf("/register") > -1 || path.indexOf("/static") >-1) {
            System.out.println("被放行："+path);
            chain.doFilter(servletRequest, servletResponse);
            return;
        }

        // 判断如果没有取到用户信息,就跳转到登陆页面
        if (loginUser == null) {
            // 跳转到登陆页面
            servletResponse.sendRedirect(servletRequest.getContextPath()+"/login.jsp");
        } else {
            // 已经登陆,继续此次请求
            System.out.println("被放行："+path);
            chain.doFilter(request, response);
        }

    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }
}
