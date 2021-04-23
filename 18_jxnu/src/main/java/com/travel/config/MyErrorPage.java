package com.travel.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.ErrorPageRegistrar;
import org.springframework.boot.web.server.ErrorPageRegistry;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

//实现ErrorPageRegistrar来注册不同错误类型显示不同的网页
@Configuration
public class MyErrorPage implements ErrorPageRegistrar {

    @Override
    public void registerErrorPages(ErrorPageRegistry registry) {
        //400: 客户端请求的语法错误
        ErrorPage errorPage_400 = new ErrorPage(HttpStatus.BAD_REQUEST,"/error/400");
        //403: 服务器理解请求客户端的请求，但是拒绝执行此请求
        ErrorPage errorPage_403 = new ErrorPage(HttpStatus.FORBIDDEN,"/error/403");
        //404: 服务器无法根据客户端的请求找到资源
        ErrorPage errorPage_404 = new ErrorPage(HttpStatus.NOT_FOUND,"/error/404");
        //405: 客户端请求中的方法被禁止
        ErrorPage errorPage_405 = new ErrorPage(HttpStatus.METHOD_NOT_ALLOWED,"/error/405");
        //500: 服务器内部错误，无法完成请求
        ErrorPage errorPage_500 = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR,"/error/500");

        registry.addErrorPages(errorPage_400,errorPage_403,errorPage_404,errorPage_405,errorPage_500);

    }

}
