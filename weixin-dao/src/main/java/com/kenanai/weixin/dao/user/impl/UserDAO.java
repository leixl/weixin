/*
 * @(#)UserDaoImpl.java 2012-5-29下午02:39:02
 * Copyright 2012 juncsoft, Inc. All rights reserved.
 */
package com.kenanai.weixin.dao.user.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.easyframework.core.CacheConstantsUtil;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.juncsoft.framework.adapter.hibernate.dao.IBaseDAO;
import com.juncsoft.framework.adapter.hibernate.dao.ISqlDAO;
import com.juncsoft.framework.adapter.hibernate.dao.ISqlMapDAO;
import com.juncsoft.framework.adapter.hibernate.dao.impl.CriteriaDAO;
import com.juncsoft.framework.pojo.Pager;
import com.juncsoft.framework.util.date.DateUtil;
import com.juncsoft.framework.util.text.StringUtils;
import com.kenanai.weixin.dao.user.IUserDAO;
import com.kenanai.weixin.entity.SUser;
import com.kenanai.weixin.entity.UserSearchVO;

/**
 * 用户DAO实现类
 * @modificationHistory.  
 * <ul>
 * <li>sunju 2012-5-29下午02:39:02 TODO</li>
 * </ul> 
 */
@Repository
@SuppressWarnings("unchecked")
public class UserDAO implements IUserDAO {
	@Resource
	private IBaseDAO baseDAO;
	@Resource
	private ISqlDAO sqlDAO;
	@Resource
	private ISqlMapDAO sqlMapDAO;
	@Resource
	private CriteriaDAO criteriaDAO;
	private static final String CACHE_NAME = CacheConstantsUtil.CACHE_NAME_USER;
	private static final String CACHE_CONDITION_VO_ISNULL = CacheConstantsUtil.CACHE_CONDITION_VO_ISNULL;

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.dao.IUserDAO#getPager(com.juncsoft.portal.user.pojo.UserSearchVO, int, int, java.lang.String)
	 */
	@Override
	@Cacheable(value = CACHE_NAME, condition = CACHE_CONDITION_VO_ISNULL)
	public Pager getPager(UserSearchVO vo, int page, int pageSize, String path)
			throws SQLException {
		// TODO Auto-generated method stub
		List<Object> queryParams = new ArrayList<Object>();
		Map<Object, Object> paramsMap = new HashMap<Object, Object>();
		
		StringBuilder querySQL = new StringBuilder("SELECT *");
		querySQL.append(" FROM S_USER");
		querySQL.append(" WHERE 1=1");
		if (vo != null) {// 条件检索
			// 关键字
			String keywordColumn = null;
			if (vo.getKeywordType() != null){
				switch (vo.getKeywordType()) {
				case 1: // 用户名
					keywordColumn = "UR_YHM";
					break;
				case 2: // 姓名
					keywordColumn = "UR_XM";
					break;
					
				default:
					break;
				}
			}
			if (keywordColumn != null) {
				if (vo.getKeyword() != null && !"".equals(vo.getKeyword().trim())) {
					querySQL.append(" AND ").append(keywordColumn).append(" LIKE ?");
					// 装载查询参数
					queryParams.add("%" + vo.getKeyword().trim() + "%");
					// 装载搜索参数
					paramsMap.put("vo.keyword", vo.getKeyword().trim());
					paramsMap.put("vo.keywordType", vo.getKeywordType());
				}
			}
			// 最后登录时间
			if (vo.getBeginTime() != null) {
				querySQL.append(" AND UR_DLSJ>=?");
				queryParams.add(vo.getBeginTime());
				paramsMap.put("vo.beginTime", DateUtil.dateFormat(vo.getBeginTime(), DateUtil.DATE_FORMAT_YMD));
			}
			if (vo.getEndTime() != null) {
				querySQL.append(" AND UR_DLSJ<?");
				Date nextDate = DateUtil.dateAdd(DateUtil.DATE_INTERVAL_DAY, vo.getEndTime(), 1);
				queryParams.add(nextDate);
				paramsMap.put("vo.endTime", DateUtil.dateFormat(vo.getEndTime(), DateUtil.DATE_FORMAT_YMD));
			}
		}
		querySQL.append(" ORDER BY UR_ID DESC");
		return sqlMapDAO.queryForPager(querySQL.toString(), queryParams.toArray(), page, pageSize, path, paramsMap);
	}

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.dao.IUserDAO#get(java.lang.Integer)
	 */
	@Override
	@Cacheable(value = CACHE_NAME)
	public SUser get(Integer id) throws SQLException {
		// TODO Auto-generated method stub
		return (SUser) baseDAO.get(SUser.class, id);
	}

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.dao.IUserDAO#getByYhm(java.lang.String)
	 */
	@Override
	@Cacheable(value = CACHE_NAME)
	public SUser getByYhm(String yhm) throws SQLException {
		// TODO Auto-generated method stub
		DetachedCriteria dc = DetachedCriteria.forClass(SUser.class);
		dc.add(Restrictions.eq("urYhm", yhm));
		List<SUser> list = criteriaDAO.queryForList(dc, 1, 1);
		return (list != null && list.size() > 0) ? list.get(0) : null;
	}
	
	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.dao.IUserDAO#getExistByYhm(java.lang.String)
	 */
	@Override
	@Cacheable(value = CACHE_NAME)
	public boolean getExistByYhm(String yhm) throws SQLException {
		// TODO Auto-generated method stub
		String countSQL = "SELECT COUNT(0) FROM S_USER WHERE UR_YHM=?";
		Object[] countParams = {yhm};
		long count = sqlDAO.queryForLong(countSQL, countParams);
		return (count > 0) ? true : false;
	}
	
	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.dao.IUserDAO#saveOrUpdate(com.juncsoft.portal.user.entity.SUser)
	 */
	@Override
	@CacheEvict(value = CACHE_NAME, allEntries = true)
	public void saveOrUpdate(SUser user) throws SQLException {
		// TODO Auto-generated method stub
		baseDAO.saveOrUpdate(user);
	}

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.dao.IUserDAO#updateDlsj(java.lang.Integer, java.util.Date)
	 */
	@Override
	@CacheEvict(value = CACHE_NAME, allEntries = true)
	public void updateDlsj(Integer id, Date dlsj) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "UPDATE S_USER SET UR_DLSJ=? WHERE UR_ID=?";
		Object[] sqlParams = {dlsj, id};
		sqlDAO.execute(sql, sqlParams);
	}
	
	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.dao.IUserDAO#updateMm(java.lang.Integer, java.lang.String)
	 */
	@Override
	@CacheEvict(value = CACHE_NAME, allEntries = true)
	public void updateMm(Integer id, String mm) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "UPDATE S_USER SET UR_MM=? WHERE UR_ID=?";
		Object[] sqlParams = {mm, id};
		sqlDAO.execute(sql, sqlParams);
	}

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.dao.IUserDAO#delete(java.lang.Integer[])
	 */
	@Override
	@CacheEvict(value = CACHE_NAME, allEntries = true)
	public void delete(Integer[] ids) throws SQLException {
		// TODO Auto-generated method stub
		if (ids != null && ids.length > 0) {
			List<Object> sqlParams = new ArrayList<Object>();
			StringBuilder sql = new StringBuilder("DELETE FROM S_USER");
			
			StringBuilder whereSQL = new StringBuilder(" WHERE 1=1");
			
			String fun = " OR ";
			StringBuilder temp = new StringBuilder("");
			for (Integer value : ids) {
				temp.append(fun).append("UR_ID").append("=?");
				sqlParams.add(value);
			}
			String paramStr = temp.toString();
			if (StringUtils.isNotEmpty(paramStr)) {
				String result = (new StringBuilder("(").append(paramStr).append(")")).toString();
				result = result.replaceFirst(fun, "");
				whereSQL.append(" AND ").append(result);
			}
			sql.append(whereSQL);
			sqlDAO.execute(sql.toString(), sqlParams.toArray());
		}
	}

	/* (non-Javadoc)
	 * @see com.juncsoft.portal.user.dao.IUserDAO#updateCache()
	 */
	@Override
	@CacheEvict(value = CACHE_NAME, allEntries = true)
	public void updateCache() {
		// TODO Auto-generated method stub
	}

}