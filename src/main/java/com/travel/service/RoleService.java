package com.travel.service;

import com.travel.domain.Role;

import java.util.List;

public interface RoleService {

    //查询所有用户角色
    public abstract List<Role> findAllRole() throws Exception;

    //修改角色
    public abstract int updateRole(Integer roleId, String roleDesc) throws Exception;


}
