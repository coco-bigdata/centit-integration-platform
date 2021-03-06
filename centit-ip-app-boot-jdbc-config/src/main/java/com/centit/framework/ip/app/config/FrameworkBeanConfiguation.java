package com.centit.framework.ip.app.config;

import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.centit.framework.core.controller.MvcConfigUtil;
import com.centit.framework.ip.service.IntegrationEnvironment;
import com.centit.framework.ip.service.impl.JdbcIntegrationEnvironment;
import com.centit.framework.model.adapter.PlatformEnvironment;
import com.centit.framework.security.model.CentitPasswordEncoder;
import com.centit.framework.security.model.CentitUserDetailsService;
import com.centit.framework.security.model.StandardPasswordEncoderImpl;
import com.centit.framework.staticsystem.service.impl.JdbcPlatformEnvironment;
import com.centit.framework.staticsystem.service.impl.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;

@EnableConfigurationProperties(FrameworkProperties.class)
@Configuration("frameworkBeanConfiguation")
public class FrameworkBeanConfiguation {

    @Autowired
    private FrameworkProperties frameworkProperties;

    @Bean
    public FastJsonHttpMessageConverter fastJsonHttpMessageConverter(){
        return MvcConfigUtil.fastJsonHttpMessageConverter();
    }

    @Bean({"passwordEncoder"})
    public CentitPasswordEncoder passwordEncoder() {
        return new StandardPasswordEncoderImpl();
    }


    @Bean
    @Lazy(value = false)
    public PlatformEnvironment platformEnvironment(
        @Autowired CentitPasswordEncoder passwordEncoder) {
        JdbcPlatformEnvironment jdbcPlatformEnvironment = new JdbcPlatformEnvironment();

        jdbcPlatformEnvironment.setDataBaseConnectInfo(
            frameworkProperties.getJdbcplatform().getUrl(),
            frameworkProperties.getJdbcplatform().getUsername(),
            frameworkProperties.getJdbcplatform().getPassword());
        jdbcPlatformEnvironment.setPasswordEncoder(passwordEncoder);
        return jdbcPlatformEnvironment;
    }

    @Bean
    @Lazy(value = false)
    public IntegrationEnvironment integrationEnvironment() {

        JdbcIntegrationEnvironment jdbcIntegrationEnvironment = new JdbcIntegrationEnvironment();
        jdbcIntegrationEnvironment.setDataBaseConnectInfo(
            frameworkProperties.getJdbcplatform().getUrl(),
            frameworkProperties.getJdbcplatform().getUsername(),
            frameworkProperties.getJdbcplatform().getPassword());
        jdbcIntegrationEnvironment.reloadIPEnvironmen();

        return jdbcIntegrationEnvironment;
    }

    @Bean
    public CentitUserDetailsService centitUserDetailsService(@Autowired PlatformEnvironment platformEnvironment) {
        UserDetailsServiceImpl userDetailsService = new UserDetailsServiceImpl();
        userDetailsService.setPlatformEnvironment(platformEnvironment);
        return userDetailsService;
    }


}
