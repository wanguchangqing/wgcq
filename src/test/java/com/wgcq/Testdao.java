package com.wgcq;

import com.wgcq.beans.*;
import com.wgcq.dao.*;
import com.wgcq.service.LoginService;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.Date;
import java.util.List;

public class Testdao {
    @Test
    public void test() {
        LoginService loginService = new LoginService();

        loginService.register(new User("123","123"));
    }
}
