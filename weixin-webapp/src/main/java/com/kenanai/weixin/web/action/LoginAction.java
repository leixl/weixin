/*
 * @(#)LoginAction.java 2012-5-29下午06:04:52
 * Copyright 2012 JUNCTION, Inc. All rights reserved.
 */
package com.kenanai.weixin.web.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.easyframework.core.ConstantsUtil;

import com.kenanai.weixin.entity.SUser;
import com.kenanai.weixin.service.user.IUserService;
import com.kenanai.weixin.web.util.ValidateCodeUtil;

/**
 * 登录Action
 * 
 * @modificationHistory. <ul>
 *                       <li>sunju 2012-5-29下午06:04:52 TODO</li>
 *                       </ul>
 */
@Namespace("/user/login")
@Results({ @Result(name = "login", type = "freemarker", location = "/WEB-INF/content/system/login.ftl") })
public class LoginAction extends BaseAction {

	/**
	 * serialVersionUID:TODO（用一句话描述这个变量表示什么）
	 * 
	 * @since v 1.1
	 */

	private static final long serialVersionUID = 1L;
	@Resource
	private IUserService userService;
	private SUser user;
	private String validateCode;

	/**
	 * 登录首页
	 * 
	 * @author sunju
	 * @creationDate. 2012-5-29 下午06:15:52
	 * @return
	 * @throws Exception
	 */
	@Action(INDEX)
	public String index() throws Exception {
		System.out.println(123);
		return "login";
	}

	/**
	 * 保存登录
	 * 
	 * @author sunju
	 * @creationDate. 2012-5-29 下午06:16:21
	 * @return
	 * @throws Exception
	 */
	@Action("save")
	public String save() throws Exception {
		// 校验验证码
		if (!ValidateCodeUtil.chekValidateCode(validateCode)) {
			write("invalidCode");
		} else {
			write(userService.saveLogin(user));
		}
		return null;
	}

	/**
	 * 退出
	 * 
	 * @author sunju
	 * @creationDate. 2012-5-29 下午06:22:45
	 * @return
	 * @throws Exception
	 */
	@Action("logout")
	public String logout() throws Exception {
		// 清除session
		session.removeAttribute(ConstantsUtil.SESSIONID_SYSTEMUSER);
		return "login";
	}

	public SUser getUser() {
		return this.user;
	}

	public void setUser(SUser user) {
		this.user = user;
	}

	public String getValidateCode() {
		return this.validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}
}
