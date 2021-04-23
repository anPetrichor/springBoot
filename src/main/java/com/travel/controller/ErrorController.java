package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {

    @RequestMapping("/400")
    public String BAD_REQUEST(){
        return "error/400";
    }

    @RequestMapping("/403")
    public String forbidden(){
        return "error/403";
    }

    @RequestMapping("/404")
    public String not_found(){
        return "error/404";
    }

    @RequestMapping("/405")
    public String METHOD_NOT_ALLOWED(){
        return "error/405";
    }

    @RequestMapping("/500")
    public String internal_server_error(){
        return "error/500";
    }

}
