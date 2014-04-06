/*
 * @(#)CommonUtil.java 2011-11-28下午03:51:14
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package org.easyframework.core;

/**
 * 操作工具类
 * @modificationHistory.  
 * <ul>
 * <li>sunju 2011-11-28下午03:51:14 TODO</li>
 * </ul> 
 */

public class OperateUtil {
	/**
	 * 是否会员操作
	 * @author sunju
	 * @creationDate. 2011-11-28 下午05:29:58 
	 * @param requestURI 请求URI
	 * @return 布尔
	 */
	public static boolean isMemberOperate(String requestURI) {
		return requestURI.matches("(?:[^>]*)/member/+(?:[^>]*)");
	}
	/**
	 * 是否后台操作
	 * @author sunju
	 * @creationDate. 2011-11-28 下午05:29:58 
	 * @param requestURI 请求URI
	 * @return 布尔
	 */
	public static boolean isSystemOperate(String requestURI) {
		return requestURI.matches("(?:[^>]*)/system/+(?:[^>]*)");
	}
}