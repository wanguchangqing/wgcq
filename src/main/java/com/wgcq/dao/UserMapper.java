package com.wgcq.dao;

import com.wgcq.beans.User;

import java.util.List;

public interface UserMapper {
    // 查询全部用户
    List<User> getUserList();
    // 根据id查询用户
    User getUserById(int id);

    User getUserByUsername(String username);
    // 插入一个用户
    int addUser(User user);

    int updateUser(User user);

    int deleteUser(int id);
}
