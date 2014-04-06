/*
 * @(#)SessionUtil.java 2010-12-17下午02:57:09
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package com.kenanai.weixin.web.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.easyframework.core.ConstantsUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.juncsoft.framework.adapter.struts.support.ActionConstants;
import com.juncsoft.framework.util.web.WebUtil;
import com.kenanai.weixin.entity.SUser;

/**
 * Session工具类
 * @modificationHistory.  
 * <ul>
 * <li>sunju 2010-12-17下午02:57:09 TODO</li>
 * </ul> 
 */

public enum SessionUtil {
	ENUM;
	private Logger LOG = LoggerFactory.getLogger(this.getClass());	// 日志
	
	/**
	 * 获得登录后台用户
	 * @author sunju
	 * @creationDate. 2012-5-30 下午03:17:06 
	 * @return 用户信息
	 */
	public SUser getLoginUser() {
		SUser user = (SUser) ServletActionContext.getRequest().getSession().getAttribute(ConstantsUtil.SESSIONID_SYSTEMUSER);
		return user;
	}
	/**
	 * 后台用户登录转向
	 * @author sunju
	 * @creationDate. 2012-5-30 下午03:19:14 
	 * @return 转向地址
	 * @throws Exception 
	 */
	public String userLoginRedirect() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean isAjaxRequest  = WebUtil.isAjaxRequest(request);
		String result = ActionConstants.SYSTEM_NOT_LOGIN;
		if (isAjaxRequest) {// ajax请求
			try {
				WebUtil.write(response, "{\"http_status_code_\":\"" +
						result + "\"}", ConstantsUtil.SYSTEM_DEFAULT_ENCODING);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				LOG.error(e.getMessage());
				throw new Exception(e.getMessage());
			}
		}
		return result;
	}
}
