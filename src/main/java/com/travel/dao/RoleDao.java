package com.travel.dao;


import com.travel.domain.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface RoleDao {

    //根据用户id查询角色列表
    @Select("select * from role where id in(select roleId from user_role where userId=#{userId})")
    public List<Role> findRoleByUserId(Integer userId) throws Exception;

    //查询所用用户角色
    @Select("select * from role")
    public List<Role> findAllRole() throws Exception;

    //修改角色信息
    @Update("update role set roleDesc=#{roleDesc} where id=#{roleId}")
    public abstract int updateRole(@Param("roleId") Integer roleId, @Param("roleDesc") String roleDesc) throws Exception;

}
