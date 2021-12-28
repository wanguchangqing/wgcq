package com.wgcq.dao;

import com.wgcq.beans.OldmanFilePlus;
import com.wgcq.beans.WorkerFilePlus;

import java.util.List;

public interface WorkerFilePlusMapper {
    List<WorkerFilePlus> getFileList();

    WorkerFilePlus getFileById(int id);
}
