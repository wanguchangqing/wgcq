package com.wgcq.service;

import com.wgcq.beans.User;
import com.wgcq.dao.UserMapper;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class UserService {
    private SqlSession sqlSession  = MybatisUtils.getSqlSession();;
    private UserMapper mapper = sqlSession.getMapper(UserMapper.class);

    public List<User> getUserList() {
        List<User> userList = mapper.getUserList();
        return userList;
    }
}
