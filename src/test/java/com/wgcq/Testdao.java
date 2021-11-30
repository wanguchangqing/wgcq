package com.wgcq;

import com.wgcq.beans.*;
import com.wgcq.dao.*;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.Date;
import java.util.List;

public class Testdao {
    @Test
    public void userTest() {
        // 获取sqlsession对象
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        // 得到mapper对象
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);

        // 获取全部用户
        List<User> userList = mapper.getUserList();
        // 通过id获取用户
        User userById = mapper.getUserById(2);
        // 通过用户名获取用户
        User userByUsername = mapper.getUserByUsername("王姐");

        // 添加一个用户
        mapper.addUser(new User("王姐","123",1));
        // 更新2号用户
        mapper.updateUser(new User(2,"陈王小","11",1));
        // 删除4号用户
        mapper.deleteUser(4);

        // 提交
        sqlSession.commit();
        // 关闭
        sqlSession.close();
    }
    @Test
    public void roleTest() {
        // 获取sqlsession对象
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        // 执行sql
        RoleMapper mapper = sqlSession.getMapper(RoleMapper.class);

        mapper.getRoleList();
        mapper.addRole(new Role(1,"管理员2"));
        mapper.addRole(new Role(2,"老人"));
        mapper.addRole(new Role(3,"护工"));
        mapper.addRole(new Role(4,"丑八怪"));

        mapper.updateRole(new Role(1,"管理员"));
        mapper.deleteRole(4);

        sqlSession.commit();
        // 关闭
        sqlSession.close();
    }
    @Test
    public void fileTest() {
        // 获取sqlsession对象
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        // 执行sql
        FileMapper mapper = sqlSession.getMapper(FileMapper.class);

        // mapper.getFileList();
        // mapper.addFile(new File("陈过",13,1,"我是大坏蛋",1,1));
        // mapper.addFile(new File("陈国",13,1,"我是大坏蛋",1,2));
        // mapper.addFile(new File(123,"陈过",13,1,"我是大坏蛋",1,3));
        mapper.updateFile(new File(2,"陈国然",13,1,"我是大坏蛋",1,2));
        // mapper.deleteFile(123);

        sqlSession.commit();
        // 关闭
        sqlSession.close();
    }
    @Test
    public void foodTest() {
        // 获取sqlsession对象
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        // 执行sql
        FoodMapper mapper = sqlSession.getMapper(FoodMapper.class);

        mapper.addFood(new Food("番茄炒蛋",13));
        mapper.addFood(new Food(2,"番茄炒老鼠",13));
        mapper.addFood(new Food("番茄炒西红柿",13));
        mapper.updateFood(new Food(2,"番茄炒rou",13));
        mapper.deleteFood(2);
        mapper.getFoodList();

        sqlSession.commit();
        // 关闭
        sqlSession.close();
    }
    @Test
    public void BedTest() {
        // 获取sqlsession对象
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        // 执行sql
        BedMapper mapper = sqlSession.getMapper(BedMapper.class);

        mapper.addBed(new Bed(1,"1012",1));
        mapper.addBed(new Bed(4,"1013",1));
        mapper.addBed(new Bed(2,"1014",1));
        mapper.addBed(new Bed(3,"1015",1));
        mapper.addBed(new Bed(5,"1016",1));

        mapper.updateBed(new Bed(4,"1013",2));
        mapper.deleteBed(2);
        mapper.getBedList();

        sqlSession.commit();
        // 关闭
        sqlSession.close();
    }
    @Test
    public void accessTest() {
        // 获取sqlsession对象
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        // 执行sql
        AccessMapper mapper = sqlSession.getMapper(AccessMapper.class);

        mapper.addAccess(new Access(1,"回家",new Date(),1));
        mapper.addAccess(new Access(2,"回家",new Date(),2));
        mapper.getAccessList();
        mapper.deleteAccess(2);
        mapper.updateAccess(new Access(1,"回家吃饭",new Date(),2));

        sqlSession.commit();
        // 关闭
        sqlSession.close();
    }

    @Test
    public void orderTest() {
        // 获取sqlsession对象
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        // 执行sql
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);

        // mapper.addOrder(new Order(1,1,new Date()));
        // mapper.addOrder(new Order(1,3,new Date()));
        // mapper.addOrder(new Order(1,2,new Date()));
        //
        // mapper.deleteOrder(1);
        mapper.updateOrder(new Order(2,1,4,new Date()));

        sqlSession.commit();
        // 关闭
        sqlSession.close();
    }
}
