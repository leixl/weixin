/*
 * @(#)AuthInterceptor.java 2010-8-24下午11:21:28
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package com.kenanai.weixin.web.interceptor;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;
import org.easyframework.core.ConstantsUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.juncsoft.framework.adapter.struts.support.ActionConstants;
import com.juncsoft.framework.exception.SystemException;
import com.juncsoft.framework.util.file.PropertiesOperateUtil;
import com.juncsoft.framework.util.text.StringUtils;
import com.juncsoft.framework.util.web.WebUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 基本拦截器
 * 
 * @modificationHistory. <ul>
 *                       <li>sunju 2010-8-24下午11:21:28 TODO</li>
 *                       </ul>
 */
@SuppressWarnings("unused")
public class BaseInterceptor extends AbstractInterceptor {
	/**
	 * serialVersionUID:TODO（用一句话描述这个变量表示什么）
	 * 
	 * @since v 1.1
	 */

	private static final long serialVersionUID = 1L;
	private Logger LOG = LoggerFactory.getLogger(this.getClass()); // 日志

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.opensymphony.xwork2.interceptor.AbstractInterceptor#intercept(com
	 * .opensymphony.xwork2.ActionInvocation)
	 */
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		ActionContext actioncontext = invocation.getInvocationContext();

		HttpServletRequest request = (HttpServletRequest) actioncontext
				.get(StrutsStatics.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) actioncontext
				.get(StrutsStatics.HTTP_RESPONSE);
		// 注入工程路径为path
		ServletContext sc = (ServletContext) actioncontext
				.get(ServletActionContext.SERVLET_CONTEXT);
		String path = sc.getRealPath("/");
		request.setAttribute("base", path);
		String result = null;
		boolean isAjaxRequest = WebUtil.isAjaxRequest(request);
		try {
			String requestURI = request.getRequestURI();
			// ------------------------------------请求通过------------------------------------------
			result = invocation.invoke();
		} catch (Exception e) {// 异常处理
			LOG.error(e.getMessage(), e);
			if (!isAjaxRequest) {// 普通请求
				throw new SystemException(e);
			} else {// ajax请求
				WebUtil.write(response, "{\"http_status_code_\":\""
						+ ActionConstants.EXCEPTION + "\"}",
						ConstantsUtil.SYSTEM_DEFAULT_ENCODING);
				return null;
			}
		}
		return result;
	}

	/**
	 * 权限拦截
	 * 
	 * @author sunju
	 * @creationDate. 2011-10-4 上午10:52:27
	 * @param permissionsCode
	 *            权限代码
	 * @param code
	 *            当前访问的代码
	 * @return 结果
	 * @throws Exception
	 */
	public boolean permIntercept(String permissionsCode, String code)
			throws Exception {
		boolean bool = true;
		if (StringUtils.isEmpty(permissionsCode)) {// 没有任何权限
			bool = false;
		} else {
			StringBuilder codes = new StringBuilder(",")
					.append(permissionsCode).append(",");
			String indCode = new StringBuilder(",").append(code).append(",")
					.toString();
			if (codes.indexOf(indCode) == -1) {
				bool = false;
			}
		}
		return bool;
	}

	/**
	 * 会员审核不通过转向
	 * 
	 * @author sunju
	 * @creationDate. 2011-11-28 上午11:04:34
	 * @param request
	 *            请求
	 * @param response
	 *            响应
	 * @return 跳转
	 * @throws Exception
	 */
	private String memberNoPassRedirect(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String result = ActionConstants.MEMBER_NO_PASS;
		if (request.getHeader("x-requested-with") == null) {
			return result;
		} else {
			WebUtil.write(response, "{\"http_status_code_\":\"" + result
					+ "\"}", ConstantsUtil.SYSTEM_DEFAULT_ENCODING);
			return null;
		}
	}

	/**
	 * 无权限转向
	 * 
	 * @author sunju
	 * @creationDate. 2011-10-4 上午10:53:07
	 * @param request
	 *            请求
	 * @param response
	 *            响应
	 * @return 跳转
	 * @throws Exception
	 */
	private String noPermRedirect(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String result = ActionConstants.NO_PERM;
		if (request.getHeader("x-requested-with") == null) {
			return result;
		} else {
			WebUtil.write(response, "{\"http_status_code_\":\"" + result
					+ "\"}", ConstantsUtil.SYSTEM_DEFAULT_ENCODING);
			return null;
		}
	}

	/**
	 * 会员无权限转向
	 * 
	 * @author sunju
	 * @creationDate. 2011-10-25 下午03:34:43
	 * @param request
	 *            请求
	 * @param response
	 *            响应
	 * @return 跳转
	 * @throws Exception
	 */
	private String memberNoPermRedirect(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String result = ActionConstants.MEMBER_NO_PERM;
		if (request.getHeader("x-requested-with") == null) {
			return result;
		} else {
			WebUtil.write(response, "{\"http_status_code_\":\"" + result
					+ "\"}", ConstantsUtil.SYSTEM_DEFAULT_ENCODING);
			return null;
		}
	}

	public static void main(String[] args) {
		String str = "http://club.dress3.com/bbs/topic/listPlate.shtml";
		String aliasdomain = PropertiesOperateUtil.GetConfig("config",
				"aliasdomain");
		System.out.println(aliasdomain);
		System.out.println(str.matches("(?:[^>]*)\\." + aliasdomain
				+ "+(?:[^>]*)"));
		System.out.println(str.matches("(?:[^>]*)\\.dress3\\.com+(?:[^>]*)"));
	}
}