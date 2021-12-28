package com.wgcq.servlet;

import com.wgcq.beans.User;
import com.wgcq.service.LoginService;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        SqlSession sqlSession = MybatisUtils.getSqlSession();

        LoginService loginService = new LoginService(sqlSession);

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = new User(username,password);

        HttpSession session = req.getSession();

        if(loginService.register(user)) {
            session.setAttribute("msg","注册成功");
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
        } else {
            session.setAttribute("msg","注册失败");
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
        }

        sqlSession.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
