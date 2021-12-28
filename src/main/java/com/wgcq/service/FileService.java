package com.wgcq.service;

import com.wgcq.beans.File;
import com.wgcq.beans.OldmanFilePlus;
import com.wgcq.beans.WorkerFilePlus;
import com.wgcq.dao.FileMapper;
import com.wgcq.dao.OldmanFilePlusMapper;
import com.wgcq.dao.UserMapper;
import com.wgcq.dao.WorkerFilePlusMapper;
import com.wgcq.util.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class FileService {

    private SqlSession sqlSession;
    private FileMapper mapper ;
    private OldmanFilePlusMapper oldmanFilePlusMapper;
    private WorkerFilePlusMapper workerFilePlusMapper;

    public FileService(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
        this.mapper = sqlSession.getMapper(FileMapper.class);
        this.oldmanFilePlusMapper = sqlSession.getMapper(OldmanFilePlusMapper.class);
        this.workerFilePlusMapper = sqlSession.getMapper(WorkerFilePlusMapper.class);
    }

    public File getFileById(int id) {
        return mapper.getFileById(id);
    }

    public int addFile(File file) {
        int i = mapper.addFile(file);
        sqlSession.commit();
        return i;
    }

    public int updateFile(File file) {
        int i = mapper.updateFile(file);
        sqlSession.commit();
        return i;
    }

    public int deleteFile(int id) {
        int i = mapper.deleteFile(id);
        sqlSession.commit();
        return i;
    }

    public List<OldmanFilePlus> getOldmanFilePlusList() {
        return oldmanFilePlusMapper.getFileList();
    }

    public OldmanFilePlus getOldmanFilePlusById(int id) {
        return oldmanFilePlusMapper.getFileById(id);
    }

    public List<WorkerFilePlus> getWorkerFilePlusList() {
        return workerFilePlusMapper.getFileList();
    }

    public WorkerFilePlus getWorkerFilePlusById(int id) {
        return workerFilePlusMapper.getFileById(id);
    }

    public OldmanFilePlus getOldmanFilePlusByUserId(int userId) {
        return oldmanFilePlusMapper.getFileByUserId(userId);
    }
}
