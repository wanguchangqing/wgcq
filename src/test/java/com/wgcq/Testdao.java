package com.wgcq;

import com.wgcq.beans.*;
import com.wgcq.dao.*;
import com.wgcq.service.*;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.Date;
import java.util.List;

public class Testdao {
    @Test
    public void test() {
        SqlSession sqlSession = MybatisUtils.getSqlSession();

        BedService bedService = new BedService(sqlSession);

        Bed bed = new Bed();

        bed.setIdAndUserId(1,14);

        bedService.changeBed(bed);

    }
}
