package com.travel.service;

import com.travel.domain.Route;

import java.util.List;

public interface FreeWalkService {

    //模糊查询用户填写的数据
    public abstract List<Route> fuzzyQuery(String month, Integer minPrice, Integer maxPrice, Integer minDay, Integer maxDay, String dest) throws Exception;

}
