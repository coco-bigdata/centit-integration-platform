package com.centit.framework.ip.config;

import com.centit.framework.common.WebOptUtils;
import com.centit.framework.components.CodeRepositoryCache;
import com.centit.framework.components.OperationLogCenter;
import com.centit.framework.model.adapter.MessageSender;
import com.centit.framework.model.adapter.NotificationCenter;
import com.centit.framework.model.adapter.OperationLogWriter;
import com.centit.framework.model.adapter.PlatformEnvironment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

/**
 * Created by codefan on 17-7-6.
 */
public class InstantiationServiceBeanPostProcessor implements ApplicationListener<ContextRefreshedEvent>{

    @Autowired
    protected NotificationCenter notificationCenter;

    @Autowired(required = false)
    private OperationLogWriter optLogManager;

    @Autowired(required = false)
    private MessageSender innerMessageManager;

    @Autowired
    private PlatformEnvironment platformEnvironment;

    @Value("${http.exception.notAsHttpError:false}")
    protected boolean httpExceptionNotAsHttpError;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event)
    {
        CodeRepositoryCache.setPlatformEnvironment(platformEnvironment);
        CodeRepositoryCache.setAllCacheFreshPeriod(CodeRepositoryCache.CACHE_KEEP_FRESH);

        WebOptUtils.setExceptionNotAsHttpError(httpExceptionNotAsHttpError);

        if(innerMessageManager!=null) {
            notificationCenter.registerMessageSender("innerMsg", innerMessageManager);
            notificationCenter.appointDefaultSendType("innerMsg");
        }
        if(optLogManager!=null) {
            OperationLogCenter.registerOperationLogWriter(optLogManager);
        }
    }

}
