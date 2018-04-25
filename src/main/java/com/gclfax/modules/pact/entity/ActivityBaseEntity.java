package com.gclfax.modules.pact.entity;

import java.io.Serializable;


/**
 * 活动基础信息表
 * 
 * @author chenwenjie
 * @email 
 * @date 2018-01-24 17:21:30
 */
public class ActivityBaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//活动名称
	private String name;
	//活动类型1、抽奖；2、答题
	private Integer type;
	//活动开始日期
	private java.sql.Date startDate;
	//活动开始时间
	private java.sql.Time startTime;
	//活动结束日期
	private java.sql.Date endDate;
	//活动结束时间
	private java.sql.Time endTime;

	/**
	 * 设置：
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：活动名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：活动名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：活动类型1、抽奖；2、答题
	 */
	public void setType(Integer type) {
		this.type = type;
	}
	/**
	 * 获取：活动类型1、抽奖；2、答题
	 */
	public Integer getType() {
		return type;
	}
	/**
	 * 设置：活动开始日期
	 */
	public void setStartDate(java.sql.Date startDate) {
		this.startDate = startDate;
	}
	/**
	 * 获取：活动开始日期
	 */
	public java.sql.Date getStartDate() {
		return startDate;
	}
	/**
	 * 设置：活动开始时间
	 */
	public void setStartTime(java.sql.Time startTime) {
		this.startTime = startTime;
	}
	/**
	 * 获取：活动开始时间
	 */
	public java.sql.Time getStartTime() {
		return startTime;
	}
	/**
	 * 设置：活动结束日期
	 */
	public void setEndDate(java.sql.Date endDate) {
		this.endDate = endDate;
	}
	/**
	 * 获取：活动结束日期
	 */
	public java.sql.Date getEndDate() {
		return endDate;
	}
	/**
	 * 设置：活动结束时间
	 */
	public void setEndTime(java.sql.Time endTime) {
		this.endTime = endTime;
	}
	/**
	 * 获取：活动结束时间
	 */
	public java.sql.Time getEndTime() {
		return endTime;
	}
}
