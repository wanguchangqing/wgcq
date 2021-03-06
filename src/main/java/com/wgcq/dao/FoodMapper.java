package com.wgcq.dao;

import com.wgcq.beans.File;
import com.wgcq.beans.Food;

import java.util.List;

public interface FoodMapper {
    List<Food> getFoodList();

    Food getFoodById(int id);

    int addFood(Food food);

    int updateFood(Food food);

    int deleteFood(int id);
}
