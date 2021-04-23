package com.travel.service;

import com.travel.domain.UserInfo;

public interface RegisterService {

    //用户注册
    public abstract int register(UserInfo userInfo) throws Exception;

    //注册时判断用户名是否已被使用过
    public abstract int findUsernameIsUsed(String username) throws Exception;

    //注册时判断电话号码是否被使用过
    public abstract int findPhoneNumIsUsed(String phoneNum) throws Exception;

}
