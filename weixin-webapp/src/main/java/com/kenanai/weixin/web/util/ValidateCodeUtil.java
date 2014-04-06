/*
 * @(#)ValidateCodeUtil.java 2011-5-2下午02:09:42
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package com.kenanai.weixin.web.util;

import org.apache.struts2.ServletActionContext;
import org.easyframework.core.ConstantsUtil;

import com.juncsoft.framework.util.text.StringUtils;

/**
 * 验证码工具类
 * @modificationHistory.  
 * <ul>
 * <li>sunju 2011-5-2下午02:09:42 TODO</li>
 * </ul> 
 */

public class ValidateCodeUtil {
	/**
	 * 检测验证码输入是否正确
	 * @author sunju
	 * @creationDate. 2011-5-2 下午02:10:47 
	 * @param validateCode
	 * @return 布尔
	 */
	public static boolean chekValidateCode(String validateCode) {
		if (StringUtils.isEmpty(validateCode)) return false;
		String code = (String)ServletActionContext.getRequest().getSession().getAttribute(ConstantsUtil.SESSIONID_VALIDATECODE);
		return validateCode.equalsIgnoreCase(code);
	}
	/**
	 * 清除验证码
	 * @author sunju
	 * @creationDate. 2011-8-8 下午06:06:56
	 */
	public static void clearValidateCode() {
		ServletActionContext.getRequest().getSession().removeAttribute(ConstantsUtil.SESSIONID_VALIDATECODE);
	}
}
