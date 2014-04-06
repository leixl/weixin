/*
 * @(#)UserSearchVO.java 2012-5-31下午01:47:39
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package com.kenanai.weixin.entity;

import java.io.Serializable;
import java.util.Date;

import com.juncsoft.framework.util.charset.CharsetUtil;

/**
 * 用户检索VO
 * @modificationHistory.  
 * <ul>
 * <li>sunju2012-5-31下午01:47:39 TODO</li>
 * </ul> 
 */

public class UserSearchVO implements Serializable {

	/**
	 * serialVersionUID:TODO（用一句话描述这个变量表示什么）
	 *
	 * @since v 1.1
	 */
	
	private static final long serialVersionUID = 1L;
	private String keyword;			// 搜索关键字
	private Short keywordType;		// 关键字类别
	public Short getKeywordType() {
		return this.keywordType;
	}
	public void setKeywordType(Short keywordType) {
		this.keywordType = keywordType;
	}
	private Date beginTime;			// 开始时间
	private Date endTime;			// 结束时间
	public String getKeyword() {
		return this.keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = CharsetUtil.charsetConverter(keyword);
	}
	public Date getBeginTime() {
		return this.beginTime;
	}
	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}
	public Date getEndTime() {
		return this.endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
}
