package com.wgcq.servlet.foodServlet;

import com.wgcq.beans.File;
import com.wgcq.beans.Food;
import com.wgcq.service.FileService;
import com.wgcq.service.FoodService;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/add/food")
public class AddFood extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        FoodService foodService = new FoodService(sqlSession);

        String name = req.getParameter("name");
        int value = Integer.parseInt(req.getParameter("value"));
        String info = req.getParameter("info");

        foodService.addFood(new Food(name,value,info));
        sqlSession.close();
        resp.getWriter().write("ok");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
