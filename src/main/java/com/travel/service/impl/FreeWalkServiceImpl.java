package com.travel.service.impl;

import com.travel.dao.FreeWalkDao;
import com.travel.domain.Route;
import com.travel.service.FreeWalkService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service
public class FreeWalkServiceImpl implements FreeWalkService {

    @Resource
    private FreeWalkDao freeWalkDao;

    //模糊查询用户填写的数据
    @Override
    public List<Route> fuzzyQuery(String month, Integer minPrice, Integer maxPrice, Integer minDay, Integer maxDay, String dest) throws Exception {
        return freeWalkDao.fuzzyQuery(month,minPrice,maxPrice,minDay,maxDay,dest);
    }

}
