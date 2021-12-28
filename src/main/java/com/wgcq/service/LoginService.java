package com.wgcq.service;

import com.wgcq.beans.User;
import com.wgcq.dao.UserMapper;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

public class LoginService {

    private UserMapper mapper;
    private SqlSession sqlSession;

    public LoginService(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
        this.mapper = this.sqlSession.getMapper(UserMapper.class);
    }

    public User login(User user) {
        User userByUsername = mapper.getUserByUsername(user.getUsername());

        if(userByUsername != null) {

            if(user.getPassword().equals(userByUsername.getPassword())) {
                return userByUsername;
            }

        }
        return null;
    }

    public boolean register(User user) {
        User userByUsername = mapper.getUserByUsername(user.getUsername());

        if(userByUsername == null) {
            user.setRoleId(1);
            mapper.addUser(user);
            sqlSession.commit();
            return true;
        } else {
            return false;
        }
    }

}
