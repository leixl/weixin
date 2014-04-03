/**
 * Project: easyframework-dao
 * 
 * File Created at 2013-12-20
 * $Id$
 * 
 * Copyright 2013 leixl.com Croporation Limited.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 */
package com.kenanai.weixin.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 
* @ClassName: Content 
* @Description: 文章内容实体
* @author leixl 
* @date 2014年4月4日 上午12:16:10 
*
 */
public class Content implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5686872780036525372L;


	// primary key
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "titleImg")
	private String titleImg;
	
	@Column(name = "LINK")
	private String link;
	
	@Column(name = "TXT")
	private String txt;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_DATE")
	private Date createDate;
	
	@Column(name = "IS_RECOMMEND")
	private Boolean recommend;
	
	@Column(name = "IS_DISABLE")
	private Boolean disabled;

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the titleImg
	 */
	public String getTitleImg() {
		return titleImg;
	}

	/**
	 * @param titleImg the titleImg to set
	 */
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	/**
	 * @return the link
	 */
	public String getLink() {
		return link;
	}

	/**
	 * @param link the link to set
	 */
	public void setLink(String link) {
		this.link = link;
	}

	/**
	 * @return the txt
	 */
	public String getTxt() {
		return txt;
	}

	/**
	 * @param txt the txt to set
	 */
	public void setTxt(String txt) {
		this.txt = txt;
	}

	/**
	 * @return the createDate
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return the recommend
	 */
	public Boolean getRecommend() {
		return recommend;
	}

	/**
	 * @param recommend the recommend to set
	 */
	public void setRecommend(Boolean recommend) {
		this.recommend = recommend;
	}

	/**
	 * @return the disabled
	 */
	public Boolean getDisabled() {
		return disabled;
	}

	/**
	 * @param disabled the disabled to set
	 */
	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	

}
