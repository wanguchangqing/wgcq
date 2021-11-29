package com.wgcq.dao;

import com.wgcq.beans.Bed;
import com.wgcq.beans.File;

import java.util.List;

public interface BedMapper {
    List<Bed> getBedList();

    int addBed(Bed bed);

    int updateBed(Bed bed);

    int deleteBed(int id);
}
