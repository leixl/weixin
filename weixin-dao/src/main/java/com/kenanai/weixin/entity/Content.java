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
import java.util.List;

/**
 * 
 * @author leixl
 * @date 2013-12-20 下午5:29:15
 * @version v1.0
 */
public class Content implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5686872780036525372L;

	// constructors
	public Content() {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public Content(Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize() {
	}
	
	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private Integer id;
	private String name;
	private String simpleName;
	private String aliasName1;
	private String aliasName2;
	private String title;
	private String link;
	private String imdbNo;
	private String director;
	private String scenarist;
	private String area;
	private String publishYear;
	private String screeningDate;
	private Integer leng;
	private String remark;
	private Date createDate;
	private Date updateDate;
	private Boolean recommend;
	private String cover;
	private String downloadUrl;
	private String downloadUrlxl;
	private Boolean disabled;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSimpleName() {
		return simpleName;
	}

	public void setSimpleName(String simpleName) {
		this.simpleName = simpleName;
	}

	public String getAliasName1() {
		return aliasName1;
	}

	public void setAliasName1(String aliasName1) {
		this.aliasName1 = aliasName1;
	}

	public String getAliasName2() {
		return aliasName2;
	}

	public void setAliasName2(String aliasName2) {
		this.aliasName2 = aliasName2;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getImdbNo() {
		return imdbNo;
	}

	public void setImdbNo(String imdbNo) {
		this.imdbNo = imdbNo;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getScenarist() {
		return scenarist;
	}

	public void setScenarist(String scenarist) {
		this.scenarist = scenarist;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPublishYear() {
		return publishYear;
	}

	public void setPublishYear(String publishYear) {
		this.publishYear = publishYear;
	}

	public String getScreeningDate() {
		return screeningDate;
	}

	public void setScreeningDate(String screeningDate) {
		this.screeningDate = screeningDate;
	}

	public Integer getLeng() {
		return leng;
	}

	public void setLeng(Integer leng) {
		this.leng = leng;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
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

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}
    
	/**
	 * @return the downloadUrl
	 */
	public String getDownloadUrl() {
		return downloadUrl;
	}

	/**
	 * @param downloadUrl the downloadUrl to set
	 */
	public void setDownloadUrl(String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}

	/**
	 * @return the downloadUrlxl
	 */
	public String getDownloadUrlxl() {
		return downloadUrlxl;
	}

	/**
	 * @param downloadUrlxl the downloadUrlxl to set
	 */
	public void setDownloadUrlxl(String downloadUrlxl) {
		this.downloadUrlxl = downloadUrlxl;
	}

	public Boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	
	
}
