package com.wgcq.dao;

import com.wgcq.beans.Role;
import com.wgcq.beans.User;

import java.util.List;

public interface RoleMapper {

    List<Role> getRoleList();

    int addRole(Role role);

    int updateRole(Role role);

    int deleteRole(int id);
}
