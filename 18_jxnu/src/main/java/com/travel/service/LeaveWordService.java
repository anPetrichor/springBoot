package com.travel.service;

import com.travel.domain.LeaveWord;

import java.util.List;

public interface LeaveWordService {

    //后台查询所有留言
    public abstract List<LeaveWord> findAll(Integer page, Integer size) throws Exception;

    //根据id删除留言
    public abstract int deleteLeaaveWord(Integer id) throws Exception;

    //根据传来的留言人和留言文本进行模糊查询
    public abstract List<LeaveWord> fuzzyQuery(Integer leaveWordNameId, String leaveWordTxt) throws Exception;

    //如果没传留言人，就对留言文本进行模糊查询
    public abstract List<LeaveWord> fuzzyQueryByTxt(String leaveWordTxt) throws Exception;
}
