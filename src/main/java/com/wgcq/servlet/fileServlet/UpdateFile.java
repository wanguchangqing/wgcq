package com.wgcq.servlet.fileServlet;

import com.wgcq.beans.File;
import com.wgcq.beans.User;
import com.wgcq.service.FileService;
import com.wgcq.service.UserService;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update/file")
public class UpdateFile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        SqlSession sqlSession = MybatisUtils.getSqlSession();

        FileService fileService = new FileService(sqlSession);

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        int sex = Integer.parseInt(req.getParameter("sex"));
        String info = req.getParameter("info");
        int userId = Integer.parseInt(req.getParameter("userId"));

        int i = fileService.updateFile(new File(id,name,age,sex,info,userId));
        sqlSession.close();
        resp.getWriter().write("ok");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}


