package com.wgcq.dao;

import com.wgcq.beans.OldmanFilePlus;

import java.util.List;

public interface OldmanFilePlusMapper {
    List<OldmanFilePlus> getFileList();

    OldmanFilePlus getFileById(int id);

    OldmanFilePlus getFileByUserId(int userId);
}
