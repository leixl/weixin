/*
 * @(#)BaseAction.java 2010-8-24下午11:15:00
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package com.kenanai.weixin.web.action;
import java.io.IOException;

import javax.servlet.RequestDispatcher;

import org.easyframework.core.ConstantsUtil;
import org.easyframework.core.OperateUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.juncsoft.framework.adapter.struts.support.BaseActionSupport;
import com.juncsoft.framework.pojo.Pager;
import com.juncsoft.framework.util.charset.CharsetUtil;
import com.juncsoft.framework.util.cipher.CipherUtil;
import com.juncsoft.framework.util.text.StringUtils;
import com.juncsoft.framework.util.web.PagerUtil;
import com.juncsoft.framework.util.web.WebUtil;
/**
 * 基类Action
 * @modificationHistory.  
 * <ul>
 * <li>sunju 2010-8-24下午11:15:00 TODO</li>
 * </ul> 
 */
@Controller
@Scope("prototype")
public class BaseAction extends BaseActionSupport {
	/**
	 * serialVersionUID:TODO（用一句话描述这个变量表示什么）
	 *
	 * @since v 1.1
	 */
	private static final long serialVersionUID = 1L;
	protected Pager pager;								// 分页条
	protected int page = 1;								// 当前页
	protected int pageSize = 10;						// 每页显示记录数
	protected String pageSEOPrefix = "p";				// SEO分页前缀，默认带p标识页码：p2、p3...
	protected String pageSEOExt = "/";					// SEO页码扩展，如shtml、html，默认为/
	protected String url;								// 分页的requestURL
	protected String roleKey;							// 角色key
	protected boolean reloadDialog;						// 刷新窗口
	
	/**
	 * 获得访问的请求的绝对地址(包含参数)
	 * @author sunju
	 * @creationDate. 2010-8-17 下午08:00:31 
	 * @return 访问的请求的绝对地址(包含参数)
	 */
	protected String getRequestURL() {
		return WebUtil.getRequestURL(request);
	}
	/**
	 * 向客户端输出
	 * @author sunju
	 * @creationDate. 2010-9-18 上午12:19:16 
	 * @param obj object对象
	 * @throws IOException 
	 */
	protected void write(Object obj) throws IOException {
		WebUtil.write(response, obj, ConstantsUtil.SYSTEM_DEFAULT_ENCODING);
	}
	/**
	 * 是否后台操作
	 * @author sunju
	 * @creationDate. 2011-7-5 下午01:06:14 
	 * @return 布尔
	 */
	public boolean isSystemOperate() {
		return OperateUtil.isSystemOperate(path);
	}
	// --------------------------------分页设置相关参数[动态获得]--------------------------------------------------
	/**
	 * 是否为SEO分页视图
	 * @author sunju
	 * @creationDate. 2011-6-28 下午07:33:27 
	 * @return 布尔
	 */
	public boolean isPageSEOView() {
		return (StringUtils.isNotEmpty(request.getParameter("path"))) ? true : false;
	}
	/**
	 * 是否为搜索分页视图
	 * @author sunju
	 * @creationDate. 2011-6-28 下午07:33:45 
	 * @return 布尔
	 */
	public boolean isPageSearchView() {
		return path.endsWith("/search");
	}
	/**
	 * 获得分页的URL
	 * @author sunju
	 * @creationDate. 2011-6-28 下午07:13:41 
	 * @return URL
	 */
	public String getPagerUrl() {
		if (pager == null) return "";
		String pagerUrl = PagerUtil.getFullURL(page, pageSize, path, pager.getParam(), isPageSEOView(), isPageSearchView(), pageSEOPrefix, pageSEOExt, false);
		return CipherUtil.encrypt(pagerUrl);
	}
	/**
	 * 会员操作认证拦截
	 * @author sunju
	 * @creationDate. 2011-10-28 下午02:52:43 
	 * @param userId 用户id
	 * @throws Exception
	 * @return 认证结果
	 */
	public boolean memberAuthIntercept(Integer userId) throws Exception {
		boolean bool = true;
		Integer loginUserId = 0; // 获得登录会员的用户id
		if (userId == null || !loginUserId.equals(userId)) {
			boolean isAjaxRequest  = WebUtil.isAjaxRequest(request);
			if (isAjaxRequest) {// ajax请求
				bool = false;
				write("{\"http_status_code_\":\"" + INVALID_REQUEST + "\"}");
			} else {
				bool = false;
				RequestDispatcher dispatcher = request.getRequestDispatcher("/common/prompt/invalidRequest.shtml");
				dispatcher.forward(request, response);
			}
		}
		return bool;
	}
	
	public Pager getPager() {
		return this.pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	public int getPage() {
		return this.page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return this.pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageSEOPrefix() {
		return this.pageSEOPrefix;
	}
	public void setPageSEOPrefix(String pageSEOPrefix) {
		this.pageSEOPrefix = pageSEOPrefix;
	}
	public String getPageSEOExt() {
		return this.pageSEOExt;
	}
	public void setPageSEOExt(String pageSEOExt) {
		this.pageSEOExt = pageSEOExt;
	}
	public String getUrl() {
		return this.url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRoleKey() {
		return this.roleKey;
	}
	public void setRoleKey(String roleKey) {
		this.roleKey = CharsetUtil.charsetConverter(roleKey);
	}
	public boolean isReloadDialog() {
		return this.reloadDialog;
	}
	public void setReloadDialog(boolean reloadDialog) {
		this.reloadDialog = reloadDialog;
	}
}