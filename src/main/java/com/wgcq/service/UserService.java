package com.wgcq.service;

import com.wgcq.beans.Bed;
import com.wgcq.beans.User;
import com.wgcq.dao.BedMapper;
import com.wgcq.dao.UserMapper;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class UserService {
    private SqlSession sqlSession;
    private UserMapper mapper;
    private BedMapper bedMapper;

    public UserService(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
        mapper = sqlSession.getMapper(UserMapper.class);
        bedMapper = sqlSession.getMapper(BedMapper.class);
    }

    public List<User> getUserList() {
        return mapper.getUserList();
    }

    public User getUserById(int id) {
        return mapper.getUserById(id);
    }

    public int updateUser(User user) {

        int id = user.getId();

        User oldUser = mapper.getUserById(id);

        if(oldUser.getRoleId() == 2 && user.getRoleId() != 2) {
            Bed bedByUserId = bedMapper.getBedByUserId(id);

            if(bedByUserId != null) {
                bedByUserId.setState(0);
                bedByUserId.setUserId(-1);
                bedMapper.updateBed(bedByUserId);
            }
        }

        int i = mapper.updateUser(user);
        sqlSession.commit();
        return i;

    }

    public int addUser(User user) {
        int i = mapper.addUser(user);
        sqlSession.commit();
        return i;

    }

    public int deleteUser(int id) {
        int i = mapper.deleteUser(id);
        sqlSession.commit();
        return i;
    }

    // 获取没有档案的人
    public List<User> getNoFileOldmanUserList() {
        return mapper.getNoFileOldmanUserList();
    }

    public List<User> getNoFileWokerUserList() {
        return mapper.getNoFileWokerUserList();
    }

    public List<User> getNoBedOldmanUserList() {
        return mapper.getNoBedOldmanUserList();
    }
}
