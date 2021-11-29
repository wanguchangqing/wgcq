package com.wgcq.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private int id;
    private int userId;
    private int foodId;
    private Date time;

    public Order(int userId, int foodId, Date time) {
        this.userId = userId;
        this.foodId = foodId;
        this.time = time;
    }
}
