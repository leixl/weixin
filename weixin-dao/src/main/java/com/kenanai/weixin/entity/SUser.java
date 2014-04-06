package com.kenanai.weixin.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * SUser entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "S_USER")
public class SUser implements java.io.Serializable {

	// Fields

	/**
	 * serialVersionUID:TODO（用一句话描述这个变量表示什么）
	 *
	 * @since v 1.1
	 */
	
	private static final long serialVersionUID = 1L;
	private Integer urId;
	private String urYhm;
	private String urXm;
	private String urMm;
	private Date urDlsj;
	
	// Extend Fields
	private String oldUrMm;		// 旧密码（用于修改密码时候校验旧密码正确性）

	// Constructors

	/** default constructor */
	public SUser() {
	}

	/** full constructor */
	public SUser(String urYhm, String urXm, String urMm, Date urDlsj) {
		this.urYhm = urYhm;
		this.urXm = urXm;
		this.urMm = urMm;
		this.urDlsj = urDlsj;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "UR_ID", unique = true, nullable = false)
	public Integer getUrId() {
		return this.urId;
	}

	public void setUrId(Integer urId) {
		this.urId = urId;
	}

	@Column(name = "UR_YHM", length = 10)
	public String getUrYhm() {
		return this.urYhm;
	}

	public void setUrYhm(String urYhm) {
		this.urYhm = urYhm;
	}

	@Column(name = "UR_XM", length = 30)
	public String getUrXm() {
		return this.urXm;
	}

	public void setUrXm(String urXm) {
		this.urXm = urXm;
	}

	@Column(name = "UR_MM", length = 32)
	public String getUrMm() {
		return this.urMm;
	}

	public void setUrMm(String urMm) {
		this.urMm = urMm;
	}

	@Column(name = "UR_DLSJ", length = 19)
	public Date getUrDlsj() {
		return this.urDlsj;
	}

	public void setUrDlsj(Date urDlsj) {
		this.urDlsj = urDlsj;
	}
	
	@Transient
	public String getOldUrMm() {
		return this.oldUrMm;
	}

	public void setOldUrMm(String oldUrMm) {
		this.oldUrMm = oldUrMm;
	}

}