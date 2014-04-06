/**
 * 
 */
package com.kenanai.weixin.web.interceptor;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

/**
 * 
 * 项目名称：54icar 类名称：Struts2Filter 类描述： 创建人：zhangjianze 创建时间：2013-6-15 下午04:11:21
 * 修改时间：2013-6-15 下午04:11:21 修改备注：
 * 
 * @version
 * 
 */
public class Struts2Filter extends StrutsPrepareAndExecuteFilter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		String filterURL = request.getRequestURI();
		if
		(

		"/DRTS/ckfinder/core/connector/java/connector.java"

		.equals(filterURL)) {

			try

			{

				fc.doFilter(req, res);

			}

			catch

			(Exception e) {

			}

		}

		else

		{

			super

			.doFilter(req, res, fc);

		}

	}

}
