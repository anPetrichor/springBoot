package com.travel.dao;

import com.travel.domain.RoutePhoto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RoutePhotoDao {

    //根据旅游路线id查询对应图片资源
    @Select("select * from rp where rid = #{rid}")
    public abstract List<RoutePhoto> findRoutePhotoByRId(int rid);

}
