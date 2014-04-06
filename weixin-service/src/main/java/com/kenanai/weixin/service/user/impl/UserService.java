/*
 * @(#)UserService.java 2012-5-30上午09:09:19
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package com.kenanai.weixin.service.user.impl;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.easyframework.core.ConstantsUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.juncsoft.framework.pojo.Pager;
import com.juncsoft.framework.util.cipher.MD5;
import com.juncsoft.framework.util.text.StringUtils;
import com.kenanai.weixin.dao.user.IUserDAO;
import com.kenanai.weixin.entity.SUser;
import com.kenanai.weixin.entity.UserSearchVO;
import com.kenanai.weixin.service.user.IUserService;
import com.opensymphony.xwork2.Action;

/**
 * 用户Service实现类
 * @modificationHistory.  
 * <ul>
 * <li>sunju2012-5-30上午09:09:19 TODO</li>
 * </ul> 
 */
@Service
public class UserService implements IUserService {
	@Resource
	private IUserDAO userDAO;

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.service.IUserService#getPager(com.juncsoft.portal.user.pojo.UserSearchVO, int, int, java.lang.String)
	 */
	@Override
	public Pager getPager(UserSearchVO vo, int page, int pageSize, String path) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getPager(vo, page, pageSize, path);
	}

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.service.IUserService#get(java.lang.Integer)
	 */
	@Override
	public SUser get(Integer urId) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.get(urId);
	}

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.service.IUserService#getByYhm(java.lang.String)
	 */
	@Override
	public SUser getByYhm(String yhm) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getByYhm(yhm);
	}
	
	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.service.IUserService#getExistByYhm(java.lang.String)
	 */
	@Override
	public boolean getExistByYhm(String yhm) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getExistByYhm(yhm);
	}

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.service.IUserService#saveOrUpdate(com.juncsoft.portal.user.entity.SUser)
	 */
	@Override
	public void saveOrUpdate(SUser user) throws Exception {
		if (user != null) {
			SUser newUser = new SUser();
			Integer id = user.getUrId();
			if (id != null) {// 修改
				newUser = userDAO.get(id);
				newUser.setUrYhm(user.getUrYhm());
				newUser.setUrXm(user.getUrXm());
				if (StringUtils.isNotEmpty(user.getUrMm())) {// 密码重置
					newUser.setUrMm(MD5.getMD5ofStr(user.getUrMm()));
				}
			} else {// 添加
				BeanUtils.copyProperties(user, newUser);
				newUser.setUrMm(MD5.getMD5ofStr(newUser.getUrMm()));
			}
			userDAO.saveOrUpdate(newUser);
		}
	}

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.service.IUserService#saveLogin(com.juncsoft.portal.user.entity.SUser)
	 */
	@Override
	public String saveLogin(SUser user) throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		SUser sysUser = userDAO.getByYhm(user.getUrYhm());
		if (sysUser == null) {
			return "invalidName";
		} else {
			String dlmm = MD5.getMD5ofStr(user.getUrMm());
			String mm = sysUser.getUrMm();
			if (!dlmm.equals(mm)) {
				return "invalidPwd";
			}
			// 登录成功记录最后登录时间
			userDAO.updateDlsj(sysUser.getUrId(), new Date());
			
			// 保存session信息
			SUser sessionUser = new SUser();
			sessionUser.setUrId(sysUser.getUrId());
			sessionUser.setUrYhm(sysUser.getUrYhm());
			sessionUser.setUrXm(sysUser.getUrXm());
			request.getSession().setAttribute(ConstantsUtil.SESSIONID_SYSTEMUSER, sessionUser);
		}
		return Action.SUCCESS;
	}
	
	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.service.IUserService#updateMm(java.lang.String, java.lang.String)
	 */
	
	
	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.service.IUserService#delete(java.lang.Integer[])
	 */
	@Override
	public void delete(Integer[] urIds) throws Exception {
		userDAO.delete(urIds);
	}

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.service.IUserService#updateCache()
	 */
	@Override
	public void updateCache() {
		userDAO.updateCache();
	}

}
