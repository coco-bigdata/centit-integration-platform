package com.centit.framework.ip.app.config;

import com.centit.framework.config.H2Config;
import com.centit.framework.config.RedisConfig;
import com.centit.framework.ip.app.service.impl.IPClientIntegrationEnvironment;
import com.centit.framework.ip.app.service.impl.IPClientPlatformEnvironment;
import com.centit.framework.ip.app.service.impl.IntegrationEnvironmentProxy;
import com.centit.framework.ip.app.service.impl.PlatformEnvironmentProxy;
import com.centit.framework.ip.service.IntegrationEnvironment;
import com.centit.framework.ip.service.impl.JdbcIntegrationEnvironment;
import com.centit.framework.ip.service.impl.JsonIntegrationEnvironment;
import com.centit.framework.listener.InitialWebRuntimeEnvironment;
import com.centit.framework.model.adapter.PlatformEnvironment;
import com.centit.framework.security.model.CentitPasswordEncoder;
import com.centit.framework.security.model.CentitPasswordEncoderImpl;
import com.centit.framework.security.model.CentitSessionRegistry;
import com.centit.framework.security.model.MemorySessionRegistryImpl;
import com.centit.framework.staticsystem.config.SpringSecurityCasConfig;
import com.centit.framework.staticsystem.config.SpringSecurityDaoConfig;
import com.centit.framework.staticsystem.service.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;

import java.util.ArrayList;
import java.util.List;

@Configuration
@PropertySource("classpath:system.properties")
@Import({RedisConfig.class, H2Config.class, SpringSecurityDaoConfig.class, SpringSecurityCasConfig.class})
@EnableAspectJAutoProxy(proxyTargetClass = true)
@Lazy
public class IPAppSystemBeanConfig implements EnvironmentAware {

    @Autowired
    private Environment env;

    @Override
    public void setEnvironment(final Environment environment) {
        this.env = environment;
    }

    @Bean
    public PersistenceExceptionTranslationPostProcessor persistenceExceptionTranslationPostProcessor() {
        return new PersistenceExceptionTranslationPostProcessor();
    }

    @Bean
    public AutowiredAnnotationBeanPostProcessor autowiredAnnotationBeanPostProcessor() {
        return new AutowiredAnnotationBeanPostProcessor();
    }

    @Bean(initMethod = "initialEnvironment")
    @Lazy(value = false)
    public InitialWebRuntimeEnvironment initialEnvironment() {
        return new InitialWebRuntimeEnvironment();
    }

    @Bean
    public CentitPasswordEncoderImpl passwordEncoder() {
        return  new CentitPasswordEncoderImpl();
    }

    @Bean
    @Lazy(value = false)
    public PlatformEnvironment platformEnvironment(
            CentitPasswordEncoder passwordEncoder) {

        Boolean ipEnable = env.getProperty("centit.ip.enable",Boolean.class);// = false
        PlatformEnvironment staticPlatformEnvironment=null;

        Boolean jdbcEnable = env.getProperty("centit.jdbcplatform.enable", Boolean.class);// = false
        if (jdbcEnable != null && jdbcEnable) {
            JdbcPlatformEnvironment jdbcPlatformEnvironment = new JdbcPlatformEnvironment();
            jdbcPlatformEnvironment.setDataBaseConnectInfo(
                 env.getProperty("centit.jdbcplatform.url"),
                    env.getProperty("centit.jdbcplatform.username"),
                    env.getProperty("centit.jdbcplatform.password")
            );
            jdbcPlatformEnvironment.setPasswordEncoder(passwordEncoder);
            jdbcPlatformEnvironment.init();
            if(ipEnable==null || !ipEnable) {
                return jdbcPlatformEnvironment;
            }else {
                staticPlatformEnvironment = jdbcPlatformEnvironment;
            }
        } else{
            JsonPlatformEnvironment jsonPlatformEnvironment = new JsonPlatformEnvironment();
            jsonPlatformEnvironment.setPasswordEncoder(passwordEncoder);
            jsonPlatformEnvironment.init();
            if(ipEnable==null || !ipEnable) {
                return jsonPlatformEnvironment;
            }else {
                staticPlatformEnvironment = jsonPlatformEnvironment;
            }
        }

        IPClientPlatformEnvironment ipPlatformEnvironment = new IPClientPlatformEnvironment();
        ipPlatformEnvironment.setTopOptId(env.getProperty("centit.ip.topoptid"));
        ipPlatformEnvironment.setPlatServerUrl(env.getProperty("centit.ip.home"));
        ipPlatformEnvironment.init();

        List<PlatformEnvironment> evrnMangers = new ArrayList<>();
        evrnMangers.add(ipPlatformEnvironment);
        evrnMangers.add(staticPlatformEnvironment);

        PlatformEnvironmentProxy platformEnvironment = new PlatformEnvironmentProxy();
        platformEnvironment.setEvrnMangers(evrnMangers);

        return platformEnvironment;
    }

    @Bean
    @Lazy(value = false)
    public IntegrationEnvironment integrationEnvironment() {

        Boolean ipEnable = env.getProperty("centit.ip.enable",Boolean.class);// = false

        IntegrationEnvironment staticIntegrationEnvironment=null;

        Boolean jdbcEnable = env.getProperty("centit.jdbcplatform.enable", Boolean.class);// = false
        if (jdbcEnable != null && jdbcEnable) {
            JdbcIntegrationEnvironment jdbcIntegrationEnvironment = new JdbcIntegrationEnvironment();
            jdbcIntegrationEnvironment.setDataBaseConnectInfo(
                    env.getProperty("centit.jdbcplatform.url"),
                    env.getProperty("centit.jdbcplatform.username"),
                    env.getProperty("centit.jdbcplatform.password")
            );
            jdbcIntegrationEnvironment.reloadIPEnvironmen();
            if(ipEnable==null || !ipEnable) {
                return jdbcIntegrationEnvironment;
            }else {
                staticIntegrationEnvironment = jdbcIntegrationEnvironment;
            }
        } else{
            IntegrationEnvironment jsonIntegrationEnvironment = new JsonIntegrationEnvironment();
            jsonIntegrationEnvironment.reloadIPEnvironmen();
            if(ipEnable==null || !ipEnable) {
                return jsonIntegrationEnvironment;
            }else {
                staticIntegrationEnvironment = jsonIntegrationEnvironment;
            }
        }


        IPClientIntegrationEnvironment ipIntegrationEnvironment = new IPClientIntegrationEnvironment();
        ipIntegrationEnvironment.setPlatServerUrl(env.getProperty("centit.ip.home"));
        //ipPlatformEnvironment.init();

        List<IntegrationEnvironment> evrnMangers = new ArrayList<>();
        evrnMangers.add(ipIntegrationEnvironment);
        evrnMangers.add(staticIntegrationEnvironment);

        IntegrationEnvironmentProxy integrationEnvironment = new IntegrationEnvironmentProxy();
        integrationEnvironment.setEvrnMangers(evrnMangers);

        return integrationEnvironment;
    }

    @Bean
    public CentitSessionRegistry centitSessionRegistry(){
        return new MemorySessionRegistryImpl();
    }


    @Bean
    public HttpSessionCsrfTokenRepository csrfTokenRepository() {
        return new HttpSessionCsrfTokenRepository();
    }

}
