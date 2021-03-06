package com.travel.service;

import com.travel.domain.Carousel;
import java.util.List;

public interface CarouselService {

    //网站首页十道背景图
    public abstract List<Carousel> findFiveBackground() throws Exception;

    //后台查询所有网站首页轮播图
    public abstract List<Carousel> findAllCarousel(Integer page, Integer size) throws Exception;

    //根据中文名模糊查询
    public abstract List<Carousel> fuzzyQuery(String chinese) throws Exception;

    //添加新轮播图
    public abstract int addCarousel(Carousel carousel) throws Exception;

    //根据id删除轮播图
    public abstract int deleteCarousel(Integer carouselId) throws Exception;

    //修改轮播图信息
    public abstract int updateCarousel(Carousel carousel) throws Exception;
}
