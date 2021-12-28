package com.wgcq.dao;

import com.wgcq.beans.File;
import com.wgcq.beans.Role;


import java.util.List;

public interface FileMapper {
    List<File> getOldmanFileList();

    List<File> getWorkerFileList();

    File getFileById(int id);

    File getFileByUserId(int userId);

    int addFile(File file);

    int updateFile(File file);

    int deleteFile(int id);

}
