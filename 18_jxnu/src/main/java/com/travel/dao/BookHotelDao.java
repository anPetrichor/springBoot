package com.travel.dao;

import com.travel.domain.BookHotel;
import com.travel.domain.Hotel;
import com.travel.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BookHotelDao {

    //后台查询所有酒店订单
    @Select("select * from bookhotel")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "num",column = "num"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "hotelId",column = "hotelId"),
            @Result(property = "liveTime",column = "liveTime"),
            @Result(property = "leaveTime",column = "leaveTime"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "price",column = "price"),
            @Result(property = "status",column = "status"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.travel.dao.UserInfoDao.findByUserId")),
            @Result(property = "hotel",column = "hotelId",javaType = Hotel.class,one = @One(select = "com.travel.dao.HotelDao.findByHotelId"))
    })
    public abstract List<BookHotel> findAllBookHotel() throws Exception;

    //根据订单编号查询订单
    @Select("select * from bookhotel where num like concat(concat('%',#{bookHotelNum},'%')) ")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "num",column = "num"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "hotelId",column = "hotelId"),
            @Result(property = "liveTime",column = "liveTime"),
            @Result(property = "leaveTime",column = "leaveTime"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "price",column = "price"),
            @Result(property = "status",column = "status"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.travel.dao.UserInfoDao.findByUserId")),
            @Result(property = "hotel",column = "hotelId",javaType = Hotel.class,one = @One(select = "com.travel.dao.HotelDao.findByHotelId"))
    })
    public abstract List<BookHotel> fuzzyQuery(String bookHotelNum) throws Exception;
}
