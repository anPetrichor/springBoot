package com.travel.service;

import com.travel.domain.Orders;
import java.util.List;

public interface OrderService {

    //查询所有订单
    public abstract List<Orders> findAll(Integer page, Integer size) throws Exception;

    //根据用户id查询用户订单详情
    public abstract List<Orders> findOrdersByUserId(Integer userId) throws Exception;

    //根据传过来的订单编号来进行模糊查询
    public abstract List<Orders> fuzzyQuery(String orderNum) throws Exception;

    //查询刚刚创建的订单
    public abstract Orders findOrderById(Integer id) throws Exception;
}
