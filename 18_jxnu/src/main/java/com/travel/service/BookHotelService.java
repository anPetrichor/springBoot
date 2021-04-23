package com.travel.service;

import com.travel.domain.BookHotel;
import java.util.List;

public interface BookHotelService {

    //后台查询所有酒店订单
    public abstract List<BookHotel> findAllBookHotel(Integer page, Integer size) throws Exception;

    //根据订单编号查询订单
    public abstract List<BookHotel> fuzzyQuery(String bookHotelNum) throws Exception;
}
