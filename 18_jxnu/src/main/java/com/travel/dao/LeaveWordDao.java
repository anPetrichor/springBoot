package com.travel.dao;

import com.travel.domain.LeaveWord;
import com.travel.domain.Route;
import com.travel.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface LeaveWordDao {

    @Select("select * from leaveword")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "routeId",column = "routeId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "txt",column = "txt"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "route",column = "routeId",javaType = Route.class,one = @One(select = "com.travel.dao.RouteDao.findRouteById")),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.travel.dao.UserInfoDao.findByUserId"))
    })
    public abstract List<LeaveWord> findAll() throws Exception;

    //根据id删除留言
    @Delete("delete from leaveword where id=#{id}")
    public abstract int deleteLeaaveWord(Integer id) throws Exception;

    //根据传来的留言人和留言文本进行模糊查询
    @Select("select * from leaveword where userId=#{leaveWordNameId} and txt like concat(concat('%',#{leaveWordTxt},'%'))")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "routeId",column = "routeId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "txt",column = "txt"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "route",column = "routeId",javaType = Route.class,one = @One(select = "com.travel.dao.RouteDao.findRouteById")),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.travel.dao.UserInfoDao.findByUserId"))
    })
    public abstract List<LeaveWord> fuzzyQuery(@Param("leaveWordNameId") Integer leaveWordNameId, @Param("leaveWordTxt") String leaveWordTxt) throws Exception;

    //如果没传留言人，就对留言文本进行模糊查询
    @Select("select * from leaveword where txt like concat(concat('%',#{leaveWordTxt},'%'))")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "routeId",column = "routeId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "txt",column = "txt"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "route",column = "routeId",javaType = Route.class,one = @One(select = "com.travel.dao.RouteDao.findRouteById")),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.travel.dao.UserInfoDao.findByUserId"))
    })
    public abstract List<LeaveWord> fuzzyQueryByTxt(String leaveWordTxt) throws Exception;
}
