package com.travel.config;

import com.travel.domain.UserInfo;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Aspect
@Component
public class LoginAOP {

    private Logger logger = LoggerFactory.getLogger(getClass());

    //执行用户功能先进入登录切入点
    @Pointcut("execution(* com.travel.controller.UserDoController.*(..))")
    public void loginPoint(){

    }

    @Around("loginPoint()")
    public Object doBefore(ProceedingJoinPoint joinPoint) throws Throwable {
        logger.debug("登录环绕通知");
        //1.拿到request请求
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        //2.获取session
        HttpSession session = request.getSession();
        //3.获取userInfo信息
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        //4.判断是否登录
        if (userInfo == null){
            //如果 requestedWith 为 XMLHttpRequest 则为 Ajax 请求
            String requestType = request.getHeader("X-Requested-With");
            if ("XMLHttpRequest".equals(requestType)){
                logger.debug("ajax请求");
                //返回ajax数据
                String loginResult = "{\"loginResult\":\"false\"}";
                return loginResult;
            }else {
                logger.debug("非ajax请求");
                return "redirect:/login";
            }
        }else {
            //已登录 可执行目标方法
            Object proceed = joinPoint.proceed();
            return proceed;
        }
    }

}
