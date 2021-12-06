package com.wgcq.service;

import com.wgcq.beans.User;
import com.wgcq.dao.UserMapper;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

public class LoginService {

    private UserMapper mapper;
    SqlSession sqlSession;

    public LoginService() {
        sqlSession = MybatisUtils.getSqlSession();
        mapper = sqlSession.getMapper(UserMapper.class);
    }

    public boolean login(User user) {
        User userByUsername = mapper.getUserByUsername(user.getUsername());

        if(userByUsername != null) {

            if(user.getPassword().equals(userByUsername.getPassword())) {
                return true;
            } else {
                return false;
            }

        } else {
            return false;
        }
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
