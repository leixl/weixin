/*
 * @(#)IUserService.java 2012-5-30上午09:00:38
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package com.kenanai.weixin.service.user;

import com.juncsoft.framework.pojo.Pager;
import com.kenanai.weixin.entity.SUser;
import com.kenanai.weixin.entity.UserSearchVO;

/**
 * 用户Service
 * 
 * @modificationHistory. <ul>
 *                       <li>sunju 2012-5-30上午09:00:38 TODO</li>
 *                       </ul>
 */

public interface IUserService {
	/**
	 * 获得分页列表对象
	 * @author sunju
	 * @creationDate. 2012-5-30 上午09:04:22 
	 * @param vo 检索条件
	 * @param page 当前页
	 * @param pageSize 每页显示记录数
	 * @param path 分页路径
	 * @return 分页对象
	 * @throws Exception
	 */
	public Pager getPager(UserSearchVO vo, int page, int pageSize, String path) throws Exception;
	/**
	 * 获得
	 * 
	 * @author sunju
	 * @creationDate. 2012-5-30 上午09:05:13
	 * @param id
	 *            用户id
	 * @return 用户
	 * @throws Exception
	 */
	public SUser get(Integer id) throws Exception;

	/**
	 * 获得(通过用户名)
	 * 
	 * @author sunju
	 * @creationDate. 2012-5-30 上午09:05:33
	 * @param urYhm
	 *            用户名
	 * @return 用户
	 * @throws Exception
	 */
	public SUser getByYhm(String yhm) throws Exception;

	/**
	 * 获得存在状态(通过用户名)
	 * 
	 * @author sunju
	 * @creationDate. 2012-5-29 下午05:58:59
	 * @param yhm
	 *            用户名
	 * @return 布尔
	 * @throws Exception
	 */
	public boolean getExistByYhm(String yhm) throws Exception;

	/**
	 * 保存或者更新
	 * 
	 * @author sunju
	 * @creationDate. 2012-5-30 上午09:06:29
	 * @param user
	 *            用户
	 * @throws Exception
	 */
	public void saveOrUpdate(SUser user) throws Exception;

	/**
	 * 保存登录
	 * 
	 * @author sunju
	 * @creationDate. 2012-5-29 下午05:30:17
	 * @param user
	 *            用户
	 * @return 登录结果
	 * @throws Exception
	 */
	public String saveLogin(SUser user) throws Exception;

	/**
	 * 更新用户密码
	 * 
	 * @author sunju
	 * @creationDate. 2012-5-29 下午05:50:23
	 * @param oldUrMm
	 *            旧用户密码
	 * @param mm
	 *            用户密码
	 * @return 更改结果
	 * @throws Exception
	 */
	//public String updateMm(String oldUrMm, String mm) throws Exception;

	/**
	 * 删除
	 * 
	 * @author sunju
	 * @creationDate. 2012-5-30 上午09:07:08
	 * @param ids
	 *            用户id数组
	 * @throws Exception
	 */
	public void delete(Integer[] ids) throws Exception;

	/**
	 * 更新缓存
	 * 
	 * @author sunju
	 * @creationDate. 2012-6-15 上午09:19:40
	 */
	public void updateCache();
}
