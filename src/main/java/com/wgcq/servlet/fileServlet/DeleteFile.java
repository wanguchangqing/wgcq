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

@WebServlet("/delete/file")
public class DeleteFile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        FileService fileService = new FileService(sqlSession);

        int id = Integer.parseInt(req.getParameter("id"));

        int i = fileService.deleteFile(id);

        sqlSession.close();
        resp.getWriter().write("ok");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}



