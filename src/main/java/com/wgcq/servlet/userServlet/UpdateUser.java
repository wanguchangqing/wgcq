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
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/update/user")
public class UpdateUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int roleId = Integer.parseInt(req.getParameter("roleId"));

        User user = new User(id, username, password, roleId);

        SqlSession sqlSession = MybatisUtils.getSqlSession();

        UserService userService = new UserService(sqlSession);

        int i = userService.updateUser(user);

        if(req.getParameter("action").equals("user")) {
            HttpSession session = req.getSession();
            User userById = userService.getUserById(id);
            session.setAttribute("loginUser",userById);
        }

        sqlSession.close();
        resp.getWriter().write("ok");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
