package com.travel.dao;

import com.travel.domain.Carousel;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CarouselDao {

    //网站首页五道背景图
    @Select("select * from carousel order by createTime desc limit 0,5")
    public abstract List<Carousel> findFiveBackground() throws Exception;

    //后台查询所有网站首页轮播图
    @Select("select * from carousel order by createTime desc")
    public abstract List<Carousel> findAllCarousel() throws Exception;

    //根据中文名模糊查询
    @Select("select * from carousel where chinese like concat(concat('%',#{chinese},'%'))")
    public abstract List<Carousel> fuzzyQuery(String chinese) throws Exception;

    //添加新轮播图
    @Insert("insert into carousel(chinese,english,createTime,carDesc,url) values(#{chinese},#{english},#{createTime},#{carDesc},#{url})")
    public abstract int addCarousel(Carousel carousel) throws Exception;

    //根据id删除轮播图
    @Delete("delete from carousel where id=#{carouselId}")
    public abstract int deleteCarousel(Integer carouselId) throws Exception;

    //修改轮播图信息
    @Update("<script> update carousel set chinese=#{chinese},english=#{english},carDesc=#{carDesc}<if test='url != null'>,url=#{url}</if> where id=#{id} </script>")
    public abstract int updateCarousel(Carousel carousel) throws Exception;
}
