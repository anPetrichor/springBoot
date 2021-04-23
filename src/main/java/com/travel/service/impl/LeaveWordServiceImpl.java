package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.travel.dao.LeaveWordDao;
import com.travel.domain.LeaveWord;
import com.travel.service.LeaveWordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LeaveWordServiceImpl implements LeaveWordService {

    @Resource
    private LeaveWordDao leaveWordDao;

    //后台查询所有留言
    @Override
    public List<LeaveWord> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return leaveWordDao.findAll();
    }

    //根据id删除留言
    @Override
    public int deleteLeaaveWord(Integer id) throws Exception {
        return leaveWordDao.deleteLeaaveWord(id);
    }

    //根据传来的留言人和留言文本进行模糊查询
    @Override
    public List<LeaveWord> fuzzyQuery(Integer leaveWordNameId, String leaveWordTxt) throws Exception {
        return leaveWordDao.fuzzyQuery(leaveWordNameId,leaveWordTxt);
    }

    //如果没传留言人，就对留言文本进行模糊查询
    @Override
    public List<LeaveWord> fuzzyQueryByTxt(String leaveWordTxt) throws Exception {
        return leaveWordDao.fuzzyQueryByTxt(leaveWordTxt);
    }

}
