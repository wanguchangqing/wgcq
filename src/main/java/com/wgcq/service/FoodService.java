package com.wgcq.service;

import com.wgcq.beans.Food;
import com.wgcq.beans.Order;
import com.wgcq.beans.OrderPlus;
import com.wgcq.dao.BedMapper;
import com.wgcq.dao.FoodMapper;
import com.wgcq.dao.OrderMapper;
import com.wgcq.dao.OrderPlusMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class FoodService {
    private SqlSession sqlSession;
    private FoodMapper mapper;
    private OrderMapper orderMapper;
    private OrderPlusMapper orderPlusMapper;

    public FoodService(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
        mapper = sqlSession.getMapper(FoodMapper.class);
        orderMapper = sqlSession.getMapper(OrderMapper.class);
        orderPlusMapper = sqlSession.getMapper(OrderPlusMapper.class);
    }

    public List<Food> getFoodList() {
        return mapper.getFoodList();
    }

    public Food getFoodById(int id) {
        return mapper.getFoodById(id);
    }

    public int addFood(Food food) {
        int i = mapper.addFood(food);
        sqlSession.commit();
        return i;
    }
    public int updateFood(Food food) {
        int i = mapper.updateFood(food);
        sqlSession.commit();
        return i;
    }

    public int deleteFood(int id) {
        int i = mapper.deleteFood(id);
        sqlSession.commit();
        return i;
    }

    // -----------order
    public Order getOrderById(int id) {
        return orderMapper.getOrderById(id);
    }

    public List<OrderPlus> getOrderPlusList() {
        return orderPlusMapper.getOrderList();
    }

    public int addOrder(Order order) {
        int i = orderMapper.addOrder(order);
        sqlSession.commit();
        return i;
    }


    public int updateOrder(Order order) {
        int i = orderMapper.updateOrder(order);
        sqlSession.commit();
        return i;
    }

    public int deleteOrder(int id) {
        int i = orderMapper.deleteOrder(id);
        sqlSession.commit();
        return i;
    }

    public List<OrderPlus> getOrderPlusByUserId(int userId) {
        return orderPlusMapper.getOrderByUserId(userId);
    }

}
