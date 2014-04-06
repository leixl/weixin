/*
 * @(#)IUserDao.java 2012-5-29上午10:59:53
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package com.kenanai.weixin.dao.user;

import java.sql.SQLException;
import java.util.Date;

import com.juncsoft.framework.pojo.Pager;
import com.kenanai.weixin.entity.SUser;
import com.kenanai.weixin.entity.UserSearchVO;

/**
 * 用户DAO
 * @modificationHistory.  
 * <ul>
 * <li>sunju 2012-5-29上午10:59:53 TODO</li>
 * </ul> 
 */

public interface IUserDAO {
	/**
	 * 获得分页列表对象
	 * @author sunju
	 * @creationDate. 2012-5-29 下午02:26:01 
	 * @param vo 检索条件
	 * @param page 当前页
	 * @param pageSize 每页显示记录数
	 * @param path 分页路径
	 * @return 分页对象
	 * @throws SQLException
	 */
	public Pager getPager(UserSearchVO vo, int page, int pageSize, String path) throws SQLException;
	/**
	 * 根据ID获得用户
	 * @author sunju
	 * @creationDate. 2012-5-29 下午02:28:14 
	 * @param id 用户id
	 * @return 用户
	 * @throws SQLException
	 */
	public SUser get(Integer id) throws SQLException;
	/**
	 * 获得(通过用户名)
	 * @author sunju
	 * @creationDate. 2012-5-29 下午02:29:50 
	 * @param yhm 用户名
	 * @return 用户
	 * @throws SQLException
	 */
	public SUser getByYhm(String yhm) throws SQLException;
	/**
	 * 获得存在状态(通过用户名)
	 * @author sunju
	 * @creationDate. 2012-5-29 下午05:58:59 
	 * @param yhm 用户名
	 * @return 布尔
	 * @throws SQLException
	 */
	public boolean getExistByYhm(String yhm) throws SQLException;
	/**
	 * 保存或者更新
	 * @author sunju
	 * @creationDate. 2012-5-29 下午02:32:19 
	 * @param user 用户
	 * @throws SQLException
	 */
	public void saveOrUpdate(SUser user) throws SQLException;
	/**
	 * 更新用户登录时间
	 * @author sunju
	 * @creationDate. 2012-5-29 下午05:40:15 
	 * @param id 用户id
	 * @param dlsj 登录时间
	 * @throws SQLException
	 */
	public void updateDlsj(Integer id, Date dlsj) throws SQLException;
	/**
	 * 更新用户密码
	 * @author sunju
	 * @creationDate. 2012-5-29 下午05:50:23 
	 * @param id 用户id
	 * @param mm 用户密码
	 * @throws SQLException
	 */
	public void updateMm(Integer id, String mm) throws SQLException;
	/**
	 * 删除
	 * @author sunju
	 * @creationDate. 2012-5-29 下午02:37:05 
	 * @param ids 用户id数组
	 * @throws SQLException
	 */
	public void delete(Integer[] ids) throws SQLException;
	/**
	 * 更新缓存
	 * @author sunju
	 * @creationDate. 2012-6-15 上午09:22:36
	 */
	public void updateCache();
}
