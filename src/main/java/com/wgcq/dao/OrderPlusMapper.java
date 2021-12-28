package com.wgcq.dao;

import com.wgcq.beans.OrderPlus;

import java.util.List;

public interface OrderPlusMapper {
    List<OrderPlus> getOrderList();

    List<OrderPlus> getOrderByUserId(int userId);
}
