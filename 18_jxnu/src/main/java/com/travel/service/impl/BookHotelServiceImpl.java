package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.travel.dao.BookHotelDao;
import com.travel.domain.BookHotel;
import com.travel.service.BookHotelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BookHotelServiceImpl implements BookHotelService {

    @Resource
    private BookHotelDao bookHotelDao;

    //后台查询所有酒店订单
    @Override
    public List<BookHotel> findAllBookHotel(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return bookHotelDao.findAllBookHotel();
    }

    //根据订单编号查询订单
    @Override
    public List<BookHotel> fuzzyQuery(String bookHotelNum) throws Exception {
        return bookHotelDao.fuzzyQuery(bookHotelNum);
    }

}
