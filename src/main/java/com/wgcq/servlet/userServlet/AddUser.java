package com.wgcq.servlet.userServlet;

import com.wgcq.beans.User;
import com.wgcq.service.UserService;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/add/user")
public class AddUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        SqlSession sqlSession = MybatisUtils.getSqlSession();
        UserService userService = new UserService(sqlSession);

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int roleId = Integer.parseInt(req.getParameter("roleId"));

        int i = userService.addUser(new User(username, password, roleId));

        sqlSession.close();
        resp.getWriter().write("ok");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
