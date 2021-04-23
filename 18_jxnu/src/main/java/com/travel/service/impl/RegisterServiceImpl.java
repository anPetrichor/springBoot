package com.travel.service.impl;

import com.travel.dao.RegisterDao;
import com.travel.domain.UserInfo;
import com.travel.service.RegisterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Resource
    private RegisterDao registerDao;

    //用户注册
    @Override
    public int register(UserInfo userInfo) throws Exception {
        return registerDao.register(userInfo);
    }

    //注册时判断用户名是否已被使用过
    @Override
    public int findUsernameIsUsed(String username) throws Exception {
        return registerDao.findUsernameIsUsed(username);
    }

    //注册时判断电话号码是否被使用过
    @Override
    public int findPhoneNumIsUsed(String phoneNum) throws Exception {
        return registerDao.findPhoneNumIsUsed(phoneNum);
    }


}
