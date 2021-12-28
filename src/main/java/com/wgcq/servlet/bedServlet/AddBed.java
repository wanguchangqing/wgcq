package com.wgcq.servlet.bedServlet;


import com.wgcq.beans.Bed;
import com.wgcq.beans.File;
import com.wgcq.service.BedService;
import com.wgcq.service.FileService;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/add/bed")
public class AddBed extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        BedService bedService = new BedService(sqlSession);

        String location = req.getParameter("location");
        int state = Integer.parseInt(req.getParameter("state"));

        Bed bed = new Bed(location, state);
        bedService.addBed(bed);

        sqlSession.close();
        resp.getWriter().write("ok");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}



