package com.travel.service.impl;

import com.travel.dao.RoleDao;
import com.travel.domain.Role;
import com.travel.service.RoleService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleDao roleDao;

    //查找所有角色信息
    @Override
    public List<Role> findAllRole() throws Exception{
        return roleDao.findAllRole();
    }

    //修改角色信息
    @Override
    public int updateRole(Integer roleId, String roleDesc) throws Exception {
        return roleDao.updateRole(roleId,roleDesc);
    }

}
