package com.wgcq.servlet.foodServlet;

import com.wgcq.beans.Order;
import com.wgcq.service.FoodService;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/add/order")
public class AddOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        FoodService foodService = new FoodService(sqlSession);

        int userId = Integer.parseInt(req.getParameter("userId"));
        int foodId = Integer.parseInt(req.getParameter("foodId"));

        Order order = new Order(userId, foodId, new Date(), 0);

        foodService.addOrder(order);

        sqlSession.close();
        resp.getWriter().write("ok");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
