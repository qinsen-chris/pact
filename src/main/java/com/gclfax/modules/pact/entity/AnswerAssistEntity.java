package com.gclfax.modules.pact.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户答题助力表
 * 
 * @author chenwenjie
 * @email 
 * @date 2018-01-24 17:21:30
 */
public class AnswerAssistEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//活动Id
	private Long activityId;
	//设备唯一标识（微信则是openID）
	private String equipId;
	//奖励ID
	private Long awardId;
	//助力时间
	private Date asistTime;
	//增加奖励金数量
	private Integer addBounty;

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
	 * 设置：活动Id
	 */
	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}
	/**
	 * 获取：活动Id
	 */
	public Long getActivityId() {
		return activityId;
	}
	/**
	 * 设置：设备唯一标识（微信则是openID）
	 */
	public void setEquipId(String equipId) {
		this.equipId = equipId;
	}
	/**
	 * 获取：设备唯一标识（微信则是openID）
	 */
	public String getEquipId() {
		return equipId;
	}
	/**
	 * 设置：奖励ID
	 */
	public void setAwardId(Long awardId) {
		this.awardId = awardId;
	}
	/**
	 * 获取：奖励ID
	 */
	public Long getAwardId() {
		return awardId;
	}
	/**
	 * 设置：助力时间
	 */
	public void setAsistTime(Date asistTime) {
		this.asistTime = asistTime;
	}
	/**
	 * 获取：助力时间
	 */
	public Date getAsistTime() {
		return asistTime;
	}
	/**
	 * 设置：增加奖励金数量
	 */
	public void setAddBounty(Integer addBounty) {
		this.addBounty = addBounty;
	}
	/**
	 * 获取：增加奖励金数量
	 */
	public Integer getAddBounty() {
		return addBounty;
	}
}
