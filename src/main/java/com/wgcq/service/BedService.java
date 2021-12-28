package com.wgcq.service;

import com.wgcq.beans.Bed;
import com.wgcq.beans.File;
import com.wgcq.dao.BedMapper;
import com.wgcq.dao.FileMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class BedService {

    private SqlSession sqlSession;
    private BedMapper mapper;
    private FileMapper fileMapper;

    public BedService(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
        this.mapper = this.sqlSession.getMapper(BedMapper.class);
        fileMapper = this.sqlSession.getMapper(FileMapper.class);
    }

    public List<Bed> getBedList() {
        return mapper.getBedList();
    }

    public Bed getBedById(int id) {
        return mapper.getBedById(id);
    }

    public Bed getBedByUserId(int uerId) {
        return mapper.getBedByUserId(uerId);
    }

    public List<Bed> getSaleBedList() {
        return mapper.getSaleBedList();
    }

    // 默认0和2状态
    public int addBed(Bed bed) {
        int i = mapper.addBed(bed);
        sqlSession.commit();
        return i;
    }
    /*
        state 0 空闲但不出售
        state 1 有人
        state 2 待售

        1.将0改成2 将2改成0 修改空闲状态 无userId

        2.将1改成0 触发对应file修改bedID

        3.将0改成1
     */
    public int saleOfSpare(int id) {
        Bed bed = mapper.getBedById(id);
        // 出售
        if(bed.getState() == 1) return 0;

        if(bed.getState() == 0) {
            bed.setState(2);
        } else if(bed.getState() == 2) { // 空闲
            bed.setState(0);
        }

        bed.setUserId(-1);
        int i = mapper.updateBed(bed);
        sqlSession.commit();
        return i;
    }

    // 停用
    public int ownToSpare(int id) {
        Bed bed = mapper.getBedById(id);

        if(bed.getState() != 1) return 0;
        // 档位清除记录
        int userId = bed.getUserId();

        // 床位空置
        bed.setUserId(-1);
        bed.setState(0);
        int x = mapper.updateBed(bed);

        sqlSession.commit();
        return x;
    }

    public int distributeUser(Bed bed) {

        int id = bed.getId();
        int userId = bed.getUserId();

        Bed bedById = mapper.getBedById(id);
        Bed bedByUserId = mapper.getBedByUserId(userId);

        if(bedById.getState() != 0 || bedByUserId != null) return 0;

        bedById.setUserId(userId);
        bedById.setState(1);
        int i = mapper.updateBed(bedById);

        sqlSession.commit();
        return i;
    }

    public int agreeApply(Bed bed) {
        int id = bed.getId();
        int userId = bed.getUserId();

        Bed bedById = mapper.getBedById(id);
        Bed bedByUserId = mapper.getBedByUserId(userId);
        // 非出售状态
        if(bedById.getState() != 2 || bedByUserId != null) return 0;

        bedById.setUserId(userId);
        bedById.setState(1);
        int i = mapper.updateBed(bedById);

        sqlSession.commit();
        return i;
    }

    public int changeBed(Bed bed) {
        int id = bed.getId();
        int userId = bed.getUserId();

        Bed newBed = mapper.getBedById(id);
        Bed oldBed = mapper.getBedByUserId(userId);
        // 非出售状态
        if(newBed.getState() != 2 || oldBed == null) return 0;


        newBed.setUserId(userId);
        newBed.setState(1);

        oldBed.setUserId(-1);
        oldBed.setState(0);

        int i = mapper.updateBed(oldBed);
        int j = mapper.updateBed(newBed);

        sqlSession.commit();
        return i*j;
    }
}
