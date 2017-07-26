package com.centit.framework.ip.service;



import com.centit.framework.ip.po.DatabaseInfo;
import com.centit.framework.ip.po.OsInfo;

import java.util.List;

public interface IntegrationEnvironment {

	/**
	 * 刷新集成环境相关信息
	 * 包括：业务系统、数据库信息
	 * @return  boolean 刷新集成环境相关信息
	 */
	boolean reloadIPEnvironmen();
	
	/**
	 * 获取框架中注册的业务系统
	 * @param osId osId
	 * @return 框架中注册的业务系统
	 */
	OsInfo getOsInfo(String osId);
	/**
	 * 获取框架中注册的数据库
	 * @param databaseCode databaseCode
	 * @return 框架中注册的数据库
	 */
	DatabaseInfo getDatabaseInfo(String databaseCode);
	/**
	 * 获取所有注册的业务系统
	 * @return 所有注册的业务系统
	 */
	List<OsInfo> listOsInfos();
	/**
	 * 获取所有注册的数据库
	 * @return 所有注册的数据库
	 */
	List<DatabaseInfo> listDatabaseInfo();
	/**
	 * 检验用户的 访问 令牌合法性
	 * @param tokenId	 tokenId
	 * @param accessKey accessKey
	 * @return 合法返回对应的用户，不合法返回null
	 */
	String checkAccessToken(String tokenId, String accessKey);
}
