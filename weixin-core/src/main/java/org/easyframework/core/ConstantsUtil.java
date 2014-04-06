/*
 * @(#)ConstantsUtil.java 2010-8-24下午11:27:10
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package org.easyframework.core;

/**
 * 常量工具类
 * @modificationHistory.  
 * <ul>
 * <li>sunju 2010-8-24下午11:27:10 TODO</li>
 * </ul>
 */

public class ConstantsUtil {
	// session
	/**
	 * 验证码sessionId
	 */
	public static final String SESSIONID_VALIDATECODE = "validateCode";
	/**
	 * 最多存活1小时
	 */
	public static final int SESSION_MAXAGE = 3600000;
	/**
	 * 系统用户sessionId
	 */
	public static final String SESSIONID_SYSTEMUSER = "systemUser";
	/**
	 * 用户登录跳转地址,用于请求动作需要登录，登录完毕返回原页面。
	 */
	public static final String SESSIONID_SYSTEMUSER_LOGIN_REDIRECTURL = "systemUser_login_redirectURL";
	
	// 配置
	/**
	 * spring配置文件
	 */
	public static final String CONTEXT_CONFIGXML = "applicationContext.xml";
	/**
	 * 默认字符编码集
	 */
	public static final String SYSTEM_DEFAULT_ENCODING = "utf-8";
	
	// 上传状态
	/**
	 * 超出空间配额
	 */
	public static final String UPLOAD_STATUS_OVERSPACE = "overspace";
	/**
	 * 超出数量限制
	 */
	public static final String UPLOAD_STATUS_OVERLIMIT = "overLimit";
	
	// 有效性
	/**
	 * 无效
	 */
	public static final short VALIDATE_NO = 0;
	/**
	 * 有效
	 */
	public static final short VALIDATE_YES = 1;
	
	// 性别
	/**
	 * 男
	 */
	public static final short SEX_MAN = 0;
	/**
	 * 女
	 */
	public static final short SEX_WOMAN = 1;
}
