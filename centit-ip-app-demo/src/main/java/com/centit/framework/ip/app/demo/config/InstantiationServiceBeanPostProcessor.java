package com.centit.framework.ip.app.demo.config;

import com.centit.framework.components.CodeRepositoryCache;
import com.centit.framework.components.OperationLogCenter;
import com.centit.framework.model.adapter.NotificationCenter;
import com.centit.framework.model.adapter.OperationLogWriter;
import com.centit.framework.model.adapter.PlatformEnvironment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

/**
 * Created by codefan on 17-7-6.
 */
public class InstantiationServiceBeanPostProcessor implements ApplicationListener<ContextRefreshedEvent>
{

    @Autowired
    protected NotificationCenter notificationCenter;

    @Autowired
    private OperationLogWriter optLogManager;

    @Autowired
    private PlatformEnvironment platformEnvironment;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event)
    {
        CodeRepositoryCache.setPlatformEnvironment(platformEnvironment);

        if(optLogManager!=null) {
            OperationLogCenter.registerOperationLogWriter(optLogManager);
        }
    }

}
