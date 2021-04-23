package com.travel.config;

import com.travel.domain.UserInfo;
import com.travel.service.UserInfoService;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//登录成功后的处理逻辑
@Component
public class MyAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Resource
    private UserInfoService userInfoService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        //authentication认证访问者
        UserInfo userInfo = userInfoService.findByUsername(authentication.getName());
        //获取Session,Session的作用就是在服务端存储用户和服务器会话的一些信息
        //判断用户是否登录
        httpServletRequest.getSession().setAttribute("ADMINSESSION",userInfo);
        new DefaultRedirectStrategy().sendRedirect(httpServletRequest,httpServletResponse,"/manage");
    }

}
