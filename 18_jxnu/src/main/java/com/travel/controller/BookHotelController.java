package com.travel.controller;

import com.github.pagehelper.PageInfo;
import com.travel.domain.BookHotel;
import com.travel.service.BookHotelService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class BookHotelController {

    @Resource
    private BookHotelService bookHotelService;

    //后台查询所有酒店订单
    @RequestMapping(value = "/manage/bookhotel/findAllBookHotel",method = RequestMethod.GET)
    public String findAllBookHotel(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                                   @RequestParam(value = "size",required = false,defaultValue = "10") Integer size,
                                   Model model) throws Exception{
        List<BookHotel> bookHotels = bookHotelService.findAllBookHotel(page,size);
        PageInfo pageInfo = new PageInfo(bookHotels);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/hotelbook_list";
    }

    //根据订单编号查询订单
    @RequestMapping(value = "/manage/bookhotel/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam("bookHotelNum") String bookHotelNum,Model model) throws Exception{
        List<BookHotel> bookHotels = bookHotelService.fuzzyQuery(bookHotelNum);
        model.addAttribute("bookHotels",bookHotels);
        return "admin/hotelbook_list";
    }

}
