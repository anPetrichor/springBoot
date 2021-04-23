package com.travel.config;

import com.travel.service.UserInfoService;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import javax.annotation.Resource;
//@EnableWebSecurity是Spring Security用于启用Web安全的注解
@EnableWebSecurity
//在web层的controller启用注解机制的安全确认
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SpringSecurity extends WebSecurityConfigurerAdapter {

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private MyAuthenticationSuccessHandler myAuthenticationSuccessHandler;

    @Resource
    private MyAuthenticationFailureHandler myAuthenticationFailureHandler;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //表示任何用户可以访问以"/travel"开头的url资源
        //antMatchers()*元素的顺序很重要!!! 首先需要填写具体的路径规则，然后才是大致匹配的规则。
        http.authorizeRequests().antMatchers("/travel/**").permitAll()
                //表示任何用户可以访问"/login""/login.do"(登录)请求
                .antMatchers("/login").permitAll()
                .antMatchers("/login.do").permitAll()
                //表示任何用户可以访问"/register"下的所有请求(注册账号时进行判断的ajax请求)和"/register.do"(注册)请求
                .antMatchers("/register/**").permitAll()
                .antMatchers("/register.do").permitAll()
                //表示任何用户可以访问"/logout"(退出登录)和"loginManage"(管理员登录)请求
                .antMatchers("/logout").permitAll()
                .antMatchers("/loginManage").permitAll()
                //表示ADMIN权限的用户才可以访问"/manage"(后台)下的请求
                .antMatchers("/manage/**").hasRole("ADMIN")
                //下同
                .antMatchers("/error/**").permitAll()
                .antMatchers("/css/**").permitAll()
                .antMatchers("/images/**").permitAll()
                .antMatchers("/js/**").permitAll()
                .antMatchers("/video/**").permitAll()
                .anyRequest().authenticated();
        //loginPage()自定义登录界面
        http.formLogin().loginPage("/travel")
                //loginProcessingUrl() 提交username和password的URL
                .loginProcessingUrl("/loginManage.do")
                //用户名密码请求字段
                .usernameParameter("username")
                .passwordParameter("password")
                .successHandler(myAuthenticationSuccessHandler)
                .failureHandler(myAuthenticationFailureHandler);
        //logoutUrl退出url
        http.logout().logoutUrl("/logoutManage")
                //invalidate-session 默认为true,用户在退出后Http session失效
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .logoutSuccessUrl("/loginManage");
        //10个用户并发时的session控制
        http.sessionManagement().maximumSessions(10).expiredUrl("/travel");
        //登录成功后会跳转到invalidSessionUrl中指定的路径下
        http.sessionManagement().invalidSessionUrl("/travel");
        //关于跨域访问的安全设置，先禁用
        http.csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userInfoService);
    }

}
