package com.wgcq.servlet.bedServlet;

import com.wgcq.beans.Bed;
import com.wgcq.dao.BedMapper;
import com.wgcq.service.BedService;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update/bed")
public class UpdateBed extends HttpServlet {

    private SqlSession sqlSession;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        sqlSession = MybatisUtils.getSqlSession();

        String action = req.getParameter("action");

        if(action.equals("1")) {
            // 空置切换
            saleOfSpare(req,resp);
        } else if(action.equals("2")) {
            // 停用
            ownToSpare(req,resp);
        } else if(action.equals("3")) {
            distributeUser(req,resp);
        } else if(action.equals("4")) {
            agreeApply(req,resp);
        } else if(action.equals("5")) {
            changeBed(req,resp);
        }


        sqlSession.close();
        resp.getWriter().write("ok");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }


    public void saleOfSpare(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        BedService bedService = new BedService(sqlSession);
        bedService.saleOfSpare(id);

    }

    public void  ownToSpare(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        BedService bedService = new BedService(sqlSession);
        bedService.ownToSpare(id);
    }

    public void  distributeUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        int userId = Integer.parseInt(req.getParameter("userId"));
        BedService bedService = new BedService(sqlSession);

        Bed bed = new Bed();
        bed.setIdAndUserId(id,userId);
        bedService.distributeUser(bed);
    }

    // 用户申请
    public void  agreeApply(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        int userId = Integer.parseInt(req.getParameter("userId"));
        BedService bedService = new BedService(sqlSession);

        Bed bed = new Bed();
        bed.setIdAndUserId(id,userId);
        bedService.agreeApply(bed);
    }
    // 用户更换
    public void  changeBed(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        int userId = Integer.parseInt(req.getParameter("userId"));
        BedService bedService = new BedService(sqlSession);

        Bed bed = new Bed();
        bed.setIdAndUserId(id,userId);
        bedService.changeBed(bed);
    }

}

