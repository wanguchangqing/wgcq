package com.wgcq.dao;

import com.sun.org.apache.xpath.internal.operations.Or;
import com.wgcq.beans.Access;
import com.wgcq.beans.Food;
import com.wgcq.beans.Order;

import java.util.List;

public interface OrderMapper {

    List<Order> getOrderList();

    Order getOrderById(int id);

    List<Order> getOrderListByUserId(int userId);

    int addOrder(Order order);

    int updateOrder(Order order);

    int deleteOrder(int id);
}
