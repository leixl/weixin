/**   
* @Title: ContentDao.java 
* @Package com.kenanai.weixin.dao.news 
* @Description: TODO(描述) 
* @author leixl   
* @date 2014年4月4日 上午12:17:02  
*/ 


package com.kenanai.weixin.dao.news;

import org.easyframework.core.hibernate3.HibernateBaseDao;
import org.springframework.stereotype.Repository;

import com.kenanai.weixin.entity.Content;

/** 
 * @ClassName: ContentDao 
 * @Description: 文章内容DAO
 * @author leixl 
 * @date 2014年4月4日 上午12:17:02 
 *  
 */
@Repository
public class ContentDao extends HibernateBaseDao<Content, Integer>{

	

}
