package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.travel.dao.CarouselDao;
import com.travel.domain.Carousel;
import com.travel.service.CarouselService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CarouselServiceImpl implements CarouselService {

    @Resource
    private CarouselDao carouselDao;

    //网站首页十道背景图
    @Override
    public List<Carousel> findFiveBackground() throws Exception {
        return carouselDao.findFiveBackground();
    }

    //后台查询所有网站首页轮播图
    @Override
    public List<Carousel> findAllCarousel(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return carouselDao.findAllCarousel();
    }

    //根据中文名模糊查询
    @Override
    public List<Carousel> fuzzyQuery(String chinese) throws Exception {
        return carouselDao.fuzzyQuery(chinese);
    }

    //添加新轮播图
    @Override
    public int addCarousel(Carousel carousel) throws Exception {
        return carouselDao.addCarousel(carousel);
    }

    //根据id删除轮播图
    @Override
    public int deleteCarousel(Integer carouselId) throws Exception {
        return carouselDao.deleteCarousel(carouselId);
    }

    //修改轮播图信息
    @Override
    public int updateCarousel(Carousel carousel) throws Exception {
        return carouselDao.updateCarousel(carousel);
    }

}
