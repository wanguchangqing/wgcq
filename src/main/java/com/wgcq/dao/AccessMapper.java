package com.wgcq.dao;

import com.wgcq.beans.Access;
import com.wgcq.beans.Bed;

import java.util.List;

public interface AccessMapper {
    List<Access> getAccessList();

    int addAccess(Access access);

    int updateAccess(Access access);

    int deleteAccess(int id);
}
